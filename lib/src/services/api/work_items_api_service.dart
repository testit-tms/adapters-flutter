#!/usr/bin/env dart

import 'dart:convert';

import 'package:adapters_flutter/src/utils/http_util.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

@internal
Future<Map<String, dynamic>?> getWorkItemByIdAsync(String? workItemId) async {
  Map<String, dynamic>? workItem;

  final url = await getUrlAsync('/api/v2/workItems/$workItemId');
  final request = Request('GET', url);
  await addHeadersToRequestAsync(request);

  final response = await getOkResponseOrNullAsync(request);

  if (response != null) {
    workItem = jsonDecode(response.body) as Map<String, dynamic>;
  }

  return workItem;
}
