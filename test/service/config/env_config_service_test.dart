import 'package:flutter_test/flutter_test.dart';
import 'package:testit_adapter_flutter/src/model/config_model.dart';
import 'package:testit_adapter_flutter/src/service/config/env_config_service.dart';

void main() {
  group('applyEnvParameters', () {
    late ConfigModel config;
    late Map<String, String> envVars;

    setUp(() {
      config = ConfigModel();
      envVars = {};
    });

    test('should parse all provided values correctly from environment', () {
      // Arrange
      envVars = {
        'TMS_ADAPTER_MODE': '2',
        'TMS_AUTOMATIC_CREATION_TEST_CASES': 'true',
        'TMS_AUTOMATIC_UPDATION_LINKS_TO_TEST_CASES': 'false',
        'TMS_CERT_VALIDATION': 'true',
        'TMS_CONFIGURATION_ID': 'config-id',
        'TMS_IS_DEBUG': 'true',
        'TMS_PRIVATE_TOKEN': 'token',
        'TMS_PROJECT_ID': 'project-id',
        'TMS_TEST_IT': 'true',
        'TMS_TEST_RUN_ID': 'run-id',
        'TMS_TEST_RUN_NAME': 'run-name',
        'TMS_URL': 'http://localhost:8080',
      };

      // Act
      final result = applyEnvParameters(config, envVars);

      // Assert
      expect(result.adapterMode, 2);
      expect(result.automaticCreationTestCases, isTrue);
      expect(result.automaticUpdationLinksToTestCases, isFalse);
      expect(result.certValidation, isTrue);
      expect(result.configurationId, 'config-id');
      expect(result.isDebug, isTrue);
      expect(result.privateToken, 'token');
      expect(result.projectId, 'project-id');
      expect(result.testIt, isTrue);
      expect(result.testRunId, 'run-id');
      expect(result.testRunName, 'run-name');
      expect(result.url, 'http://localhost:8080');
    });

    test('should handle missing values by setting fields to null', () {
      // Arrange
      config = ConfigModel()
        ..adapterMode = 1
        ..url = 'some-url';

      // Act
      final result = applyEnvParameters(config, envVars);

      // Assert
      expect(result.adapterMode, isNull);
      expect(result.automaticCreationTestCases, isNull);
      expect(result.automaticUpdationLinksToTestCases, isNull);
      expect(result.certValidation, isNull);
      expect(result.configurationId, isNull);
      expect(result.isDebug, isNull);
      expect(result.privateToken, isNull);
      expect(result.projectId, isNull);
      expect(result.testIt, isNull);
      expect(result.testRunId, isNull);
      expect(result.testRunName, isNull);
      expect(result.url, isNull);
    });

    test('should handle invalid integer and boolean values', () {
      // Arrange
      envVars = {
        'TMS_ADAPTER_MODE': 'not-an-int',
        'TMS_AUTOMATIC_CREATION_TEST_CASES': 'not-a-bool',
        'TMS_IS_DEBUG': 'not-a-bool',
      };

      // Act
      final result = applyEnvParameters(config, envVars);

      // Assert
      expect(result.adapterMode, isNull);
      expect(result.automaticCreationTestCases, isNull);
      expect(result.isDebug, isNull);
    });

    test('should correctly override existing config values', () {
      // Arrange
      config = ConfigModel()
        ..adapterMode = 1
        ..privateToken = 'old-token'
        ..url = 'old-url';
      envVars = {
        'TMS_ADAPTER_MODE': '0',
        'TMS_PRIVATE_TOKEN': 'new-token',
      };

      // Act
      final result = applyEnvParameters(config, envVars);

      // Assert
      expect(result.adapterMode, 0);
      expect(result.privateToken, 'new-token');
      expect(result.url, isNull); // was not in envVars, so it becomes null
    });
  });
} 