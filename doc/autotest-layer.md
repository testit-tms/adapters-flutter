# Autotest layer (test pyramid)

Документ описывает реализацию слоя пирамиды тестирования на карточке **автотеста** в Flutter-адаптере Test IT (версия **5.1.2+**).

Спецификация: [tz-autotest-layer.md](../tz-autotest-layer.md).

## Назначение

TMS позволяет указать **layer** (уровень пирамиды: `API`, `E2E`, `Unit` и т.д.) на карточке автотеста. Источник может быть Manual, Rule, Report или **Run** (адаптер).

Flutter-адаптер передаёт слой при **create/update** автотеста, если пользователь явно указал его **в коде теста**. Источник в API всегда **`Run`**.

## Что сделано

| Компонент | Изменение |
|-----------|-----------|
| `TestResultModel` | Поле `layer` (`String?`) |
| `TestLayers` | Рекомендуемые константы: `E2E`, `UI`, `API`, `Contract`, `Integration`, `Component`, `Unit` |
| `tmsTest` / `tmsTestWidgets` | Параметр `layer` |
| `test_result_converter.dart` | Маппинг в `LayerApiModel`; на update — `resetLayer: false` |
| `test_result_storage.dart` | Проброс `layer` при слиянии результата |
| `testit_adapter_flutter.dart` | Экспорт `TestLayers` |
| Тесты | `test/converter/test_result_converter_test.dart` |
| Документация | `README.md`, `doc/usage.md`, `CHANGELOG.md` |

## Как объявить слой в тесте

Слой задаётся **только** аргументом `layer` у `tmsTest` / `tmsTestWidgets`. Нет env, CLI и file-config для layer.

```dart
import 'package:testit_adapter_flutter/testit_adapter_flutter.dart';

void main() {
  tmsTest(
    'create user',
    () {
      expect(1 + 1, 2);
    },
    layer: TestLayers.api,
  );

  tmsTestWidgets(
    'login screen',
    (tester) async {
      // ...
    },
    layer: TestLayers.e2e,
  );

  tmsTest(
    'custom layer name',
    () { /* ... */ },
    layer: 'my-custom-layer',
  );
}
```

### Рекомендуемые константы

```dart
TestLayers.e2e
TestLayers.ui
TestLayers.api
TestLayers.contract
TestLayers.integration
TestLayers.component
TestLayers.unit
```

Любая другая непустая строка принимается без валидации.

## Правила маппинга в API

| Сценарий | Create autotest | Update autotest |
|----------|-----------------|-----------------|
| `layer` указан в тесте | `layer: { name, source: Run }` | `resetLayer: false`, `layer: { name, source: Run }` |
| `layer` не указан | поле `layer` не заполняется | `resetLayer: false`, поле `layer` не заполняется |

Пример JSON при указанном слое:

```json
{
  "layer": {
    "name": "API",
    "source": "Run"
  }
}
```

На **update** адаптер **всегда** отправляет `resetLayer: false`, даже если `layer` не задан. Слой в TMS **не сбрасывается**, если аннотация отсутствует.

## Поток данных

```
tmsTest(..., layer: TestLayers.api)
    → testAsync → TestResultModel.layer
    → test_result_storage (merge)
    → toAutoTestCreateApiModel / toAutoTestUpdateApiModel
    → Adapters API (POST/PUT autotest)
    → TMS
```

При **failed**-тесте используется тот же путь update: слой из параметра `layer` попадает в `AutoTestUpdateApiModel` вместе с `resetLayer: false`.

## Независимость от других метаданных

- **Layer ≠ labels** — labels берутся из metadata тегов Flutter test / параметра `labels`
- **Layer ≠ tags** — tags — отдельное поле автотеста
- **Layer ≠ test run tags** — теги прогона задаются через `testRunTags` / конфиг

## Вне scope

- layer на сущности **test run**
- layer на **test result** как отдельное поле API
- default layer на весь прогон через конфиг
- runtime API (`addLayer()` и т.п.)
- `resetLayer: true` при отсутствии layer в тесте
- валидация имени layer по whitelist

## Связанные материалы

- [usage.md](./usage.md) — краткий пример в разделе «Слой автотеста»
- [README.md](../README.md) — секция **Autotest layer**
- [CHANGELOG.md](../CHANGELOG.md) — запись `[5.1.2]`
