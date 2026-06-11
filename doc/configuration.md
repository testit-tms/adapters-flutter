# Конфигурация адаптера

Адаптер можно настроить тремя способами. Они имеют следующий приоритет (каждый последующий способ переопределяет предыдущий):

1.  **Файл конфигурации (`testit.json`)**
2.  **Переменные окружения**
3.  **Аргументы командной строки**

## 1. Файл конфигурации

Вы можете создать файл `testit.json` в корневой директории вашего проекта и указать в нем базовые параметры.

**Пример `testit.json`:**
```json
{
  "url": "https://demo.testit.software",
  "privateToken": "ВашТокен",
  "projectId": "ID-вашего-проекта",
  "configurationId": "ID-вашей-конфигурации",
  "testRunId": "ID-вашего-тест-рана",
  "testRunName": "Мой Тестовый Запуск",
  "adapterMode": "0",
  "automaticCreationTestCases": "true",
  "importRealtime": "true"
}
```

Чтобы адаптер использовал этот файл, передайте путь к нему через переменную окружения `TMS_CONFIG_FILE` или аргумент командной строки `tmsConfigFile`.

## 2. Переменные окружения

Вы можете переопределить или задать параметры с помощью переменных окружения.

| Переменная | Описание |
| --- | --- |
| `TMS_URL` | URL вашего экземпляра Test IT |
| `TMS_PRIVATE_TOKEN` | Приватный токен для доступа к API |
| `TMS_PROJECT_ID` | UUID проекта в Test IT |
| `TMS_CONFIGURATION_ID` | UUID конфигурации в Test IT |
| `TMS_TEST_RUN_ID` | UUID существующего тест-рана |
| `TMS_TEST_RUN_NAME` | Имя для нового тест-рана (если `adapterMode=2`) |
| `TMS_ADAPTER_MODE` | Режим работы адаптера (0, 1 или 2) |
| `TMS_IMPORT_REALTIME` | Режим проливки результатов в Test IT. `true` (по умолчанию) — после каждого теста; `false` — накопление в буфере и batch-проливка (см. [Использование — batch-режим](./usage.md#4-режим-batch-проливки-importrealtimefalse)) |
| `TMS_AUTOMATIC_CREATION_TEST_CASES` | Автоматическое создание тест-кейсов (`true`/`false`) |
| ... | и другие параметры |

## 3. Аргументы командной строки

Наивысший приоритет имеют аргументы, переданные при запуске тестов через `dart test --dart-define`.

**Пример:**
```bash
dart test --dart-define=tmsUrl=https://your.testit.domain \\
           --dart-define=tmsPrivateToken=YourToken \\
           --dart-define=tmsProjectId=...
```

## Все параметры конфигурации

| Параметр | JSON ключ / Переменная окружения / Аргумент CLI | Описание |
|---|---|---|
| URL | `url` / `TMS_URL` / `tmsUrl` | **(Обязательный)** URL вашего экземпляра Test IT. |
| Приватный токен | `privateToken` / `TMS_PRIVATE_TOKEN` / `tmsPrivateToken` | **(Обязательный)** Приватный токен для доступа к API. |
| ID Проекта | `projectId` / `TMS_PROJECT_ID` / `tmsProjectId` | **(Обязательный)** UUID проекта. |
| ID Конфигурации | `configurationId` / `TMS_CONFIGURATION_ID` / `tmsConfigurationId` | **(Обязательный)** UUID конфигурации тестов. |
| ID Тест-рана | `testRunId` / `TMS_TEST_RUN_ID` / `tmsTestRunId` | ID существующего тест-рана. Обязателен для `adapterMode` 0 и 1. |
| Имя Тест-рана | `testRunName` / `TMS_TEST_RUN_NAME` / `tmsTestRunName` | Имя для автоматически создаваемого тест-рана. Используется в `adapterMode` 2. |
| Режим адаптера | `adapterMode` / `TMS_ADAPTER_MODE` / `tmsAdapterMode` | Режим работы: `0` - результаты отправляются в существующий тест-ран по `testRunId`, `1` - то же, что и 0, но создает новые тест-кейсы (не рекомендуется), `2` - создает новый тест-ран и отправляет в него результаты. |
| Авто-создание | `automaticCreationTestCases` / `TMS_AUTOMATIC_CREATION_TEST_CASES` / `tmsAutomaticCreationTestCases` | Если `true`, адаптер будет автоматически создавать в Test IT тест-кейсы, которых еще нет. |
| Валидация сертификата | `certValidation` / `TMS_CERT_VALIDATION` / `tmsCertValidation` | Включает или отключает валидацию SSL-сертификата. По умолчанию `true`. |
| Режим отладки | `isDebug` / `TMS_IS_DEBUG` / `tmsIsDebug` | Включает расширенное логирование. |
| Режим проливки | `importRealtime` / `TMS_IMPORT_REALTIME` / `tmsImportRealtime` | См. раздел ниже. По умолчанию `true`. |
| Включить адаптер | `testIt` / `TMS_TEST_IT` / `tmsTestIt` | Глобальный переключатель для включения/отключения адаптера. По умолчанию `true`. |

## Режим проливки (`importRealtime`)

Параметр управляет тем, **когда** результаты тестов отправляются в Test IT. Формирование `externalId` и привязка к существующим автотестам **не меняются** в обоих режимах.

| Значение | Поведение | Sync Storage | `onBlockCompleted` |
| --- | --- | --- | --- |
| `true` (по умолчанию) | После каждого `tmsTest` / `tmsTestWidgets` — create/update автотеста и отправка результата в test run | Первый тест master-воркера → `InProgress`, early return | После **каждого** теста |
| `false` | Результат попадает в буфер; проливка пачкой при `tearDownAll` | Та же ветка для первого теста на master | Один раз при flush |

### Настройка batch-режима (`importRealtime=false`)

1. Задайте параметр в `testit.properties`, `TMS_IMPORT_REALTIME=false` или `--dart-define=tmsImportRealtime=false`.
2. В начале `main()` каждого тестового файла вызовите `tmsConfigureBatchImport()` — регистрируется корневой `tearDownAll` для финального сброса буфера.
3. При первом тесте в группе автоматически регистрируется `tearDownAll` этой группы (сброс накопленных результатов группы).

```dart
import 'package:testit_adapter_flutter/testit_adapter_flutter.dart';

void main() {
  tmsConfigureBatchImport();

  group('my tests', () {
    tmsTest('example', () { /* ... */ });
  });
}
```

### Явный flush в CI

`flutter test` запускает **каждый файл** в отдельном isolate. Буфер и flush — **на уровне файла**. Для полного контроля после всех файлов вызовите публичный API:

```dart
await tmsFlushPendingResultsAsync();
```

В CI это можно сделать отдельным шагом или из общего `tearDownAll`, если все тесты в одном `main()`.

### Что происходит при batch-проливке

1. Автотесты создаются/обновляются пачками (`createMultiple` / `updateMultiple`).
2. Результаты в test run отправляются **по одному** (`submitResultToTestRun`), как в realtime — это нужно, когда `tmsTest` и `tmsTestWidgets` имеют одинаковое имя и один `externalId`, но должны дать **два** результата в test run.
3. Bulk-эндпоинт `setAutoTestResultsForTestRun` с массивом результатов **не используется**: API дедуплицирует записи по `autoTestExternalId` внутри одного запроса.

### Переменные окружения (пример)

```bash
export TMS_IMPORT_REALTIME=false
flutter test ./test/
``` 