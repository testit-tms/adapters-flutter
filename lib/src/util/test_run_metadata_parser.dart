#!/usr/bin/env dart

import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:testit_adapter_flutter/src/enum/link_type_enum.dart';
import 'package:testit_adapter_flutter/src/manager/log_manager.dart';
import 'package:testit_adapter_flutter/src/model/api/link_api_model.dart';
import 'package:logger/logger.dart';

final Logger _logger = getLogger();

/// Parses test-run tags: comma-separated list or JSON array of strings.
@internal
List<String>? parseTestRunTags(final String? raw) {
  if (raw == null) return null;
  final trimmed = raw.trim();
  if (trimmed.isEmpty) return null;

  if (trimmed.startsWith('[')) {
    try {
      final decoded = jsonDecode(trimmed);
      if (decoded is! List) {
        _logger.w('testRunTags JSON must be an array of strings');
        return null;
      }
      final tags = decoded
          .map((final e) => e?.toString().trim() ?? '')
          .where((final t) => t.isNotEmpty)
          .toList();
      return tags.isEmpty ? null : tags;
    } on FormatException catch (e) {
      _logger.w('Invalid testRunTags JSON: $e');
      return null;
    }
  }

  final tags = trimmed
      .split(',')
      .map((final t) => t.trim())
      .where((final t) => t.isNotEmpty)
      .toList();
  return tags.isEmpty ? null : tags;
}

/// Parses test-run links: JSON array of objects with required `url`.
@internal
List<Link>? parseTestRunLinks(final String? raw) {
  if (raw == null) return null;
  final trimmed = raw.trim();
  if (trimmed.isEmpty) return null;

  try {
    final decoded = jsonDecode(trimmed);
    if (decoded is! List) {
      _logger.w('testRunLinks must be a JSON array');
      return null;
    }

    final links = <Link>[];
    for (final item in decoded) {
      if (item is! Map) {
        _logger.w('testRunLinks item must be an object, skipped');
        continue;
      }
      final map = item.cast<String, dynamic>();
      final url = map['url']?.toString().trim();
      if (url == null || url.isEmpty) {
        _logger.w('testRunLinks item missing url, skipped');
        continue;
      }
      links.add(Link(
        url,
        title: map['title']?.toString(),
        description: map['description']?.toString(),
        type: _parseLinkType(map['type']?.toString()),
      ));
    }
    return links.isEmpty ? null : links;
  } on FormatException catch (e) {
    _logger.w('Invalid testRunLinks JSON: $e');
    return null;
  }
}

LinkType _parseLinkType(final String? raw) {
  if (raw == null || raw.trim().isEmpty) return LinkType.related;
  switch (raw.trim().toLowerCase()) {
    case 'related':
      return LinkType.related;
    case 'blockedby':
      return LinkType.blockedBy;
    case 'defect':
      return LinkType.defect;
    case 'issue':
      return LinkType.issue;
    case 'requirement':
      return LinkType.requirement;
    case 'repository':
      return LinkType.repository;
    default:
      _logger.w('Unknown link type "$raw", using Related');
      return LinkType.related;
  }
}
