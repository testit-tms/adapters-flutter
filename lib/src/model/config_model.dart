#!/usr/bin/env dart

import 'package:meta/meta.dart';
import 'package:testit_adapter_flutter/src/model/api/link_api_model.dart';

@internal
class ConfigModel {
  int? adapterMode;
  bool? automaticCreationTestCases;
  bool? automaticUpdationLinksToTestCases;
  bool? certValidation;
  String? configurationId;
  bool? isDebug;
  /// When true (default), each test result is sent immediately.
  /// When false, results are buffered and flushed in batch at tearDownAll.
  bool? importRealtime;
  String? privateToken;
  String? projectId;
  /// Port for the Sync Storage subprocess. Defaults to 49152 when not set.
  String? syncStoragePort;
  bool? testIt;
  String? testRunId;
  String? testRunName;
  /// Tags applied to the test run (not per-autotest tags).
  List<String>? testRunTags;
  /// Links applied to the test run (e.g. CI job URL), not per-autotest links.
  List<Link>? testRunLinks;
  String? url;
}
