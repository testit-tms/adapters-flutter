#!/usr/bin/env dart

/// Recommended autotest pyramid layer names (not enforced by the adapter).
abstract final class TestLayers {
  static const e2e = 'E2E';
  static const ui = 'UI';
  static const api = 'API';
  static const contract = 'Contract';
  static const integration = 'Integration';
  static const component = 'Component';
  static const unit = 'Unit';
}
