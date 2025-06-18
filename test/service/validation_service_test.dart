import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:testit_adapter_flutter/src/manager/i_api_manager.dart';
import 'package:testit_adapter_flutter/src/model/config_model.dart';
import 'package:testit_adapter_flutter/src/model/exception_model.dart';
import 'package:testit_adapter_flutter/src/service/validation_service.dart';
import 'package:testit_api_client_dart/api.dart' as api;
import 'package:uuid/uuid.dart';

import 'validation_service_test.mocks.dart';

@GenerateMocks([IApiManager])
void main() {
  group('ValidationService', () {
    late MockIApiManager mockApiManager;
    late ValidationService validationService;
    late Level originalLogLevel;
    late ConfigModel config;

    // Use a fixed UUID for predictable test data
    const uuid = Uuid();
    final validProjectId = uuid.v4();
    final validConfigId = uuid.v4();
    final validTestRunId = uuid.v4();

    ConfigModel createValidConfig() {
      return ConfigModel()
        ..adapterMode = 0
        ..automaticCreationTestCases = true
        ..automaticUpdationLinksToTestCases = false
        ..certValidation = true
        ..configurationId = validConfigId
        ..isDebug = false
        ..privateToken = 'token'
        ..projectId = validProjectId
        ..testIt = true
        ..testRunId = validTestRunId
        ..url = 'https://test.it';
    }

    setUp(() {
      mockApiManager = MockIApiManager();
      validationService = ValidationService(mockApiManager, disableValidation: false);
      originalLogLevel = Logger.level;
      Logger.level = Level.off;
      config = createValidConfig();
    });

    tearDown(() {
      Logger.level = originalLogLevel;
    });

    group('validateConfigAsync', () {
      test('should not throw if config is valid and API checks pass',
          () async {
        // Arrange
        when(mockApiManager.getProjectConfigurationsAsync(config))
            .thenAnswer((_) async => [validConfigId]);
        when(mockApiManager.getTestRunOrNullByIdAsync(config))
            .thenAnswer((_) async => api.TestRunV2ApiResult(
                id: '',
                name: '',
                stateName: api.TestRunState.notStarted,
                
                status: api.TestStatusApiResult(id: "1", name: "pending", 
                type: api.TestStatusApiType.pending, isSystem: true, code: "1"),

                projectId: '',
                createdDate: DateTime.now(),
                createdById: '',
                runCount: 0));

        // Act & Assert
        await expectLater(
            validationService.validateConfigAsync(config), completes);
      });

      test('should throw TmsConfigException if config is null', () async {
        await expectLater(validationService.validateConfigAsync(null),
            throwsA(isA<TmsConfigException>()));
      });

      test('should throw if project is not found', () async {
        // Arrange
        when(mockApiManager.getProjectConfigurationsAsync(config))
            .thenAnswer((_) async => []);

        // Act & Assert
        await expectLater(validationService.validateConfigAsync(config),
            throwsA(isA<TmsConfigException>()));
      });

      test('should throw if configuration is not found', () async {
        // Arrange
        when(mockApiManager.getProjectConfigurationsAsync(config))
            .thenAnswer((_) async => ['another-config-id']);

        // Act & Assert
        await expectLater(validationService.validateConfigAsync(config),
            throwsA(isA<TmsConfigException>()));
      });

      test('should throw if test run is not found for adapter mode 0',
          () async {
        // Arrange
        config.adapterMode = 0;
        when(mockApiManager.getProjectConfigurationsAsync(config))
            .thenAnswer((_) async => [validConfigId]);
        when(mockApiManager.getTestRunOrNullByIdAsync(config))
            .thenAnswer((_) async => null);

        // Act & Assert
        await expectLater(validationService.validateConfigAsync(config),
            throwsA(isA<TmsConfigException>()));
      });

      test('should not check test run for adapter mode 2', () async {
        // Arrange
        config.adapterMode = 2;
        when(mockApiManager.getProjectConfigurationsAsync(config))
            .thenAnswer((_) async => [validConfigId]);

        // Act & Assert
        await expectLater(
            validationService.validateConfigAsync(config), completes);
        verifyNever(mockApiManager.getTestRunOrNullByIdAsync(config));
      });
    });

    group('validateStringArgument', () {
      test('should not throw for valid string', () {
        expect(() => validationService.validateStringArgument('name', 'value'),
            returnsNormally);
      });

      test('should throw for null string', () {
        expect(() => validationService.validateStringArgument('name', null),
            throwsA(isA<TmsConfigException>()));
      });

      test('should throw for empty string', () {
        expect(() => validationService.validateStringArgument('name', ''),
            throwsA(isA<TmsConfigException>()));
      });
    });

    group('validateUriArgument', () {
      test('should not throw for valid URI', () {
        expect(
            () => validationService.validateUriArgument(
                'url', 'https://test.it'),
            returnsNormally);
      });

      test('should throw for invalid URI', () {
        expect(() => validationService.validateUriArgument('url', 'not a url'),
            throwsA(isA<TmsConfigException>()));
      });
    });

    group('validateWorkItemsIdsAsync', () {
      test('should not throw if all work items are found', () async {
        // Arrange
        when(mockApiManager.getFirstNotFoundWorkItemIdAsync(
                config, argThat(isA<Iterable<String>>())))
            .thenAnswer((_) async => null);

        // Act & Assert
        await expectLater(
            validationService.validateWorkItemsIdsAsync(config, ['id1', 'id2']),
            completes);
      });

      test('should throw if a work item is not found', () async {
        // Arrange
        when(mockApiManager.getFirstNotFoundWorkItemIdAsync(
                config, argThat(isA<Iterable<String>>())))
            .thenAnswer((_) async => 'not-found-id');

        // Act & Assert
        await expectLater(
            validationService.validateWorkItemsIdsAsync(
                config, ['not-found-id']),
            throwsA(isA<TmsConfigException>()));
      });
    });
  });
} 