import 'package:flutter_test/flutter_test.dart';
import 'package:testit_adapter_flutter/src/service/config/file_config_service.dart';
import 'package:universal_io/io.dart';
import 'package:path/path.dart' as p;

void main() {
  group('FileConfigService', () {
    late String tempDir;

    setUp(() {
      tempDir = Directory.systemTemp.createTempSync('testit_test_').path;
    });

    tearDown(() {
      final dir = Directory(tempDir);
      if (dir.existsSync()) {
        dir.deleteSync(recursive: true);
      }
    });

    test('getConfigFromFileAsync should return empty config if path is null',
        () async {
      // Act
      final config = await getConfigFromFileAsync(null);

      // Assert
      expect(config.url, isNull);
      expect(config.privateToken, isNull);
    });

    test(
        'getConfigFromFileAsync should return empty config if path does not exist',
        () async {
      // Act
      final config =
          await getConfigFromFileAsync(p.join(tempDir, 'non_existent.json'));

      // Assert
      expect(config.url, isNull);
      expect(config.privateToken, isNull);
    });

    test('getConfigFromFileAsync should load config from properties file',
        () async {
      // Arrange
      final filePath = p.join(tempDir, 'testit.properties');
      final file = File(filePath);
      await file.writeAsString('''
url=https://test.it
privateToken=secret-token
projectId=project-id
configurationId=config-id
testRunId=testrun-id
testRunName=Test Run
adapterMode=0
automaticCreationTestCases=true
automaticUpdationLinksToTestCases=false
certValidation=true
isDebug=true
testIt=true
''');

      // Act
      final config = await getConfigFromFileAsync(filePath);

      // Assert
      expect(config.url, 'https://test.it');
      expect(config.privateToken, 'secret-token');
      expect(config.projectId, 'project-id');
      expect(config.configurationId, 'config-id');
      expect(config.testRunId, 'testrun-id');
      expect(config.testRunName, 'Test Run');
      expect(config.adapterMode, 0);
      expect(config.automaticCreationTestCases, isTrue);
      expect(config.automaticUpdationLinksToTestCases, isFalse);
      expect(config.certValidation, isTrue);
      expect(config.isDebug, isTrue);
      expect(config.testIt, isTrue);
    });

    test(
        'getConfigFromFileAsync should add warning when privateToken is specified',
        () async {
      // Arrange
      final filePath = p.join(tempDir, 'testit.properties');
      final file = File(filePath);
      await file.writeAsString('privateToken=secret-token');
      clearConfigFileWarnings();

      // Act
      await getConfigFromFileAsync(filePath);

      // Assert
      final warnings = getConfigFileWarnings();
      expect(warnings, isNotEmpty);
      expect(
          warnings.first,
          contains(
              'specifies a private token. Use "TMS_PRIVATE_TOKEN" environment variable instead.'));
    });
  });
} 