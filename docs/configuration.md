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
  "automaticCreationTestCases": "true"
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
| Включить адаптер | `testIt` / `TMS_TEST_IT` / `tmsTestIt` | Глобальный переключатель для включения/отключения адаптера. По умолчанию `true`. |

</rewritten_file> 