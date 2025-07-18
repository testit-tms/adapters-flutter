# Test IT TMS Adapter for Flutter

## Getting Started

### Requirements

```yaml
sdk: '>=3.0.0 <4.0.0'
flutter: '>=3.10.0'
```

### Installation

With Dart:

```bash
dart pub add testit_adapter_flutter
```

With Flutter:

```bash
flutter pub add testit_adapter_flutter
```

## Compatibility

| Test IT | testit_adapter_flutter |
|---------|------------------------|
| 5.0     | 2.1.9+                 | 
| 5.3     | 3.1.1-TMS-5.3          |
| 5.4     | 3.2.0-TMS-5.4          |
| Cloud   | 3.2.1                  | 


Legacy versions published as adapters_flutter package

## Usage

### Configuration

| Description                                                                                                                                                                                                                                                                                                                         | File property                     | Environment variable                       | Cli property                         |
|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------|--------------------------------------------|--------------------------------------|
| Adapter mode. Default value - 0. The adapter supports following modes:<br/>0 - in this mode, the adapter sends only those autotests results that are found in the test run<br/>1 - in this mode, the adapter sends all results to the test run<br/>2 - in this mode, the adapter creates a new test run and sends all results to it | adapterMode                       | TMS_ADAPTER_MODE                           | tmsAdapterMode                       |
| Mode of automatic creation test cases (**It's optional**). Default value - false. The adapter supports following modes:<br/>true - in this mode, the adapter will create a test case linked to the created autotest (not to the updated autotest)<br/>false - in this mode, the adapter will not create a test case                 | automaticCreationTestCases        | TMS_AUTOMATIC_CREATION_TEST_CASES          | tmsAutomaticCreationTestCases        |
| Mode of automatic updation links to test cases (**It's optional**). Default value - false. The adapter supports following modes:<br/>true - in this mode, the adapter will update links to test cases<br/>false - in this mode, the adapter will not update link to test cases                                                      | automaticUpdationLinksToTestCases | TMS_AUTOMATIC_UPDATION_LINKS_TO_TEST_CASES | tmsAutomaticUpdationLinksToTestCases |
| It enables/disables certificate validation (**It's optional**). Default value - true                                                                                                                                                                                                                                                | certValidation                    | TMS_CERT_VALIDATION                        | tmsCertValidation                    |
| Name of the configuration file If it is not provided, it is used default file name (**It's optional**)                                                                                                                                                                                                                              | -                                 | TMS_CONFIG_FILE                            | tmsConfigFile                        |
| ID of configuration in TMS instance [How to getting configuration ID?](https://github.com/testit-tms/.github/tree/main/configuration#configurationid)                                                                                                                                                                               | configurationId                   | TMS_CONFIGURATION_ID                       | tmsConfigurationId                   |
| Enable debug logs (**It's optional**). Default value - false                                                                                                                                                                                                                                                                        | isDebug                           | TMS_IS_DEBUG                               | tmsIsDebug                           |
| API secret key [How to getting API secret key?](https://github.com/testit-tms/.github/tree/main/configuration#privatetoken)                                                                                                                                                                                                         | privateToken                      | TMS_PRIVATE_TOKEN                          | tmsPrivateToken                      |
| ID of project in TMS instance [How to getting project ID?](https://github.com/testit-tms/.github/tree/main/configuration#projectid)                                                                                                                                                                                                 | projectId                         | TMS_PROJECT_ID                             | tmsProjectId                         |
| It enables/disables TMS integration (**It's optional**). Default value - true                                                                                                                                                                                                                                                       | testIt                            | TMS_TEST_IT                                | tmsTestIt                            |
| ID of the created test run in TMS instance.<br/>It's necessary for **adapterMode** 0 or 1                                                                                                                                                                                                                                           | testRunId                         | TMS_TEST_RUN_ID                            | tmsTestRunId                         |
| Parameter for specifying the name of test run in TMS instance (**It's optional**). If it is not provided, it is created automatically                                                                                                                                                                                               | testRunName                       | TMS_TEST_RUN_NAME                          | tmsTestRunName                       |
| Url of the TMS instance                                                                                                                                                                                                                                                                                                             | url                               | TMS_URL                                    | tmsUrl                               |

#### File

Create **testit.properties** file in the project root directory:

```properties
adapterMode={%ADAPTER_MODE%}
automaticCreationTestCases={%AUTOMATIC_CREATION_TESTCASES%}
automaticUpdationLinksToTestCases={%AUTOMATIC_UPDATION_LINKS_TO_TESTCASES%}
certValidation={%CERTIFICATE_VALIDATION%}
configurationId={%CONFIGURATION_ID%}
isDebug={%IS_DEBUG%}
privateToken={%USER_PRIVATE_TOKEN%}
projectId={%PROJECT_ID%}
testIt={%TEST_IT%}
testRunId={%TEST_RUN_ID%}
testRunName={%TEST_RUN_NAME%}
url={%URL%}
```

#### Command-line

```bash
flutter test --dart-define=tmsAdapterMode={%ADAPTER_MODE%} --dart-define=tmsAutomaticCreationTestCases={%AUTOMATIC_CREATION_TESTCASES%} --dart-define=tmsAutomaticUpdationLinksToTestCases={%AUTOMATIC_UPDATION_LINKS_TO_TESTCASES%} --dart-define=tmsCertValidation={%CERTIFICATE_VALIDATION%} --dart-define=tmsConfigFile={%CONFIG_FILE%}  --dart-define=tmsConfigurationId={%CONFIGURATION_ID%} --dart-define=tmsIsDebug={%IS_DEBUG%} --dart-define=tmsPrivateToken={%USER_PRIVATE_TOKEN%} --dart-define=tmsProjectId={%PROJECT_ID%} --dart-define=tmsTestIt={%TEST_IT%} --dart-define=tmsTestRunId={%TEST_RUN_ID%} --dart-define=tmsTestRunName={%TEST_RUN_NAME%} --dart-define=tmsUrl={%URL%}
```

### Metadata of autotest

Use metadata to specify information about autotest.

#### Description of test arguments:

* `description` - autotest description specified in the autotest card.
* `externalId` - unique internal autotest ID (used in Test IT).
* `links` - links listed in the autotest card.
* `tags` - tags listed in the autotest card.
* `title` - autotest name specified in the autotest card. If not specified, the test name is used.
* `workItemsIds` - a method that links autotests with manual tests. Receives the set of manual
  tests' IDs.

#### Description of functions:

* `addAttachment` - add single attachment to the autotest result.
* `addAttachments` - add attachments to the autotest result.
* `addLink` - add single link to the autotest result.
* `addLinks` - add links to the autotest result.
* `addMessage` - add message to the autotest result.

#### Description of steps:

* `step` - autotest step implementation.

## Contributing

You can help to develop the project. Any contributions are **greatly appreciated**.

* If you have suggestions for adding or removing projects, feel free
  to [open an issue](https://github.com/testit-tms/adapters-flutter/issues/new) to discuss it, or
  create
  a direct pull
  request after you edit the *README.md* file with necessary changes.
* Make sure to check your spelling and grammar.
* Create individual PR for each suggestion.
* Read
  the [Code Of Conduct](https://github.com/testit-tms/adapters-flutter/blob/main/CODE_OF_CONDUCT.md)
  before posting
  your first idea as well.

## License

Distributed under the Apache-2.0 License.
See [LICENSE](https://github.com/testit-tms/adapters-flutter/blob/main/LICENSE) for more
information.
