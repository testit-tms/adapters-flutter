#!/usr/bin/env dart

import 'package:adapters_flutter/models/config_model.dart';
import 'package:logger/logger.dart';
import 'package:synchronized/synchronized.dart';

var _isLogLevelSet = false;
final _lock = Lock();

Logger getLogger() {
  final logger = Logger(
      printer: PrefixPrinter(PrettyPrinter(colors: false, printTime: true)));

  return logger;
}

Future<void> setLogLevelOnceAsync(final ConfigModel? config) async =>
    await _lock.synchronized(() {
      if (!_isLogLevelSet) {
        Logger.level = (config?.isDebug ?? false) ? Level.debug : Level.info;
        _isLogLevelSet = true;
      }
    });
