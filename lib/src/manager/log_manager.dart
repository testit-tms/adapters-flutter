#!/usr/bin/env dart

import 'package:adapters_flutter/src/model/config_model.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:synchronized/synchronized.dart';
import 'package:universal_io/io.dart';

final _isColorsSupported =
    stdout.hasTerminal ? stdout.supportsAnsiEscapes : false;
var _isLogLevelSet = false;
final _lineLength = stdout.hasTerminal ? stdout.terminalColumns : 120;
final _lock = Lock();

@internal
Logger getLogger() {
  final logger = Logger(
      printer: PrefixPrinter(PrettyPrinter(
          colors: _isColorsSupported,
          lineLength: _lineLength,
          printTime: true)));

  return logger;
}

@internal
Future<void> setLogLevelOnceAsync(final ConfigModel? config) async =>
    await _lock.synchronized(() {
      if (!_isLogLevelSet) {
        Logger.level = (config?.isDebug ?? false) ? Level.debug : Level.info;
        _isLogLevelSet = true;
      }
    });
