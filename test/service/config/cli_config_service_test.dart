import 'package:flutter_test/flutter_test.dart';
import 'package:testit_adapter_flutter/src/model/config_model.dart';
import 'package:testit_adapter_flutter/src/service/config/cli_config_service.dart';

void main() {
  group('applyCliParameters', () {
    late ConfigModel config;
    late Map<String, String> envVars;

    setUp(() {
      config = ConfigModel();
      envVars = {};
    });

    String getEnv(String name) {
      return envVars[name] ?? '';
    }

    test('should parse all provided values correctly', () {
      // Arrange
      envVars = {
        'tmsAdapterMode': '2',
        'tmsAutomaticCreationTestCases': 'true',
        'tmsAutomaticUpdationLinksToTestCases': 'false',
        'tmsCertValidation': 'true',
        'tmsConfigurationId': 'config-id',
        'tmsIsDebug': 'true',
        'tmsPrivateToken': 'token',
        'tmsProjectId': 'project-id',
        'tmsTestIt': 'true',
        'tmsTestRunId': 'run-id',
        'tmsTestRunName': 'run-name',
        'tmsUrl': 'http://localhost:8080',
      };

      // Act
      final result = applyCliParameters(config, getEnv);

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
        ..automaticCreationTestCases = true
        ..url = 'some-url';

      // Act
      final result = applyCliParameters(config, getEnv);

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
        'tmsAdapterMode': 'not-an-int',
        'tmsAutomaticCreationTestCases': 'not-a-bool',
        'tmsIsDebug': 'not-a-bool',
      };

      // Act
      final result = applyCliParameters(config, getEnv);

      // Assert
      expect(result.adapterMode, isNull);
      expect(result.automaticCreationTestCases,
          isNull); // bool.tryParse('not-a-bool') -> null
      expect(result.isDebug, isNull);
    });

    test('should correctly override existing config values', () {
      // Arrange
      config = ConfigModel()
        ..adapterMode = 1
        ..privateToken = 'old-token'
        ..url = 'old-url';
      envVars = {
        'tmsAdapterMode': '0',
        'tmsPrivateToken': 'new-token',
      };

      // Act
      final result = applyCliParameters(config, getEnv);

      // Assert
      expect(result.adapterMode, 0);
      expect(result.privateToken, 'new-token');
      expect(result.url, isNull); // was not in envVars, so it becomes null
    });
  });
} 