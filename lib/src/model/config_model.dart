#!/usr/bin/env dart

import 'package:meta/meta.dart';

@internal
class ConfigModel {
  int? adapterMode;
  bool? automaticCreationTestCases;
  bool? automaticUpdationLinksToTestCases;
  bool? certValidation;
  String? configurationId;
  bool? isDebug;
  String? privateToken;
  String? projectId;
  /// Port for the Sync Storage subprocess. Defaults to 49152 when not set.
  String? syncStoragePort;
  bool? testIt;
  String? testRunId;
  String? testRunName;
  String? url;
}
