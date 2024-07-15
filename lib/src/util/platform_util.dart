#!/usr/bin/env dart

import 'package:meta/meta.dart';
import 'package:universal_io/io.dart';

@internal
String get lineSeparator => Platform.isWindows
    ? '\r\n'
    : Platform.isMacOS
        ? '\r'
        : Platform.isLinux
            ? '\n'
            : '\n';
