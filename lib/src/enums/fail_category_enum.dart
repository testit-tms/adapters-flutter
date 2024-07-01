#!/usr/bin/env dart

import 'package:meta/meta.dart';

@internal
enum FailureCategory {
  infrastructureDefect,
  noAnalytics,
  noDefect,
  productDefect,
  testDefect
}
