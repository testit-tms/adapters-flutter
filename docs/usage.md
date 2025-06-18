# Практическое использование

Этот документ показывает, как интегрировать адаптер в ваш тестовый набор.

## 1. Интеграция с тестами

Для отправки результатов в Test IT необходимо обернуть ваши существующие тесты в специальные функции-раннеры: `tmsTest` и `tmsTestWidgets`.

### Для обычных тестов (`test`)

Замените стандартную функцию `test` на `tmsTest`.

**До:**
```dart
import 'package:test/test.dart';

void main() {
  test('my_test', () {
    expect(1 + 1, 2);
  });
}
```

**После:**
```dart
import 'package:testit_adapter_flutter/testit_adapter_flutter.dart';

void main() {
  tmsTest('my_test', () {
    expect(1 + 1, 2);
  });
}
```

### Для виджет-тестов (`testWidgets`)

Аналогично, замените `testWidgets` на `tmsTestWidgets`.

**До:**
```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('MyWidget has a title and message', (WidgetTester tester) async {
    await tester.pumpWidget(const MyWidget(title: 'T', message: 'M'));
    expect(find.text('T'), findsOneWidget);
  });
}
```

**После:**
```dart
import 'package:testit_adapter_flutter/testit_adapter_flutter.dart';
import 'package:flutter/material.dart';

void main() {
  tmsTestWidgets('MyWidget has a title and message', (WidgetTester tester) async {
    await tester.pumpWidget(const MyWidget(title: 'T', message: 'M'));
    expect(find.text('T'), findsOneWidget);
  });
}
```

## 2. Добавление метаданных к тесту

Вы можете обогатить свои тесты дополнительной информацией, которая будет отображаться в Test IT.

### Связывание с тест-кейсами и рабочими элементами

Используйте `externalId` для связи с существующим тест-кейсом в Test IT и `workItemIds` для связи с задачами (например, в Jira).

```dart
tmsTest(
  'Authentication test',
  () { /* ... */ },
  externalId: 'my_project_auth_test_1',
  workItemIds: {'PROJ-123', 'PROJ-456'},
);
```

### Добавление ссылок

Используйте функцию `addLink`, чтобы прикрепить к результату теста произвольные ссылки.

```dart
tmsTest('API response validation', () async {
  // ...
  addLink(
    'https://example.com/api/docs/1',
    title: 'API Documentation',
    description: 'Link to the relevant API docs.',
    type: LinkType.related,
  );
  // ...
});
```

### Добавление вложений

Функция `addAttachment` позволяет прикреплять файлы (например, скриншоты или логи) к результатам теста.

```dart
tmsTestWidgets('Login screen UI test', (WidgetTester tester) async {
  // ...
  await takeScreenshot(tester, 'login_screen.png');
  await addAttachment('login_screen.png');
  // ...
});
```
*Примечание: функция `takeScreenshot` не является частью адаптера и приведена для примера.*

## 3. Структурирование тестов с помощью шагов

Для более детальных отчетов вы можете использовать шаги. `StepManager` позволяет определять и вкладывать шаги друг в друга.

```dart
import 'package:testit_adapter_flutter/testit_adapter_flutter.dart';

void main() {
  tmsTest('User login process', () async {
    await startStep('Enter user credentials', () async {
      await startStep('Enter username', () { /* ... */ });
      await startStep('Enter password', () { /* ... */ });
    });

    await startStep('Click login button', () { /* ... */ });

    await startStep('Verify successful login', () async {
      await startStep('Check for welcome message', () { /* ... */ });
      await startStep('Check user profile icon', () { /* ... */ });
    });
  });
}
```

Функция `startStep` принимает описание и асинхронную функцию, которая будет выполнена в рамках этого шага. Вложенные вызовы `startStep` автоматически создают иерархию шагов. 