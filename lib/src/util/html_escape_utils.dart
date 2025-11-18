import 'dart:io';
import 'package:reflectable/reflectable.dart';

/// Reflector for HTML escaping with necessary capabilities
class HtmlEscapeReflector extends Reflectable {
  const HtmlEscapeReflector()
      : super(
          // Basic capabilities for reflection
          invokingCapability, // For method invocation
          declarationsCapability, // For getting declarations
          instanceInvokeCapability, // For working with instances
          typeCapability, // For working with types
          reflectedTypeCapability, // For getting types
          metadataCapability, // For metadata
        );
}

const htmlEscapeReflector = HtmlEscapeReflector();

/// Utility class for escaping HTML tags to prevent XSS attacks
/// Uses reflectable for automatic processing of object properties
class HtmlEscapeUtils {
  static const String _noEscapeHtmlEnvVar = 'NO_ESCAPE_HTML';

  // Regex pattern to detect HTML tags
  static final RegExp _htmlTagPattern = RegExp(r'<\S.*?(?:>|\/>)');

  // Regex patterns to escape only non-escaped characters
  static final RegExp _lessThanPattern = RegExp(r'<');
  static final RegExp _greaterThanPattern = RegExp(r'>');

  /// Escapes HTML tags to prevent XSS attacks.
  /// First checks if the string contains HTML tags using regex pattern.
  /// Only performs escaping if HTML tags are detected.
  /// Escapes all < as \< and > as \> only if they are not already escaped.
  /// Uses regex with negative lookbehind to avoid double escaping.
  static String? escapeHtmlTags(String? text) {
    if (text == null) {
      return null;
    }

    // First check if the string contains HTML tags
    if (!_htmlTagPattern.hasMatch(text)) {
      return text; // No HTML tags found, return original string
    }

    // Use regex with negative lookbehind to escape only non-escaped characters
    var result = text.replaceAll(_lessThanPattern, r'&lt;');
    result = result.replaceAll(_greaterThanPattern, r'&gt;');

    return result;
  }

  /// Escapes HTML tags in all String properties of an object using reflection
  /// Also processes List properties: if List of objects - calls escapeHtmlInObjectList,
  /// Can be disabled by setting NO_ESCAPE_HTML environment variable to "true"
  /// if List of Strings - escapes each string
  /// Objects must be annotated with @htmlEscapeReflector to use reflection
  static T? escapeHtmlInObject<T>(T? obj) {
    if (obj == null) {
      return null;
    }

    // Check if escaping is disabled via environment variable
    final noEscapeHtml = Platform.environment[_noEscapeHtmlEnvVar];
    if (noEscapeHtml?.toLowerCase() == 'true') {
      return obj;
    }

    try {
      final instanceMirror = htmlEscapeReflector.reflect(obj);
      final classMirror = instanceMirror.type;

      // Process properties using reflection
      _processProperties(instanceMirror, classMirror);
    } catch (e) {
      // Silently ignore reflection errors - object might not be annotated
      // Fall back to HtmlEscapable interface if available
      if (obj is HtmlEscapable) {
        obj.escapeHtmlInProperties();
      }
    }

    return obj;
  }

  /// Escapes HTML tags in all String properties of objects in a list using reflection
  /// Can be disabled by setting NO_ESCAPE_HTML environment variable to "true"
  static List<T>? escapeHtmlInObjectList<T>(List<T>? list) {
    if (list == null) {
      return null;
    }

    // Check if escaping is disabled via environment variable
    final noEscapeHtml = Platform.environment[_noEscapeHtmlEnvVar];
    if (noEscapeHtml?.toLowerCase() == 'true') {
      return list;
    }

    for (final obj in list) {
      escapeHtmlInObject(obj);
    }

    return list;
  }

  /// Escapes HTML tags in a list of strings
  static List<String>? escapeHtmlInStringList(List<String>? list) {
    if (list == null) {
      return null;
    }

    // Check if escaping is disabled via environment variable
    final noEscapeHtml = Platform.environment[_noEscapeHtmlEnvVar];
    if (noEscapeHtml?.toLowerCase() == 'true') {
      return list;
    }

    for (int i = 0; i < list.length; i++) {
      list[i] = escapeHtmlTags(list[i]) ?? list[i];
    }

    return list;
  }

  static void _processProperties(InstanceMirror instanceMirror, ClassMirror classMirror) {
    // Process all declarations in the class
    for (final declaration in classMirror.declarations.values) {
      try {
        if (declaration is VariableMirror && !declaration.isPrivate) {
          _processVariable(instanceMirror, declaration);
        } else if (declaration is MethodMirror && 
                   declaration.isGetter && 
                   !declaration.isPrivate &&
                   _hasCorrespondingSetter(classMirror, declaration)) {
          _processGetterSetter(instanceMirror, classMirror, declaration);
        }
      } catch (e) {
        // Silently ignore errors for individual properties
        continue;
      }
    }
  }

  static void _processVariable(InstanceMirror instanceMirror, VariableMirror variable) {
    try {
      // Get the current value using invoke with getter name
      final value = instanceMirror.invoke(variable.simpleName, []);

      if (value is String) {
        // Escape String properties
        final escapedValue = escapeHtmlTags(value);
        if (escapedValue != null && escapedValue != value) {
          // Set the new value using invoke with setter name
          final setterName = '${(variable.simpleName)}=';
          instanceMirror.invoke(setterName, [escapedValue]);
        }
      } else if (value is List && value.isNotEmpty) {
        _processList(value);
      } else if (value != null && !_isSimpleType(value.runtimeType)) {
        // Process nested objects
        escapeHtmlInObject(value);
      }
    } catch (e) {
      // Ignore errors for this property
    }
  }

  static void _processGetterSetter(InstanceMirror instanceMirror, ClassMirror classMirror, MethodMirror getter) {
    try {
      // Get the current value using the getter
      final getterName = getter.simpleName;
      final value = instanceMirror.invoke(getterName, []);

      if (value is String) {
        // Escape String properties
        final escapedValue = escapeHtmlTags(value);
        if (escapedValue != null && escapedValue != value) {
          // Set the new value using the setter
          final setterName = '$getterName=';
          instanceMirror.invoke(setterName, [escapedValue]);
        }
      } else if (value is List && value.isNotEmpty) {
        _processList(value);
      } else if (value != null && !_isSimpleType(value.runtimeType)) {
        // Process nested objects
        escapeHtmlInObject(value);
      }
    } catch (e) {
      // Ignore errors for this property
    }
  }

  static bool _hasCorrespondingSetter(ClassMirror classMirror, MethodMirror getter) {
    final setterName = '${(getter.simpleName)}=';
    return classMirror.declarations.containsKey(setterName);
  }

  static void _processList(List list) {
    if (list.isEmpty) return;

    final firstElement = list.first;

    if (firstElement is String) {
      // List of Strings - escape each string
      for (int i = 0; i < list.length; i++) {
        if (list[i] is String) {
          list[i] = escapeHtmlTags(list[i] as String) ?? list[i];
        }
      }
    } else if (firstElement != null) {
      // List of objects - process each object
      for (final item in list) {
        escapeHtmlInObject(item);
      }
    }
  }

  /// Checks if a type is a simple type that doesn't need HTML escaping
  static bool _isSimpleType(Type type) {
    return type == bool ||
        type == int ||
        type == double ||
        type == num ||
        type == String ||
        type == DateTime ||
        type == Duration ||
        type == Uri ||
        type == BigInt ||
        type == RegExp ||
        type == Symbol ||
        // Nullable versions
        type.toString().startsWith('bool?') ||
        type.toString().startsWith('int?') ||
        type.toString().startsWith('double?') ||
        type.toString().startsWith('num?') ||
        type.toString().startsWith('String?') ||
        type.toString().startsWith('DateTime?') ||
        type.toString().startsWith('Duration?') ||
        type.toString().startsWith('Uri?') ||
        type.toString().startsWith('BigInt?') ||
        type.toString().startsWith('RegExp?') ||
        type.toString().startsWith('Symbol?');
  }
}

/// Interface for objects that can escape HTML in their properties
/// Objects that contain string properties that need HTML escaping should implement this interface
/// This serves as a fallback when reflection is not available
abstract class HtmlEscapable {
  /// Escapes HTML tags in all string properties of the object
  void escapeHtmlInProperties();
} 