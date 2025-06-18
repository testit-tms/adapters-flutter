#!/usr/bin/env dart

import 'package:flutter_test/flutter_test.dart';
import 'package:testit_adapter_flutter/src/manager/test_manager.dart';


void main() {
  group('TestManager -', () {
    group('getSafeExternalId Tests -', () {

      // Test case 1: Basic case with a valid externalId
      test('should_return_externalId_when_it_is_provided_and_valid', () {
        // Arrange
        const externalId = 'validExternalId123';
        const testName = 'someTestName';

        // Act
        final result = getSafeExternalId(externalId, testName);

        // Assert
        expect(result, equals('validexternalid123'),
          reason: 'Should return the lowercase version of the provided externalId.'
        );
      });

      // Test case 2: externalId is null, should use testName
      test('should_return_testName_when_externalId_is_null', () {
        // Arrange
        const String? externalId = null;
        const testName = 'TestNameFromTestRunner';

        // Act
        final result = getSafeExternalId(externalId, testName);

        // Assert
        expect(result, equals('testnamefromtestrunner'),
          reason: 'Should use the testName when externalId is null.'
        );
      });

      // Test case 3: externalId is empty, should use testName
      test('should_return_testName_when_externalId_is_empty', () {
        // Arrange
        const externalId = '';
        const testName = 'Another_Test_Name';

        // Act
        final result = getSafeExternalId(externalId, testName);

        // Assert
        expect(result, equals('anothertestname'),
          reason: 'Should use the testName when externalId is empty.'
        );
      });

      // Test case 4: Both are null
      test('should_return_null_when_both_inputs_are_null', () {
        // Arrange
        const String? externalId = null;
        const String? testName = null;

        // Act
        final result = getSafeExternalId(externalId, testName);

        // Assert
        expect(result, isNull,
          reason: 'Should return null if both externalId and testName are null.'
        );
      });

      // Test case 5: Both are empty
      test('should_return_empty_string_when_both_inputs_are_empty', () {
        // Arrange
        const externalId = '';
        const testName = '';

        // Act
        final result = getSafeExternalId(externalId, testName);

        // Assert
        expect(result, isEmpty,
          reason: 'Should return an empty string if both inputs are empty.'
        );
      });

      // Test case 6: Sanitization - special characters
      test('should_sanitize_special_characters_from_externalId', () {
        // Arrange
        const externalId = 'id@with-special!#\$%^&*()_+=[]{}|;:",.<>?/`~chars';
        const testName = 'testName';

        // Act
        final result = getSafeExternalId(externalId, testName);

        // Assert
        expect(result, equals('idwithspecialchars'),
          reason: 'Should strip all special characters.'
        );
      });

      // Test case 7: Sanitization - spaces
      test('should_sanitize_spaces_from_testName', () {
        // Arrange
        const String? externalId = null;
        const testName = 'test name with spaces';

        // Act
        final result = getSafeExternalId(externalId, testName);

        // Assert
        expect(result, equals('testnamewithspaces'),
          reason: 'Should remove all spaces.'
        );
      });

      // Test case 8: Case conversion
      test('should_convert_output_to_lowercase', () {
        // Arrange
        const externalId = 'MIXEDcaseID';
        const testName = 'SHOULD_NOT_BE_USED';

        // Act
        final result = getSafeExternalId(externalId, testName);

        // Assert
        expect(result, equals('mixedcaseid'),
          reason: 'The final output should always be lowercase.'
        );
      });

      // Test case 9: Mixed string with everything to sanitize
      test('should_correctly_sanitize_a_complex_mixed_string', () {
        // Arrange
        const String? externalId = null;
        const testName = 'Complex Test Name 123!@# With_Underscores & Symbols';

        // Act
        final result = getSafeExternalId(externalId, testName);

        // Assert
        expect(result, equals('complextestname123withunderscoressymbols'),
          reason: 'Should correctly handle a mix of spaces, special characters, and casing.'
        );
      });

      // Test case 10: Unicode characters
      test('should_strip_unicode_characters', () {
        // Arrange
        const externalId = 'id_with_unicode_Тест_测试_🚀';
        
        // Act
        final result = getSafeExternalId(externalId, 'testName');

        // Assert
        expect(result, equals('idwithunicode'),
          reason: 'Should strip all non-ASCII letters and symbols.'
        );
      });

      // Test case 11: Number-only strings
      test('should_handle_number_only_strings_correctly', () {
        // Arrange
        const externalId = '1234567890';
        
        // Act
        final result = getSafeExternalId(externalId, 'testName');

        // Assert
        expect(result, equals('1234567890'),
          reason: 'Should keep numbers-only strings as is.'
        );
      });
    });

    group('getGroupName Tests -', () {
      test('should_return_a_string_when_run_in_a_test_context', () {
        // Arrange
        // When running via `flutter test`, Invoker.current is populated by the test runner.

        // Act
        final result = getGroupName();

        // Assert
        expect(result, isA<String>(),
          reason: 'Should return a string with the current group name.'
        );
        expect(result, isNotEmpty,
          reason: 'The group name should not be empty.'
        );
      });
    });
  });
} 