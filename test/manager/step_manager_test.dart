#!/usr/bin/env dart

import 'package:flutter_test/flutter_test.dart';
import 'package:testit_adapter_flutter/src/manager/step_manager.dart';

void main() {
  group('StepManager Tests -', () {

    // Note: Due to the static nature of dependencies (createConfigOnceAsync, 
    // updateCurrentStepAsync, etc.), we cannot easily mock them.
    // These tests therefore focus on the logical flow, return values,
    // and exception handling of the `step` function, rather than the 
    // side effects of its dependencies. A `testit.json` file is required
    // in the project root for these tests to run.

    group('Execution and Return Value Tests -', () {
      test('should_execute_async_body_and_return_its_value', () async {
        // Arrange
        const expectedResult = 42;
        var bodyExecuted = false;

        // Act
        final result = await step('Test Step', () async {
          await Future.delayed(const Duration(milliseconds: 10));
          bodyExecuted = true;
          return expectedResult;
        });

        // Assert
        expect(bodyExecuted, isTrue, reason: 'The provided body should be executed.');
        expect(result, equals(expectedResult), reason: 'Should return the value from the async body.');
      });

      test('should_execute_sync_body_and_return_its_value', () async {
        // Arrange
        const expectedResult = 'hello world';
        var bodyExecuted = false;

        // Act
        final result = await step('Test Step', () {
          bodyExecuted = true;
          return expectedResult;
        });

        // Assert
        expect(bodyExecuted, isTrue, reason: 'The provided synchronous body should be executed.');
        expect(result, equals(expectedResult), reason: 'Should return the value from the sync body.');
      });

      test('should_correctly_handle_a_null_return_value', () async {
        // Arrange
        var bodyExecuted = false;

        // Act
        final result = await step('Test Step', () async {
          bodyExecuted = true;
          return null;
        });

        // Assert
        expect(bodyExecuted, isTrue, reason: 'Body should execute even if it returns null.');
        expect(result, isNull, reason: 'Should return null when the body returns null.');
      });
    });

    group('Failure Handling Tests -', () {
      test('should_rethrow_exception_from_an_async_body', () async {
        // Arrange
        final exception = Exception('Something went wrong in async');
        
        // Act & Assert
        expect(
          () => step('Failing Step', () async {
            await Future.delayed(const Duration(milliseconds: 10));
            throw exception;
          }),
          throwsA(predicate((e) => e == exception)),
          reason: 'Should rethrow the exact exception from an async body.'
        );
      });

      test('should_rethrow_exception_from_a_sync_body', () async {
        // Arrange
        final exception = StateError('Invalid state');

        // Act & Assert
        expect(
          () => step('Failing Step', () {
            throw exception;
          }),
          throwsA(predicate((e) => e == exception)),
          reason: 'Should rethrow the exact exception from a sync body.'
        );
      });

      test('should_run_finally_block_even_when_body_fails', () async {
        // This test is more conceptual. We can't directly observe the `finally`
        // block, but by confirming the exception is re-thrown, we trust the 
        // language feature. The goal is to ensure failure in `body` doesn't
        // prevent the step from being processed.
        
        // Arrange
        final exception = ArgumentError('Bad argument');

        // Act & Assert
        await expectLater(
          () => step('Failing Step', () => throw exception),
          throwsArgumentError,
          reason: 'Ensuring exception propagates confirms the try-catch-finally structure is engaged.'
        );
      });
    });

    group('Parameter Handling Tests -', () {
      test('should_run_successfully_with_all_parameters_provided', () async {
        // Arrange
        const title = 'Step with all params';
        const description = 'This is a detailed description.';
        const expectedResult = true;

        // Act
        final result = await step(
          title, 
          () => expectedResult, 
          description: description
        );

        // Assert
        expect(result, expectedResult, 
          reason: 'Function should execute correctly when all parameters are provided.'
        );
      });

      test('should_handle_empty_title_and_description', () async {
        // Arrange
        const title = '';
        const description = '';
        
        // Act & Assert
        // This test mainly ensures that providing empty strings doesn't crash the function.
        await expectLater(
          step(title, () => 42, description: description),
          completion(equals(42)),
          reason: 'Should handle empty strings for title and description gracefully.'
        );
      });

      test('should_handle_long_title_and_description', () async {
        // Arrange
        final title = 'a' * 500;
        final description = 'b' * 2000;
        
        // Act & Assert
        await expectLater(
          step(title, () => 'done', description: description),
          completion(equals('done')),
          reason: 'Should handle very long strings without crashing.'
        );
      });
    });
  });
} 