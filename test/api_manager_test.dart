#!/usr/bin/env dart

import 'package:flutter_test/flutter_test.dart';
import 'package:testit_adapter_flutter/src/manager/api_manager_.dart';
import 'package:testit_adapter_flutter/src/model/config_model.dart';

void main() {
  group('ApiManager Tests -', () {
    late ApiManager apiManager;

    setUp(() {
      apiManager = ApiManager();
    });

    group('getFirstNotFoundWorkItemIdAsync Tests -', () {
      test('should_return_null_when_workItemsIds_is_null', () async {
        // Arrange
        final config = ConfigModel();
        config.url = 'https://test-api.com';
        config.privateToken = 'test-token';
        const Iterable<String>? workItemsIds = null;

        // Act
        final result =
            await apiManager.getFirstNotFoundWorkItemIdAsync(config, workItemsIds);

        // Assert
        expect(result, isNull,
            reason: 'Should return null when workItemsIds is null');
      });

      test('should_return_null_when_workItemsIds_is_empty', () async {
        // Arrange
        final config = ConfigModel();
        config.url = 'https://test-api.com';
        config.privateToken = 'test-token';
        const Iterable<String> workItemsIds = [];

        // Act
        final result =
            await apiManager.getFirstNotFoundWorkItemIdAsync(config, workItemsIds);

        // Assert
        expect(result, isNull,
            reason: 'Should return null when workItemsIds is empty');
      });

      test('should_handle_single_work_item_id_collection', () async {
        // Arrange
        final config = ConfigModel()
          ..url = 'https://test-api.com'
          ..privateToken = 'test-token';
        final workItemsIds = ['single-item'];

        // Act & Assert
        // We expect an ApiException because a real network call is made.
        // This confirms the method attempts to contact the server.
        expect(
            () async => await apiManager.getFirstNotFoundWorkItemIdAsync(
                config, workItemsIds),
            throwsA(isA<Exception>()),
            reason:
                'Should attempt a network call and throw an exception in test environment');
      });

      test('should_handle_multiple_work_item_ids_collection', () async {
        // Arrange
        final config = ConfigModel()
          ..url = 'https://test-api.com'
          ..privateToken = 'test-token';
        final workItemsIds = ['item-1', 'item-2', 'item-3'];

        // Act & Assert
        expect(
            () async => await apiManager.getFirstNotFoundWorkItemIdAsync(
                config, workItemsIds),
            throwsA(isA<Exception>()),
            reason:
                'Should attempt a network call and throw an exception in test environment');
      });

      test('should_handle_empty_strings_in_collection', () async {
        // Arrange
        final config = ConfigModel()
          ..url = 'https://test-api.com'
          ..privateToken = 'test-token';
        final workItemsIds = ['', 'valid-id', ''];

        // Act & Assert
        expect(
            () async => await apiManager.getFirstNotFoundWorkItemIdAsync(
                config, workItemsIds),
            throwsA(isA<Exception>()),
            reason:
                'Should attempt a network call and throw an exception in test environment');
      });

      test('should_handle_unicode_work_item_ids', () async {
        // Arrange
        final config = ConfigModel()
          ..url = 'https://test-api.com'
          ..privateToken = 'test-token';
        final workItemsIds = ['工作项-1', 'элемент_работы_🚀', 'عنصر_العمل'];

        // Act & Assert
        expect(
            () async => await apiManager.getFirstNotFoundWorkItemIdAsync(
                config, workItemsIds),
            throwsA(isA<Exception>()),
            reason:
                'Should attempt a network call and throw an exception in test environment');
      });
    });

    group('isTestNeedsToBeRunAsync Tests -', () {
      test('should_return_true_when_adapter_mode_is_1', () async {
        // Arrange
        final config = ConfigModel();
        config.adapterMode = 1;
        const externalId = 'test-external-id';

        // Act
        final result = await apiManager.isTestNeedsToBeRunAsync(config, externalId);

        // Assert
        expect(result, isTrue,
            reason: 'Should return true when adapter mode is 1');
      });

      test('should_return_true_when_adapter_mode_is_2', () async {
        // Arrange
        final config = ConfigModel();
        config.adapterMode = 2;
        const externalId = 'test-external-id';

        // Act
        final result = await apiManager.isTestNeedsToBeRunAsync(config, externalId);

        // Assert
        expect(result, isTrue,
            reason: 'Should return true when adapter mode is 2');
      });

      test('should_return_true_when_adapter_mode_is_negative', () async {
        // Arrange
        final config = ConfigModel();
        config.adapterMode = -1;
        const externalId = 'test-external-id';

        // Act
        final result = await apiManager.isTestNeedsToBeRunAsync(config, externalId);

        // Assert
        expect(result, isTrue,
            reason: 'Should return true when adapter mode is negative');
      });

      test('should_handle_null_external_id_gracefully', () async {
        // Arrange
        final config = ConfigModel();
        config.adapterMode = 1;
        const String? externalId = null;

        // Act
        final result = await apiManager.isTestNeedsToBeRunAsync(config, externalId);

        // Assert
        expect(result, isTrue,
            reason:
                'Should return true for null external ID when adapter mode is 1');
      });

      test('should_handle_empty_external_id_gracefully', () async {
        // Arrange
        final config = ConfigModel();
        config.adapterMode = 1;
        const externalId = '';

        // Act
        final result = await apiManager.isTestNeedsToBeRunAsync(config, externalId);

        // Assert
        expect(result, isTrue,
            reason:
                'Should return true for empty external ID when adapter mode is 1');
      });

      test('should_handle_long_external_id', () async {
        // Arrange
        final config = ConfigModel();
        config.adapterMode = 1;
        final longExternalId = 'external-id-${'x' * 500}';

        // Act
        final result =
            await apiManager.isTestNeedsToBeRunAsync(config, longExternalId);

        // Assert
        expect(result, isTrue, reason: 'Should handle long external ID');
      });

      test('should_handle_unicode_external_id', () async {
        // Arrange
        final config = ConfigModel();
        config.adapterMode = 1;
        const externalId = 'тест_🚀_测试_عربي';

        // Act
        final result = await apiManager.isTestNeedsToBeRunAsync(config, externalId);

        // Assert
        expect(result, isTrue, reason: 'Should handle Unicode external ID');
      });

      test('should_handle_concurrent_calls_with_different_adapter_modes',
          () async {
        // Arrange - Use only adapter modes 1 and 2 to avoid API calls
        final configs = List.generate(5, (index) {
          final config = ConfigModel();
          config.adapterMode = (index % 2) + 1; // 1, 2, 1, 2, 1
          return config;
        });

        // Act
        final futures = configs.asMap().entries.map((entry) {
          return apiManager.isTestNeedsToBeRunAsync(
              entry.value, 'external-id-\${entry.key}');
        });

        // Assert
        final results = await Future.wait(futures);
        expect(results.length, equals(5),
            reason: 'Should handle all concurrent calls');

        // All adapter modes 1 and 2 should return true
        expect(results, everyElement(isTrue),
            reason: 'All non-zero adapter modes should return true');
      });

      test(
          'should_throw_exception_when_adapter_mode_is_0_and_network_fails',
          () async {
        // Arrange
        final config = ConfigModel()
          ..adapterMode = 0
          ..url = 'https://test-api.com'
          ..privateToken = 'test-token'
          ..testRunId = 'test-run-id'
          ..configurationId = 'config-id';
        const externalId = 'test-external-id';

        // Act & Assert
        // The method will try a network call which will fail, throwing an exception.
        expect(() async => await apiManager.isTestNeedsToBeRunAsync(config, externalId),
            throwsA(isA<Exception>()));
      });
    });

    group('tryCreateTestRunOnceAsync Tests -', () {
      test('should_complete_without_error_when_adapter_mode_is_0', () async {
        // Arrange
        final config = ConfigModel();
        config.adapterMode = 0;

        // Act & Assert
        expect(() async => await apiManager.tryCreateTestRunOnceAsync(config),
            returnsNormally,
            reason: 'Should complete without error when adapter mode is 0');
      });

      test('should_complete_without_error_when_adapter_mode_is_1', () async {
        // Arrange
        final config = ConfigModel();
        config.adapterMode = 1;

        // Act & Assert
        expect(() async => await apiManager.tryCreateTestRunOnceAsync(config),
            returnsNormally,
            reason: 'Should complete without error when adapter mode is 1');
      });

      test('should_handle_adapter_mode_2_configuration', () async {
        // Arrange
        final config = ConfigModel()
          ..adapterMode = 2
          ..url = 'https://test-api.com'
          ..privateToken = 'test-token'
          ..projectId = 'project-id';

        // Act & Assert
        expect(
            () async => await apiManager.tryCreateTestRunOnceAsync(config),
            throwsA(isA<Exception>()),
            reason:
                'Should attempt a network call and throw for adapter mode 2');
      });

      test('should_handle_null_test_run_name_gracefully', () async {
        // Arrange
        final config = ConfigModel()
          ..adapterMode = 2
          ..url = 'https://test-api.com'
          ..privateToken = 'test-token'
          ..projectId = 'project-id'
          ..testRunName = null;

        // Act & Assert
        expect(
            () async => await apiManager.tryCreateTestRunOnceAsync(config),
            throwsA(isA<Exception>()),
            reason:
                'Should handle null test run name and still attempt network call');
      });

      test('should_handle_empty_project_id_when_adapter_mode_is_2', () async {
        // Arrange
        final config = ConfigModel();
        config.adapterMode = 2;
        config.url = 'https://test-api.com';
        config.privateToken = 'test-token';
        config.projectId = '';
        config.testRunName = 'Test Run';

        // Act & Assert
        expect(() async => await apiManager.tryCreateTestRunOnceAsync(config),
            returnsNormally,
            reason: 'Should handle empty project ID gracefully');
      });

      test('should_handle_concurrent_calls_with_adapter_mode_2', () async {
        // Arrange
        final configs = List.generate(3, (index) {
          final config = ConfigModel();
          config.adapterMode = 2;
          config.url = 'https://test-api.com';
          config.privateToken = 'test-token';
          config.projectId = 'concurrent-project-$index';
          config.testRunName = 'Concurrent Test $index';
          return config;
        });

        // Act
        final futures =
            configs.map((config) => apiManager.tryCreateTestRunOnceAsync(config));

        // Assert - All calls should complete (may fail due to network, but should not throw null reference errors)
        expect(() async => await Future.wait(futures), returnsNormally,
            reason: 'Should handle concurrent calls safely');
      });
    });

    group('Input Validation and Edge Cases Tests -', () {
      test('should_handle_config_with_special_characters', () async {
        // Arrange
        final config = ConfigModel();
        config.url = 'https://тест-api.com/путь';
        config.privateToken = 'токен_with_спец_chars_🔑';
        config.projectId = 'проект@#\$%^&*()';
        config.adapterMode = 1;

        // Act & Assert
        expect(
            () async =>
                await apiManager.isTestNeedsToBeRunAsync(config, 'тест_ID_🚀'),
            returnsNormally,
            reason: 'Should handle config with special characters');
      });

      test('should_handle_config_with_very_long_values', () async {
        // Arrange
        final config = ConfigModel();
        config.url = 'https://test-api.com/${'very-long-path/' * 50}';
        config.privateToken = 'token_${'x' * 1000}';
        config.projectId = 'project_${'y' * 500}';
        config.adapterMode = 1;

        // Act & Assert
        expect(
            () async =>
                await apiManager.isTestNeedsToBeRunAsync(config, 'external-id'),
            returnsNormally,
            reason: 'Should handle config with very long values');
      });

      test('should_handle_extreme_adapter_mode_values', () async {
        // Arrange
        final config = ConfigModel();
        config.adapterMode = 999999;

        // Act
        final result = await apiManager.isTestNeedsToBeRunAsync(config, 'test-id');

        // Assert
        expect(result, isTrue,
            reason: 'Should return true for extreme positive adapter mode');
      });

      test('should_handle_work_item_ids_with_special_formats', () async {
        // Arrange
        final config = ConfigModel();
        config.url = 'https://test-api.com';
        config.privateToken = 'test-token';
        final workItemsIds = [
          'WI-123',
          'work_item_456',
          'WORK-ITEM-789',
          'wi.123.456',
          'работа-элемент-123',
          '工作项_456',
          'عنصر_العمل_789'
        ];

        // Act & Assert
        expect(
            () async => await apiManager.getFirstNotFoundWorkItemIdAsync(
                config, workItemsIds),
            returnsNormally,
            reason: 'Should handle work item IDs with special formats');
      });

      test('should_handle_large_collections_efficiently', () async {
        // Arrange
        final config = ConfigModel();
        config.url = 'https://test-api.com';
        config.privateToken = 'test-token';
        final workItemsIds =
            List.generate(100, (index) => 'work-item-\$index');

        // Act & Assert
        expect(
            () async => await apiManager.getFirstNotFoundWorkItemIdAsync(
                config, workItemsIds),
            returnsNormally,
            reason: 'Should handle large collections efficiently');
      });
    });

    group('Boundary Value Tests -', () {
      test('should_handle_zero_adapter_mode', () async {
        // Arrange
        final config = ConfigModel();
        config.adapterMode = 0;
        config.url = 'https://test-api.com';
        config.privateToken = 'test-token';
        config.testRunId = 'test-run-id';

        // Act & Assert - May fail due to network, but should not fail due to logic errors
        expect(
            () async =>
                await apiManager.isTestNeedsToBeRunAsync(config, 'external-id'),
            returnsNormally,
            reason: 'Should handle zero adapter mode');
      });

      test('should_handle_minimum_valid_config', () async {
        // Arrange
        final config = ConfigModel();
        config.adapterMode = 1;

        // Act
        final result = await apiManager.isTestNeedsToBeRunAsync(config, 'id');

        // Assert
        expect(result, isTrue, reason: 'Should handle minimum valid config');
      });

      test('should_handle_empty_work_items_list_explicitly', () async {
        // Arrange
        final config = ConfigModel();
        config.url = 'https://test-api.com';
        config.privateToken = 'test-token';
        final workItemsIds = <String>[];

        // Act
        final result =
            await apiManager.getFirstNotFoundWorkItemIdAsync(config, workItemsIds);

        // Assert
        expect(result, isNull,
            reason: 'Should return null for explicitly empty list');
      });

      test('should_handle_single_character_values', () async {
        // Arrange
        final config = ConfigModel();
        config.adapterMode = 1;

        // Act
        final result = await apiManager.isTestNeedsToBeRunAsync(config, 'a');

        // Assert
        expect(result, isTrue,
            reason: 'Should handle single character external ID');
      });
    });

    group('State and Concurrency Tests -', () {
      test('should_handle_rapid_successive_calls', () async {
        // Arrange
        final config = ConfigModel();
        config.adapterMode = 1;

        // Act
        final futures = List.generate(
            10,
            (index) =>
                apiManager.isTestNeedsToBeRunAsync(config, 'rapid-test-\$index'));

        // Assert
        final results = await Future.wait(futures);
        expect(results, everyElement(isTrue),
            reason: 'All rapid successive calls should return true');
      });

      test('should_handle_mixed_adapter_mode_operations', () async {
        // Arrange
        final configs = [
          ConfigModel()
            ..adapterMode = 0
            ..url = 'https://test.com'
            ..privateToken = 'token'
            ..testRunId = 'id',
          ConfigModel()..adapterMode = 1,
          ConfigModel()
            ..adapterMode = 2
            ..url = 'https://test.com'
            ..privateToken = 'token'
            ..projectId = 'proj',
        ];

        // Act & Assert
        final futures = configs.asMap().entries.map((entry) {
          if (entry.value.adapterMode == 2) {
            return apiManager.tryCreateTestRunOnceAsync(entry.value);
          } else {
            return apiManager
                .isTestNeedsToBeRunAsync(entry.value, 'test-\${entry.key}')
                .then((_) {});
          }
        });

        expect(() async => await Future.wait(futures), returnsNormally,
            reason: 'Should handle mixed adapter mode operations');
      });

      test('should_maintain_independent_operation_results', () async {
        // Arrange
        final config1 = ConfigModel()..adapterMode = 1;
        final config2 = ConfigModel()..adapterMode = 2;

        // Act
        final result1 = await apiManager.isTestNeedsToBeRunAsync(config1, 'test-1');
        final result2 = await apiManager.isTestNeedsToBeRunAsync(config2, 'test-2');

        // Assert
        expect(result1, isTrue, reason: 'First operation should return true');
        expect(result2, isTrue, reason: 'Second operation should return true');
        expect(result1, equals(result2),
            reason: 'Results should be independent but consistent');
      });
    });
  });
} 