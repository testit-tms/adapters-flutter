#!/usr/bin/env dart

import 'package:meta/meta.dart';

@internal
final class TmsApiException implements Exception {
  const TmsApiException([this.message]);

  final String? message;

  @override
  String toString() {
    const type = 'TmsApiException';
    final text = message is String ? '$type: $message' : type;

    return text;
  }
}

@internal
final class TmsConfigException implements Exception {
  const TmsConfigException([this.message]);

  final String? message;

  @override
  String toString() {
    const type = 'TmsConfigException';
    final text = message is String ? '$type: $message' : type;

    return text;
  }
}
