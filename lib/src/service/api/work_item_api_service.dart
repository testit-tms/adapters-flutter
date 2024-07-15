#!/usr/bin/env dart

import 'dart:convert';

import 'package:adapters_flutter/src/model/config_model.dart';
import 'package:adapters_flutter/src/util/http_util.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

@internal
Future<Map<String, dynamic>?> getWorkItemByIdAsync(
    final ConfigModel config, final String? workItemId) async {
  Map<String, dynamic>? workItem;

  final headers = {
    'accept': '*/*',
    'Content-Type': 'application/json',
    'Authorization': 'PrivateToken ${config.privateToken}'
  };
  final url = '${config.url}/api/v2/workItems/$workItemId';
  final request = Request('GET', Uri.parse(url));
  request.headers.addAll(headers);

  final response = await getOkResponseOrNullAsync(request);

  if (response != null) {
    workItem = jsonDecode(response.body) as Map<String, dynamic>;
  }

  return workItem;
}
