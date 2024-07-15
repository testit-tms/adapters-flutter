#!/usr/bin/env dart

import 'dart:convert';

import 'package:adapters_flutter/src/model/config_model.dart';
import 'package:adapters_flutter/src/util/http_util.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

@internal
Future<Iterable<String>> getConfigurationsByProjectIdAsync(
    final ConfigModel config) async {
  final Set<String> configurations = {};

  final headers = {
    'accept': '*/*',
    'Content-Type': 'application/json',
    'Authorization': 'PrivateToken ${config.privateToken}'
  };
  final url =
      '${config.url}/api/v2/projects/${config.projectId}/configurations';
  final request = Request('GET', Uri.parse(url));
  request.headers.addAll(headers);

  final response = await getOkResponseOrNullAsync(request);

  if (response != null) {
    configurations.addAll((jsonDecode(response.body) as Iterable)
        .where((configuration) => !configuration['isDeleted'])
        .map((configuration) => configuration['id']));
  }

  return configurations;
}
