import 'package:flutter_test/flutter_test.dart';
import 'package:testit_adapter_flutter/src/util/html_escape_utils.dart';

class TestModel implements HtmlEscapable {
  String? title;
  String? description;
  String? normalText;
  int? number;
  List<String> tags = [];
  List<TestNestedModel> nestedModels = [];

  TestModel({
    this.title,
    this.description,
    this.normalText,
    this.number,
    List<String>? tags,
    List<TestNestedModel>? nestedModels,
  }) {
    this.tags = tags ?? [];
    this.nestedModels = nestedModels ?? [];
  }

  @override
  void escapeHtmlInProperties() {
    title = HtmlEscapeUtils.escapeHtmlTags(title);
    description = HtmlEscapeUtils.escapeHtmlTags(description);
    normalText = HtmlEscapeUtils.escapeHtmlTags(normalText);

    HtmlEscapeUtils.escapeHtmlInStringList(tags);
    HtmlEscapeUtils.escapeHtmlInObjectList(nestedModels);
  }
}

class TestNestedModel implements HtmlEscapable {
  String? name;
  String? value;

  TestNestedModel({this.name, this.value});

  @override
  void escapeHtmlInProperties() {
    name = HtmlEscapeUtils.escapeHtmlTags(name);
    value = HtmlEscapeUtils.escapeHtmlTags(value);
  }
}

void main() {
  group('HtmlEscapeUtils', () {
    test('should return null for null input', () {
      expect(HtmlEscapeUtils.escapeHtmlTags(null), isNull);
    });

    test('should return original string if no HTML tags found', () {
      const input = 'This is just plain text';
      expect(HtmlEscapeUtils.escapeHtmlTags(input), equals(input));
    });

    test('should escape HTML tags', () {
      const input = '<script>alert("xss")</script>';
      const expected = r'&lt;script&gt;alert("xss")&lt;/script&gt;';
      expect(HtmlEscapeUtils.escapeHtmlTags(input), equals(expected));
    });

    test('should escape self-closing HTML tags', () {
      const input = '<img src="test.jpg" />';
      const expected = r'&lt;img src="test.jpg" /&gt;';
      expect(HtmlEscapeUtils.escapeHtmlTags(input), equals(expected));
    });

    test('should not double-escape already escaped tags', () {
      const input = r'&lt;script&gt;alert("xss")&lt;/script&gt;';
      expect(HtmlEscapeUtils.escapeHtmlTags(input), equals(input));
    });

    test('should handle mixed content with HTML tags', () {
      const input = 'Hello <b>world</b> and <i>test</i>';
      const expected = r'Hello &lt;b&gt;world&lt;/b&gt; and &lt;i&gt;test&lt;/i&gt;';
      expect(HtmlEscapeUtils.escapeHtmlTags(input), equals(expected));
    });

    test('should handle complex HTML with attributes', () {
      const input = '<div class="test" id="main">Content</div>';
      const expected = r'&lt;div class="test" id="main"&gt;Content&lt;/div&gt;';
      expect(HtmlEscapeUtils.escapeHtmlTags(input), equals(expected));
    });

    test('should escape HTML in string list', () {
      final list = ['<script>test</script>', 'normal text', '<div>content</div>'];
      HtmlEscapeUtils.escapeHtmlInStringList(list);

      expect(list[0], equals(r'&lt;script&gt;test&lt;/script&gt;'));
      expect(list[1], equals('normal text'));
      expect(list[2], equals(r'&lt;div&gt;content&lt;/div&gt;'));
    });

    test('should handle null string list', () {
      expect(HtmlEscapeUtils.escapeHtmlInStringList(null), isNull);
    });

    test('should escape HTML in object properties using HtmlEscapable interface', () {
      final model = TestModel(
        title: '<h1>Title</h1>',
        description: '<p>Description with <b>bold</b> text</p>',
        normalText: 'Just normal text',
        number: 42,
      );

      HtmlEscapeUtils.escapeHtmlInObject(model);

      expect(model.title, equals(r'&lt;h1&gt;Title&lt;/h1&gt;'));
      expect(model.description, equals(r'&lt;p&gt;Description with &lt;b&gt;bold&lt;/b&gt; text&lt;/p&gt;'));
      expect(model.normalText, equals('Just normal text'));
      expect(model.number, equals(42));
    });

    test('should ignore objects without HtmlEscapable', () {
      final model = _NonEscapableModel(title: '<h1>Title</h1>');

      HtmlEscapeUtils.escapeHtmlInObject(model);

      expect(model.title, equals('<h1>Title</h1>'));
    });

    test('should handle null object', () {
      expect(HtmlEscapeUtils.escapeHtmlInObject(null), isNull);
    });

    test('should escape HTML in object list', () {
      final list = [
        TestModel(title: '<h1>First</h1>', description: 'Normal'),
        TestModel(title: 'Normal', description: '<p>Second</p>'),
      ];

      HtmlEscapeUtils.escapeHtmlInObjectList(list);

      expect(list[0].title, equals(r'&lt;h1&gt;First&lt;/h1&gt;'));
      expect(list[0].description, equals('Normal'));
      expect(list[1].title, equals('Normal'));
      expect(list[1].description, equals(r'&lt;p&gt;Second&lt;/p&gt;'));
    });

    test('should handle null object list', () {
      expect(HtmlEscapeUtils.escapeHtmlInObjectList(null), isNull);
    });

    test('should escape HTML in nested objects', () {
      final model = TestModel(
        title: '<h1>Main</h1>',
        nestedModels: [
          TestNestedModel(name: '<span>Nested 1</span>', value: 'Normal'),
          TestNestedModel(name: 'Normal', value: '<div>Nested 2</div>'),
        ],
      );

      HtmlEscapeUtils.escapeHtmlInObject(model);

      expect(model.title, equals(r'&lt;h1&gt;Main&lt;/h1&gt;'));
      expect(model.nestedModels[0].name, equals(r'&lt;span&gt;Nested 1&lt;/span&gt;'));
      expect(model.nestedModels[0].value, equals('Normal'));
      expect(model.nestedModels[1].name, equals('Normal'));
      expect(model.nestedModels[1].value, equals(r'&lt;div&gt;Nested 2&lt;/div&gt;'));
    });

    test('should escape HTML in string tags list', () {
      final model = TestModel(
        title: 'Test',
        tags: ['<tag1>', 'normal-tag', '<script>evil</script>'],
      );

      HtmlEscapeUtils.escapeHtmlInObject(model);

      expect(model.tags[0], equals(r'&lt;tag1&gt;'));
      expect(model.tags[1], equals('normal-tag'));
      expect(model.tags[2], equals(r'&lt;script&gt;evil&lt;/script&gt;'));
    });
  });
}

class _NonEscapableModel {
  String? title;

  _NonEscapableModel({this.title});
}
