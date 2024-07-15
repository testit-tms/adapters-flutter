# Example

Flutter test with Test IT adapter examples.

## Setup

1. Install flutter [3.10.0+](https://docs.flutter.dev/release/archive).
2. Clone repository `git clone git@github.com:testit-tms/adapters-flutter.git`.
3. Go to adapters-flutter `cd ./adapters-flutter`.
4. Install packages `flutter pub get`.
5. Setup [configuration](https://github.com/testit-tms/adapters-flutter?tab=readme-ov-file#configuration).
6. Run tests `flutter test ./example/test/`.

## Project structure

* **attachment/** – attachments files.
* **test/** – test files.
    * **arguments_test.dart** – simple test
      with [arguments](https://github.com/testit-tms/adapters-flutter?tab=readme-ov-file#description-of-test-arguments).
    * **functions_test.dart** – simple test
      with [functions](https://github.com/testit-tms/adapters-flutter?tab=readme-ov-file#description-of-functions).
    * **steps_test.dart** – simple test
      with [steps](https://github.com/testit-tms/adapters-flutter?tab=readme-ov-file#description-of-steps).
* **example.dart** – full test example.
