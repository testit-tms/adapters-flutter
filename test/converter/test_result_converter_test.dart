import 'package:flutter_test/flutter_test.dart';
import 'package:testit_adapter_flutter/src/converter/test_result_converter.dart';
import 'package:testit_adapter_flutter/src/enum/link_type_enum.dart' as local;
import 'package:testit_adapter_flutter/src/model/api/link_api_model.dart';
import 'package:testit_adapter_flutter/src/model/test_result_model.dart';
import 'package:testit_api_client_dart/api.dart' as api;

void main() {
  group('TestResultConverter', () {
    group('toAutoTestResultsForTestRunModel', () {
      test('should convert TestResultModel to AutoTestResultsForTestRunModel',
          () {
        // Arrange
        final testResult = TestResultModel()
          ..externalId = 'ext-1'
          ..outcome = api.AvailableTestResultOutcome.passed
          ..links = {
            Link('http://example.com',
                title: 'Example',
                description: 'Description',
                type: local.LinkType.related)
          }
          ..message = 'Test message'
          ..traces = 'Test traces'
          ..duration = 123
          ..startedOn = DateTime(2023)
          ..completedOn = DateTime(2023, 1, 1, 0, 2, 3)
          ..attachments = [api.AttachmentPutModel(id: 'attachment-id')]
          ..parameters = {'param1': 'value1'}
          ..properties = {'prop1': 'value1'};
        const configId = 'config-id';

        // Act
        final model =
            toAutoTestResultsForTestRunModel(configId, testResult);

        // Assert
        expect(model.configurationId, configId);
        expect(model.autoTestExternalId, testResult.externalId);
        expect(model.outcome, testResult.outcome);
        expect(model.links!.first.url, testResult.links.first.url);
        expect(model.message, testResult.message);
        expect(model.traces, testResult.traces);
        expect(model.duration, testResult.duration);
        expect(model.startedOn, testResult.startedOn);
        expect(model.completedOn, testResult.completedOn);
        expect(model.attachments!.first.id, testResult.attachments.first.id);
        expect(model.parameters, testResult.parameters);
        expect(model.properties, testResult.properties);
        expect(model.failureReasonNames, testResult.failureReasonNames);
      });
    });

    group('toAutoTestPostModel', () {
      test('should convert TestResultModel to AutoTestPostModel', () {
        // Arrange
        final testResult = TestResultModel()
          ..externalId = 'ext-1'
          ..name = 'Test Name'
          ..classname = 'TestClass'
          ..namespace = 'Test.Namespace'
          ..title = 'Test Title'
          ..description = 'Test Description'
          ..labels = {'label1'}
          ..links = {
            Link('http://example.com', type: local.LinkType.related)
          };
        const projectId = 'project-id';

        // Act
        final model = toAutoTestPostModel(projectId, testResult);

        // Assert
        expect(model.externalId, testResult.externalId);
        expect(model.name, testResult.name);
        expect(model.projectId, projectId);
        expect(model.classname, testResult.classname);
        expect(model.namespace, testResult.namespace);
        expect(model.title, testResult.title);
        expect(model.description, testResult.description);
        expect(model.labels!.first.name, testResult.labels.first);
        expect(model.links!.first.url, testResult.links.first.url);
      });
    });

    group('toAutoTestPutModel', () {
      test('should convert TestResultModel to AutoTestPutModel', () {
        // Arrange
        final testResult = TestResultModel()
          ..externalId = 'ext-1'
          ..name = 'Test Name'
          ..classname = 'TestClass'
          ..namespace = 'Test.Namespace'
          ..title = 'Test Title'
          ..description = 'Test Description'
          ..labels = {'label1'}
          ..links = {
            Link('http://example.com', type: local.LinkType.related)
          };
        const projectId = 'project-id';

        // Act
        final model = toAutoTestPutModel(projectId, testResult);

        // Assert
        expect(model.externalId, testResult.externalId);
        expect(model.name, testResult.name);
        expect(model.projectId, projectId);
        expect(model.classname, testResult.classname);
        expect(model.namespace, testResult.namespace);
        expect(model.title, testResult.title);
        expect(model.description, testResult.description);
        expect(model.labels!.first.name, testResult.labels.first);
        expect(model.links!.first.url, testResult.links.first.url);
      });
    });

    group('toAutoTestStepModel', () {
      test('should convert AttachmentPutModelAutoTestStepResultsModel', () {
        // Arrange
        final stepResult = api.AttachmentPutModelAutoTestStepResultsModel(
            title: 'Step Title',
            description: 'Step Description',
            stepResults: [
              api.AttachmentPutModelAutoTestStepResultsModel(
                  title: 'Nested Step')
            ]);

        // Act
        final model = toAutoTestStepModel(stepResult);

        // Assert
        expect(model.title, stepResult.title);
        expect(model.description, stepResult.description);
        expect(model.steps!.first.title, stepResult.stepResults!.first.title);
      });

      test('should handle null description and steps', () {
        // Arrange
        final stepResult =
            api.AttachmentPutModelAutoTestStepResultsModel(title: 'Step Title');

        // Act
        final model = toAutoTestStepModel(stepResult);

        // Assert
        expect(model.title, stepResult.title);
        expect(model.description, isNull);
        expect(model.steps, isEmpty);
      });
    });

    group('_convertLinkType private function', () {
      test('should correctly convert all link types', () {
        expect(
            toAutoTestResultsForTestRunModel(
                    'c',
                    TestResultModel()
                      ..externalId = 'e'
                      ..outcome = api.AvailableTestResultOutcome.passed
                      ..links = {
                        Link('u', type: local.LinkType.related)
                      }).links!.first.type,
            api.LinkType.related);
        expect(
            toAutoTestResultsForTestRunModel(
                    'c',
                    TestResultModel()
                      ..externalId = 'e'
                      ..outcome = api.AvailableTestResultOutcome.passed
                      ..links = {
                        Link('u', type: local.LinkType.blockedBy)
                      }).links!.first.type,
            api.LinkType.blockedBy);
        expect(
            toAutoTestResultsForTestRunModel(
                    'c',
                    TestResultModel()
                      ..externalId = 'e'
                      ..outcome = api.AvailableTestResultOutcome.passed
                      ..links = {
                        Link('u', type: local.LinkType.defect)
                      }).links!.first.type,
            api.LinkType.defect);
        expect(
            toAutoTestResultsForTestRunModel(
                    'c',
                    TestResultModel()
                      ..externalId = 'e'
                      ..outcome = api.AvailableTestResultOutcome.passed
                      ..links = {
                        Link('u', type: local.LinkType.issue)
                      }).links!.first.type,
            api.LinkType.issue);
        expect(
            toAutoTestResultsForTestRunModel(
                    'c',
                    TestResultModel()
                      ..externalId = 'e'
                      ..outcome = api.AvailableTestResultOutcome.passed
                      ..links = {
                        Link('u', type: local.LinkType.requirement)
                      }).links!.first.type,
            api.LinkType.requirement);
        expect(
            toAutoTestResultsForTestRunModel(
                    'c',
                    TestResultModel()
                      ..externalId = 'e'
                      ..outcome = api.AvailableTestResultOutcome.passed
                      ..links = {
                        Link('u', type: local.LinkType.repository)
                      }).links!.first.type,
            api.LinkType.repository);
      });

      test('should handle null link type', () {
        expect(
            toAutoTestResultsForTestRunModel(
                    'c',
                    TestResultModel()
                      ..externalId = 'e'
                      ..outcome = api.AvailableTestResultOutcome.passed
                      ..links = {Link('u', type: null)}).links!.first.type,
            isNull);
      });
    });
  });
} 