#!/usr/bin/env dart

import 'dart:io';

import 'package:testit_adapter_flutter/src/manager/adapter_manager.dart';
import 'package:testit_adapter_flutter/src/manager/config_manager.dart';
import 'package:testit_adapter_flutter/src/manager/i_api_manager.dart';
import 'package:testit_adapter_flutter/src/model/api/link_api_model.dart';
import 'package:testit_adapter_flutter/src/model/config_model.dart';
import 'package:testit_adapter_flutter/src/storage/test_result_storage.dart';
import 'package:test_api/src/backend/invoker.dart'; // ignore: depend_on_referenced_packages, implementation_imports
import 'package:universal_io/io.dart';
import 'package:path/path.dart' as path;
import 'package:flutter_test/flutter_test.dart';
import 'package:testit_api_client_dart/api.dart' as api;
import 'package:logger/logger.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'adapter_manager_test.mocks.dart';

// Helper function to get the current test's canonical ID.
String _getTestId() {
  final liveTest = Invoker.current!.liveTest;
  return path.canonicalize(path.join(liveTest.suite.path ?? '', liveTest.test.name))
      .replaceAll(path.canonicalize(Directory.current.path), '');
}

@GenerateMocks([IApiManager])
void main() {
  group('AdapterManager Tests -', () {
    late Directory tempDir;
    late File testFile;
    late MockIApiManager mockApiManager;
    late AdapterManager adapterManager;
    late Level originalLogLevel;

    setUpAll(() async {
      // Create a temporary directory and a test file once for all tests
      tempDir = await Directory.systemTemp.createTemp('test_adapter_manager');
      testFile = File(path.join(tempDir.path, 'test_attachment.txt'));
      await testFile.writeAsString('test attachment content');
    });

    tearDownAll(() async {
      // Clean up the temporary directory after all tests are done
      if (await tempDir.exists()) {
        await tempDir.delete(recursive: true);
      }
    });

    setUp(() {
      // Config setup
      final testConfig = ConfigModel()
        ..url = 'http://localhost'
        ..privateToken = 'token'
        ..projectId = 'project-id'
        ..configurationId = 'config-id'
        ..testRunId = 'test-run-id'
        ..testIt = true;
      setTestConfiguration(testConfig);

      // API Manager Mock
      mockApiManager = MockIApiManager();
      adapterManager = AdapterManager(mockApiManager);

      // Logger setup
      originalLogLevel = Logger.level;
      Logger.level = Level.off;

      // TestResult setup
      createEmptyTestResultAsync();
    });

    tearDown(() {
      // TestResult cleanup
      final testId = _getTestId();
      try {
        removeTestResultByTestIdAsync(testId);
      } catch (e) {
        // Ignore if already cleaned up or never created
      }
      
      // Config and Logger cleanup
      clearTestConfiguration();
      Logger.level = originalLogLevel;
    });

    group('addAttachment Tests -', () {
      test('should handle a valid file path and not throw', () async {
        // Arrange
        final filePath = testFile.path;
        when(mockApiManager.tryCreateAttachmentAsync(any, any)).thenAnswer(
            (_) async => api.AttachmentModel(
                id: 'attachment-id',
                name: 'test.txt',
                size: 100,
                fileId: 'file-id',
                createdById: 'user-id',
                createdDate: DateTime.now(),
                type: 'text/plain'));

        // Act & Assert
        await expectLater(
            () async => await adapterManager.addAttachment(filePath),
            returnsNormally);
        // verify(mockApiManager.tryCreateAttachmentAsync(any, any)).called(1);
      });

      test('should not throw for a non-existent file path', () async {
        // Arrange
        const invalidPath = '/non/existent/path/file.txt';

        // Act & Assert
        await expectLater(
            () async => await adapterManager.addAttachment(invalidPath),
            returnsNormally);
        verifyNever(mockApiManager.tryCreateAttachmentAsync(any, any));
      });
    });

    group('addAttachments Tests -', () {
      test('should handle a set of valid and invalid paths and not throw',
          () async {
        // Arrange
        final paths = {testFile.path, '/non/existent/path/file.txt'};
          when(mockApiManager.tryCreateAttachmentAsync(any, any)).thenAnswer(
              (_) async => api.AttachmentModel(
                  id: 'attachment-id',
                  name: 'test.txt',
                  size: 100,
                  fileId: 'file-id',
                  createdById: 'user-id',
                  createdDate: DateTime.now(),
                  type: 'text/plain'));

          // Act & Assert
          await expectLater(
              () async => await adapterManager.addAttachments(paths),
              returnsNormally);
          //verify(mockApiManager.tryCreateAttachmentAsync(any, any)).called(1);
        });
      });
    

    group('addLink Tests -', () {
      test('should add a valid link', () async {
        // Arrange
        const url = 'https://example.com';

        // Act
        await adapterManager.addLink(url, title: 'Example');

        // Assert
        final result = await removeTestResultByTestIdAsync(_getTestId());
        expect(result!.links, hasLength(1));
        expect(result.links.first.url, url);
      });

      test('should not add a link if url is empty', () async {
        // Arrange
        const url = '';

        // Act
        await adapterManager.addLink(url);

        // Assert
        final result = await removeTestResultByTestIdAsync(_getTestId());
        expect(result!.links, isEmpty);
      });
    });

    group('addLinks Tests -', () {
      test('should add a set of links', () async {
        // Arrange
        final links = {
          Link('https://test.com'),
          Link('https://example.com')
        };

        // Act
        await adapterManager.addLinks(links);

        // Assert
        final result = await removeTestResultByTestIdAsync(_getTestId());
        expect(result!.links, hasLength(2));
      });
    });

    group('addMessage Tests -', () {
      test('should add a message', () async {
        // Arrange
        const message = 'This is a test message';

        // Act
        await adapterManager.addMessage(message);

        // Assert
        final result = await removeTestResultByTestIdAsync(_getTestId());
        expect(result!.message, contains(message));
      });
    });

    group('Configuration Tests -', () {
      test('should not perform actions if testIt is false', () async {
        // Arrange
        final config = await createConfigOnceAsync();
        config.testIt = false; // Disable the adapter

        // Act
        await adapterManager.addLink('https://should-not-be-added.com');
        
        // Assert
        final result = await removeTestResultByTestIdAsync(_getTestId());
        expect(result!.links, isEmpty);

        // Cleanup is handled by tearDown
      });
    });
  });
}
 