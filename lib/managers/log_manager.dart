#!/usr/bin/env dart

import 'package:adapters_flutter/models/config/merged_config_model.dart';
import 'package:logger/logger.dart';
import 'package:synchronized/synchronized.dart';

final _lock = Lock();
bool _isLogLevelSet = false;

Logger getLogger() {
  final logger = Logger(
      printer: PrefixPrinter(PrettyPrinter(colors: false, printTime: true)));

  return logger;
}

Future<void> setLogLevelOnceAsync(final MergedConfigModel config) async {
  await _lock.synchronized(() {
    if (!_isLogLevelSet) {
      Logger.level = (config.isDebug ?? false) ? Level.debug : Level.info;
      _isLogLevelSet = true;
    }
  });
}
