#!/usr/bin/env dart

import 'dart:io';

final class TmsApiException extends HttpException {
  const TmsApiException(super.message);
}

final class TmsConfigException extends FormatException {
  const TmsConfigException(super.message);
}
