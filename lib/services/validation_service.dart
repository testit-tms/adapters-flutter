import 'package:adapters_flutter/models/config/merged_config_model.dart';
import 'package:adapters_flutter/models/exception_model.dart';
import 'package:uuid/uuid.dart';

void validateConfig(final MergedConfigModel? config) {
  if (config == null) {
    throw const TmsConfigException('Config is null');
  }

  if (config.adapterMode == 0 || config.adapterMode == 1) {
    if (config.testRunId == null ||
        !Uuid.isValidUUID(fromString: config.testRunId!)) {
      throw const TmsConfigException('TestRunID is invalid');
    }
  } else if (config.adapterMode == 2) {
    if (config.testRunId != null && config.testRunId!.isNotEmpty) {
      throw const TmsConfigException(
          'TestRunID should be absent in adapter mode 2');
    }
  } else {
    throw TmsConfigException('Invalid adapter mode: ${config.adapterMode}');
  }

  if (config.projectId == null ||
      !Uuid.isValidUUID(fromString: config.projectId!)) {
    throw const TmsConfigException('ProjectId is invalid');
  }

  if (config.configurationId == null ||
      !Uuid.isValidUUID(fromString: config.configurationId!)) {
    throw const TmsConfigException('ConfigurationId is invalid');
  }

  if (config.privateToken == null || config.privateToken!.isEmpty) {
    throw const TmsConfigException('PrivateToken is invalid');
  }

  if (config.url == null || !Uri.parse(config.url!).isAbsolute) {
    throw const TmsConfigException('Url is invalid');
  }
}
