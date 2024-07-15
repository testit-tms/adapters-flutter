#!/usr/bin/env dart

import 'dart:io';

import 'package:meta/meta.dart';

@internal
String get lineSeparator => Platform.isWindows
    ? '\r\n'
    : Platform.isMacOS
        ? '\r'
        : Platform.isLinux
            ? '\n'
            : '\n';
