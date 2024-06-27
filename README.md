# Test IT TMS Adapter for Flutter

## Getting Started

### Installation

With Dart:

```bash
dart pub add adapters_flutter
```

With Flutter:

```bash
flutter pub add adapters_flutter
```

## Usage

### Configuration

| Description                                                                                                                                                                                                                                                                                                                                                                            | File property              | Environment variable              |
|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------|-----------------------------------|
| Location of the TMS instance                                                                                                                                                                                                                                                                                                                                                           | url                        | TMS_URL                           |
| API secret key [How to getting API secret key?](https://github.com/testit-tms/.github/tree/main/configuration#privatetoken)                                                                                                                                                                                                                                                            | privateToken               | TMS_PRIVATE_TOKEN                 |
| ID of project in TMS instance [How to getting project ID?](https://github.com/testit-tms/.github/tree/main/configuration#projectid)                                                                                                                                                                                                                                                    | projectId                  | TMS_PROJECT_ID                    |
| ID of configuration in TMS instance [How to getting configuration ID?](https://github.com/testit-tms/.github/tree/main/configuration#configurationid)                                                                                                                                                                                                                                  | configurationId            | TMS_CONFIGURATION_ID              |
| ID of the created test run in TMS instance.                                                                                                                                                                                                                                                                                                                                            | testRunId                  | TMS_TEST_RUN_ID                   |
| Adapter mode. Default value - 0. The adapter supports following modes:<br/>0 - in this mode, the adapter filters tests by test run ID and configuration ID, and sends the results to the test run<br/>1 - in this mode, the adapter sends all results to the test run without filtering<br/>2 - in this mode, the adapter creates a new test run and sends results to the new test run | adapterMode                | TMS_ADAPTER_MODE                  |
| It enables/disables certificate validation (**It's optional**). Default value - true                                                                                                                                                                                                                                                                                                   | certValidation             | TMS_CERT_VALIDATION               |
| Mode of automatic creation test cases (**It's optional**). Default value - false. The adapter supports following modes:<br/>true - in this mode, the adapter will create a test case linked to the created autotest (not to the updated autotest)<br/>false - in this mode, the adapter will not create a test case                                                                    | automaticCreationTestCases | TMS_AUTOMATIC_CREATION_TEST_CASES |

#### File

Create **tms.config.json** file in the project directory:

```json
{
  "url": "URL",
  "privateToken": "USER_PRIVATE_TOKEN",
  "projectId": "PROJECT_ID",
  "configurationId": "CONFIGURATION_ID",
  "testRunId": "TEST_RUN_ID",
  "automaticCreationTestCases": false,
  "certValidation": true,
  "adapterMode": 0
}
```

### Metadata of autotest

Use metadata to specify information about autotest.

Description of metadata:

* `workItemsIds` - a method that links autotests with manual tests. Receives the array of manual
  tests' IDs
* `externalId` - unique internal autotest ID (used in Test IT)
* `title` - autotest name specified in the autotest card. If not specified, the name from the
  displayName method is used
* `description` - autotest description specified in the autotest card
* `labels` - tags listed in the autotest card
* `links` - links listed in the autotest card
* `step` - the designation of the step

Description of methods:

* `addAttachment` - add single attachment to the autotest result.
* `addAttachments` - add attachments to the autotest result.
* `addLinks` - add single link to the autotest result.
* `addLinks` - add links to the autotest result.
* `addMessage` - add message to the autotest result.

### Examples

#### Simple test

```dart
import 'package:adapters_flutter/adapters_flutter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';

final Logger _logger = Logger();

void main() {
  group('example group', () {
    setUpAll(() => _logger.i('example setup all'));

    setUp(() => _logger.i('example setup'));

    tmsTest('example test',
            externalId: 'example_externalId',
            links: [Link('link_description', 'link_title', LinkType.issue, 'https://www.example.org/')],
            tags: ['example_tag'],
            title: 'example_title',
            workItemsIds: ['45876'], () async {
              await step('success step', () => expect(0, 0));

              await step('success step with attachment', () async => await addAttachment('avatar.png'));

              await step('success step with body', () {
                const actual = 0;
                expect(actual, 0);
              });

              await step('success step with link', () async => await addLink('https://www.example.org/'));

              await step('success step with message', () async => await addMessage('example message'));

              await step('failed step', () => throw Exception('example exception'));
            });

    tearDown(() => _logger.i('example teardown'));

    tearDownAll(() => _logger.i('example teardown all'));
  });
}
```

## Contributing

You can help to develop the project. Any contributions are **greatly appreciated**.

* If you have suggestions for adding or removing projects, feel free
  to [open an issue](https://github.com/testit-tms/adapters-go/issues/new) to discuss it, or create
  a direct pull
  request after you edit the *README.md* file with necessary changes.
* Make sure to check your spelling and grammar.
* Create individual PR for each suggestion.
* Read the [Code Of Conduct](https://github.com/testit-tms/adapters-go/blob/main/CODE_OF_CONDUCT.md)
  before posting
  your first idea as well.

## License

Distributed under the Apache-2.0 License.
See [LICENSE](https://github.com/testit-tms/adapters-go/blob/main/LICENSE.md) for more information.
