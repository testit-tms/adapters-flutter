#!/usr/bin/env dart

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

final class TmsArgumentException implements Exception {
  const TmsArgumentException([this.message]);

  final String? message;

  @override
  String toString() {
    const type = 'TmsArgumentException';
    final text = message is String ? '$type: $message' : type;

    return text;
  }
}

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
