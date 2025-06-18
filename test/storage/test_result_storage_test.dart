#!/usr/bin/env dart

import 'package:flutter_test/flutter_test.dart';
import 'package:testit_adapter_flutter/src/storage/test_result_storage.dart';
import 'package:testit_api_client_dart/api.dart' as api;
import 'package:test_api/src/backend/invoker.dart'; // ignore: depend_on_referenced_packages, implementation_imports
import 'package:path/path.dart';
import 'package:universal_io/io.dart';
import 'package:testit_adapter_flutter/src/model/test_result_model.dart';
import 'package:testit_adapter_flutter/src/model/api/link_api_model.dart';

// Helper function to get the current test's canonical ID, mirroring the logic in the source.
String _getTestId() {
  final liveTest = Invoker.current!.liveTest;
  return canonicalize(join(liveTest.suite.path ?? '', liveTest.test.name))
      .replaceAll(canonicalize(Directory.current.path), '');
}

// This is a private function from test_result_storage.dart, copied here for isolated testing.
api.AttachmentPutModelAutoTestStepResultsModel? _getLastNotFinishedChildStep(
    final List<api.AttachmentPutModelAutoTestStepResultsModel?>? steps) {
  api.AttachmentPutModelAutoTestStepResultsModel? targetStep;

  if (steps == null || steps.isEmpty) {
    return targetStep;
  }

  for (final step in steps.reversed) {
    if (step == null) {
      continue;
    }

    targetStep = _getLastNotFinishedChildStep(step.stepResults);

    if (targetStep != null) {
      break;
    }

    if (step.completedOn == null) {
      targetStep = step;
      break;
    }
  }

  return targetStep;
}


void main() {
  group('TestResultStorage Tests -', () {
    
    group('_getLastNotFinishedChildStep (private logic) -', () {
      test('should return null if steps list is null', () {
        final result = _getLastNotFinishedChildStep(null);
        expect(result, isNull);
      });

      test('should return null if steps list is empty', () {
        final result = _getLastNotFinishedChildStep([]);
        expect(result, isNull);
      });

      test('should return null if all steps are finished', () {
        final steps = [
          api.AttachmentPutModelAutoTestStepResultsModel()..completedOn = DateTime.now(),
          api.AttachmentPutModelAutoTestStepResultsModel()..completedOn = DateTime.now(),
        ];
        final result = _getLastNotFinishedChildStep(steps);
        expect(result, isNull);
      });

      test('should return the last unfinished step', () {
        final finishedStep = api.AttachmentPutModelAutoTestStepResultsModel()..completedOn = DateTime.now();
        final unfinishedStep = api.AttachmentPutModelAutoTestStepResultsModel()..title = 'Unfinished';
        
        final steps = [
          finishedStep,
          unfinishedStep,
        ];
        final result = _getLastNotFinishedChildStep(steps);
        expect(result, isNotNull);
        expect(result!.title, 'Unfinished');
      });

      test('should return the last unfinished step among many', () {
         final unfinishedStep1 = api.AttachmentPutModelAutoTestStepResultsModel()..title = 'Unfinished 1';
         final finishedStep = api.AttachmentPutModelAutoTestStepResultsModel()..completedOn = DateTime.now();
         final unfinishedStep2 = api.AttachmentPutModelAutoTestStepResultsModel()..title = 'Unfinished 2';

         final steps = [unfinishedStep1, finishedStep, unfinishedStep2];
         final result = _getLastNotFinishedChildStep(steps);
         expect(result, isNotNull);
         expect(result!.title, 'Unfinished 2');
      });

      test('should return a nested unfinished step', () {
        final unfinishedNestedStep = api.AttachmentPutModelAutoTestStepResultsModel()..title = 'Unfinished Nested';
        final finishedOuterStep = api.AttachmentPutModelAutoTestStepResultsModel()
            ..completedOn = DateTime.now()
            ..stepResults = [unfinishedNestedStep];

        final steps = [finishedOuterStep];
        final result = _getLastNotFinishedChildStep(steps);
        expect(result, isNotNull);
        expect(result!.title, 'Unfinished Nested');
      });

      test('should return the deepest nested unfinished step', () {
        final deepestUnfinished = api.AttachmentPutModelAutoTestStepResultsModel()..title = 'Deepest';
        final middleUnfinished = api.AttachmentPutModelAutoTestStepResultsModel()..stepResults = [deepestUnfinished];
        final outerFinished = api.AttachmentPutModelAutoTestStepResultsModel()
          ..completedOn = DateTime.now()
          ..stepResults = [middleUnfinished];

        final steps = [outerFinished];
        final result = _getLastNotFinishedChildStep(steps);
        expect(result, isNotNull);
        expect(result!.title, 'Deepest');
      });

       test('should ignore finished nested steps and find the correct unfinished step', () {
        final finishedNested = api.AttachmentPutModelAutoTestStepResultsModel()..completedOn = DateTime.now();
        final unfinishedOuter = api.AttachmentPutModelAutoTestStepResultsModel()
          ..title = 'Outer Unfinished'
          ..stepResults = [finishedNested];
        
        final steps = [unfinishedOuter];
        final result = _getLastNotFinishedChildStep(steps);
        expect(result, isNotNull);
        expect(result!.title, 'Outer Unfinished');
      });
    });

    // Note: Testing for addSetupAllsToTestResultAsync and addTeardownAllsToTestResultAsync
    // is not feasible without modifying the source code to allow pre-populating the
    // internal _testResults map. These functions rely on finding specific keys in the map
    // which cannot be added from the outside in a test environment.

    group('State Management -', () {
      tearDown(() async {
        final testId = _getTestId();
        // Defensive check to avoid calling remove on a non-existent key
        try {
          await removeTestResultByTestIdAsync(testId);
        } catch (e) {
          // Ignore TypeError if the key was already removed or never existed.
        }
      });

      test('createEmptyTestResultAsync should create a result if one does not exist', () async {
        // Arrange
        final testId = _getTestId();
        
        // Act
        await createEmptyTestResultAsync();

        // Assert
        final result = await removeTestResultByTestIdAsync(testId);
        expect(result, isA<TestResultModel>());
      });

       test('createEmptyTestResultAsync should not overwrite an existing result', () async {
        // Arrange
        final testId = _getTestId();
        await createEmptyTestResultAsync(); // First creation
        await updateTestResultMessageAsync('Initial Message');

        // Act
        await createEmptyTestResultAsync(); // Second call, should do nothing

        // Assert
        final result = await removeTestResultByTestIdAsync(testId);
        expect(result!.message, contains('Initial Message'));
      });
      
      test('getTestIdForProcessing should return a valid ID for a new test', () {
        // Act
        final testId = getTestIdForProcessing();

        // Assert
        expect(testId, isNotNull);
        expect(testId, isA<String>());
      });

      test('excludeTestIdFromProcessingAsync should make getTestIdForProcessing return null', () async {
        // Arrange
        // This test relies on having a unique ID that won't be used by other tests.

        // Act
        await excludeTestIdFromProcessingAsync();
        final testId = getTestIdForProcessing();

        // Assert
        expect(testId, isNull);
      });

      test('removeTestResultByTestIdAsync should return null if id does not exist', () async {
        // Act
        final result = await removeTestResultByTestIdAsync('non-existent-id');

        // Assert
        expect(result, isNull);
      });
    });

    group('Update Operations -', () {
      tearDown(() async {
        final testId = _getTestId();
        try {
          await removeTestResultByTestIdAsync(testId);
        } catch (e) {
          // Ignore
        }
      });

      test('updateTestResultMessageAsync should add a message', () async {
        // Arrange
        final testId = _getTestId();
        await createEmptyTestResultAsync();

        // Act
        await updateTestResultMessageAsync('Test Message');

        // Assert
        final result = await removeTestResultByTestIdAsync(testId);
        expect(result!.message, contains('Test Message'));
      });

      test('updateTestResultMessageAsync should append messages', () async {
        // Arrange
        final testId = _getTestId();
        await createEmptyTestResultAsync();
        await updateTestResultMessageAsync('First');

        // Act
        await updateTestResultMessageAsync('Second');

        // Assert
        final result = await removeTestResultByTestIdAsync(testId);
        expect(result!.message, stringContainsInOrder(['First', 'Second']));
      });

      test('updateTestResultLinksAsync should add links', () async {
        // Arrange
        final testId = _getTestId();
        await createEmptyTestResultAsync();
        final links = [
          Link('https://test.com'),
          Link('https://example.com')
        ];

        // Act
        await updateTestResultLinksAsync(links);

        // Assert
        final result = await removeTestResultByTestIdAsync(testId);
        expect(result!.links, hasLength(2));
      });

      test('updateTestResultAsync should merge all properties correctly', () async {
        // Arrange
        final testId = _getTestId();
        await createEmptyTestResultAsync();

        final update = TestResultModel()
          ..externalId = 'updated-external-id'
          ..name = 'Updated Test Name'
          ..links = {Link('https://update.com')}
          ..message = 'Updated Message'
          ..outcome = api.AvailableTestResultOutcome.passed;
        
        // Act
        await updateTestResultAsync(update);

        // Assert
        final result = await removeTestResultByTestIdAsync(testId);
        expect(result!.externalId, 'updated-external-id');
        expect(result.name, 'Updated Test Name');
        expect(result.links, hasLength(1));
        expect(result.links.first.url, 'https://update.com');
        expect(result.message, contains('Updated Message'));
        expect(result.outcome, api.AvailableTestResultOutcome.passed);
      });
    });

    group('Step Operations -', () {
      tearDown(() async {
        final testId = _getTestId();
        try {
          await removeTestResultByTestIdAsync(testId);
        } catch (e) {
          // Ignore
        }
      });
      
      test('createEmptyStepAsync should add a step to the main list if no steps exist', () async {
        // Arrange
        final testId = _getTestId();
        await createEmptyTestResultAsync();

        // Act
        await createEmptyStepAsync();

        // Assert
        final result = await removeTestResultByTestIdAsync(testId);
        expect(result!.steps, hasLength(1));
      });

      test('createEmptyStepAsync should add a nested step if an unfinished step exists', () async {
        // Arrange
        final testId = _getTestId();
        await createEmptyTestResultAsync();
        await createEmptyStepAsync(); // Create a parent unfinished step

        // Act
        await createEmptyStepAsync(); // This should become a nested step

        // Assert
        final result = await removeTestResultByTestIdAsync(testId);
        expect(result!.steps, hasLength(1), reason: "Should still be one step at the top level");
        expect(result.steps.first.stepResults, hasLength(1), reason: "A nested step should have been created");
      });

      test('updateTestResultAttachmentsAsync should add to main attachments if no steps', () async {
        // Arrange
        final testId = _getTestId();
        await createEmptyTestResultAsync();
        final attachment = api.AttachmentPutModel(id: 'attachment-id');

        // Act
        await updateTestResultAttachmentsAsync(attachment);

        // Assert
        final result = await removeTestResultByTestIdAsync(testId);
        expect(result!.attachments, hasLength(1));
        expect(result.attachments.first.id, 'attachment-id');
      });

      test('updateTestResultAttachmentsAsync should add to current step if it exists', () async {
        // Arrange
        final testId = _getTestId();
        await createEmptyTestResultAsync();
        await createEmptyStepAsync(); // This creates an unfinished "current" step
        final attachment = api.AttachmentPutModel(id: 'attachment-id');

        // Act
        await updateTestResultAttachmentsAsync(attachment);

        // Assert
        final result = await removeTestResultByTestIdAsync(testId);
        expect(result!.steps, hasLength(1));
        expect(result.steps.first.attachments, hasLength(1));
        expect(result.steps.first.attachments!.first.id, 'attachment-id');
      });
    });
  });
} 