import 'dart:io';

/// Utility class for escaping HTML tags to prevent XSS attacks.
class HtmlEscapeUtils {
  static const String _noEscapeHtmlEnvVar = 'NO_ESCAPE_HTML';

  static final RegExp _htmlTagPattern = RegExp(r'<\S.*?(?:>|\/>)');
  static final RegExp _lessThanPattern = RegExp(r'<');
  static final RegExp _greaterThanPattern = RegExp(r'>');

  /// Escapes HTML tags to prevent XSS attacks.
  /// Only performs escaping if HTML tags are detected.
  static String? escapeHtmlTags(String? text) {
    if (text == null) {
      return null;
    }

    if (!_htmlTagPattern.hasMatch(text)) {
      return text;
    }

    var result = text.replaceAll(_lessThanPattern, r'&lt;');
    result = result.replaceAll(_greaterThanPattern, r'&gt;');

    return result;
  }

  /// Escapes HTML tags in all string properties of [obj].
  /// Can be disabled by setting NO_ESCAPE_HTML environment variable to "true".
  static T? escapeHtmlInObject<T>(T? obj) {
    if (obj == null) {
      return null;
    }

    if (_isEscapeDisabled()) {
      return obj;
    }

    if (obj is HtmlEscapable) {
      obj.escapeHtmlInProperties();
    }

    return obj;
  }

  /// Escapes HTML tags in all string properties of objects in [list].
  static List<T>? escapeHtmlInObjectList<T>(List<T>? list) {
    if (list == null) {
      return null;
    }

    if (_isEscapeDisabled()) {
      return list;
    }

    for (final obj in list) {
      escapeHtmlInObject(obj);
    }

    return list;
  }

  /// Escapes HTML tags in a list of strings.
  static List<String>? escapeHtmlInStringList(List<String>? list) {
    if (list == null) {
      return null;
    }

    if (_isEscapeDisabled()) {
      return list;
    }

    for (var i = 0; i < list.length; i++) {
      list[i] = escapeHtmlTags(list[i]) ?? list[i];
    }

    return list;
  }

  static bool _isEscapeDisabled() {
    final noEscapeHtml = Platform.environment[_noEscapeHtmlEnvVar];
    return noEscapeHtml?.toLowerCase() == 'true';
  }
}

/// Interface for objects that can escape HTML in their properties.
abstract class HtmlEscapable {
  void escapeHtmlInProperties();
}
