//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

library adapters_api;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'api_client.dart';
part 'api_helper.dart';
part 'api_exception.dart';
part 'auth/authentication.dart';
part 'auth/api_key_auth.dart';
part 'auth/oauth.dart';
part 'auth/http_basic_auth.dart';
part 'auth/http_bearer_auth.dart';

part 'api/attachments_api.dart';
part 'api/auto_tests_api.dart';
part 'api/configurations_api.dart';
part 'api/parameters_api.dart';
part 'api/project_attributes_api.dart';
part 'api/project_sections_api.dart';
part 'api/project_work_items_api.dart';
part 'api/projects_api.dart';
part 'api/sections_api.dart';
part 'api/test_results_api.dart';
part 'api/test_runs_api.dart';
part 'api/work_items_api.dart';
part 'api/workflows_api.dart';

part 'model/assign_attachment_api_model.dart';
part 'model/assign_auto_test_case_id_api_model.dart';
part 'model/assign_iteration_api_model.dart';
part 'model/attachment_api_result.dart';
part 'model/attachment_model.dart';
part 'model/attachment_put_model.dart';
part 'model/attachment_put_model_auto_test_step_results_model.dart';
part 'model/attachment_update_request.dart';
part 'model/auto_test.dart';
part 'model/auto_test_api_result.dart';
part 'model/auto_test_case_api_model.dart';
part 'model/auto_test_create_api_model.dart';
part 'model/auto_test_filter_api_model.dart';
part 'model/auto_test_id_model.dart';
part 'model/auto_test_model.dart';
part 'model/auto_test_result_reason_short.dart';
part 'model/auto_test_results_for_test_run_model.dart';
part 'model/auto_test_search_api_model.dart';
part 'model/auto_test_search_include_api_model.dart';
part 'model/auto_test_step.dart';
part 'model/auto_test_step_api_model.dart';
part 'model/auto_test_step_api_result.dart';
part 'model/auto_test_step_model.dart';
part 'model/auto_test_step_result.dart';
part 'model/auto_test_step_result_update_request.dart';
part 'model/auto_test_update_api_model.dart';
part 'model/auto_test_work_item_identifier_api_result.dart';
part 'model/available_test_result_outcome.dart';
part 'model/configuration_filter_model.dart';
part 'model/configuration_model.dart';
part 'model/configuration_short_model.dart';
part 'model/create_empty_test_run_api_model.dart';
part 'model/create_link_api_model.dart';
part 'model/create_parameter_api_model.dart';
part 'model/create_project_api_model.dart';
part 'model/create_step_api_model.dart';
part 'model/create_work_item_api_model.dart';
part 'model/custom_attribute_api_result.dart';
part 'model/custom_attribute_model.dart';
part 'model/custom_attribute_option_api_result.dart';
part 'model/custom_attribute_option_model.dart';
part 'model/custom_attribute_put_model.dart';
part 'model/custom_attribute_type.dart';
part 'model/custom_attribute_types_enum.dart';
part 'model/date_time_range_selector_model.dart';
part 'model/deletion_state.dart';
part 'model/detailed_project_api_result.dart';
part 'model/failure_category_model.dart';
part 'model/guid_extraction_model.dart';
part 'model/image_resize_type.dart';
part 'model/int32_range_selector_model.dart';
part 'model/int64_range_selector_model.dart';
part 'model/iteration_api_result.dart';
part 'model/iteration_model.dart';
part 'model/label_api_model.dart';
part 'model/label_api_result.dart';
part 'model/label_short_model.dart';
part 'model/link_api_result.dart';
part 'model/link_create_api_model.dart';
part 'model/link_model.dart';
part 'model/link_post_model.dart';
part 'model/link_put_model.dart';
part 'model/link_short_api_result.dart';
part 'model/link_type.dart';
part 'model/link_update_api_model.dart';
part 'model/manual_rerun_api_result.dart';
part 'model/manual_rerun_select_test_results_api_model.dart';
part 'model/manual_rerun_test_result_api_model.dart';
part 'model/operation.dart';
part 'model/parameter_api_result.dart';
part 'model/parameter_iteration_model.dart';
part 'model/parameter_short_api_result.dart';
part 'model/parameter_short_model.dart';
part 'model/parameters_filter_api_model.dart';
part 'model/problem_details.dart';
part 'model/project_api_result.dart';
part 'model/project_attributes_filter_model.dart';
part 'model/project_type_model.dart';
part 'model/projects_filter_model.dart';
part 'model/section_model.dart';
part 'model/section_post_model.dart';
part 'model/section_with_steps_model.dart';
part 'model/shared_step_model.dart';
part 'model/shared_step_result_api_model.dart';
part 'model/step_comment_api_model.dart';
part 'model/step_model.dart';
part 'model/step_post_model.dart';
part 'model/step_result_api_model.dart';
part 'model/tag_model.dart';
part 'model/test_result_link_api_result.dart';
part 'model/test_result_outcome.dart';
part 'model/test_result_response.dart';
part 'model/test_result_short_response.dart';
part 'model/test_result_step_comment_update_request.dart';
part 'model/test_result_update_request.dart';
part 'model/test_results_filter_api_model.dart';
part 'model/test_run_api_result.dart';
part 'model/test_run_state.dart';
part 'model/test_status_api_result.dart';
part 'model/test_status_api_type.dart';
part 'model/test_status_model.dart';
part 'model/test_status_type.dart';
part 'model/update_empty_test_run_api_model.dart';
part 'model/update_link_api_model.dart';
part 'model/validation_problem_details.dart';
part 'model/work_item_api_result.dart';
part 'model/work_item_entity_type_api_model.dart';
part 'model/work_item_filter_api_model.dart';
part 'model/work_item_id_api_model.dart';
part 'model/work_item_parameter_key_api_model.dart';
part 'model/work_item_parameter_key_api_result.dart';
part 'model/work_item_priority_api_model.dart';
part 'model/work_item_priority_model.dart';
part 'model/work_item_select_api_model.dart';
part 'model/work_item_short_api_result.dart';
part 'model/work_item_source_type_model.dart';
part 'model/work_item_state_api_model.dart';
part 'model/work_item_states.dart';
part 'model/work_item_type_model.dart';
part 'model/workflow_api_result.dart';
part 'model/workflow_status_api_result.dart';


/// An [ApiClient] instance that uses the default values obtained from
/// the OpenAPI specification file.
var defaultApiClient = ApiClient();

const _delimiters = {'csv': ',', 'ssv': ' ', 'tsv': '\t', 'pipes': '|'};
const _dateEpochMarker = 'epoch';
const _deepEquality = DeepCollectionEquality();
final _dateFormatter = DateFormat('yyyy-MM-dd');
final _regList = RegExp(r'^List<(.*)>$');
final _regSet = RegExp(r'^Set<(.*)>$');
final _regMap = RegExp(r'^Map<String,(.*)>$');

bool _isEpochMarker(String? pattern) => pattern == _dateEpochMarker || pattern == '/$_dateEpochMarker/';
