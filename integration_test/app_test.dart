import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:lab66/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group(
    'Інтерфейс користувача',
    () {
      const incorrectText = 'Пароль невідповідає вимогам';
      const correctText = 'Пароль відповідає вимогам';
      testWidgets(
        'Після натискання на кнопку Перевірити, виходить текст пароль відповідає вимогам',
        (widgetTester) async {
          app.main();
          await widgetTester.pumpAndSettle();
          await widgetTester.enterText(
              find.byType(TextField), 'Aqs#@123awAdw');
          await widgetTester.pumpAndSettle();
          await widgetTester.tap(find.byType(ElevatedButton));
          await widgetTester.pumpAndSettle();

          final textElement = find.text(correctText);
          expect(textElement, findsOneWidget);
        },
      );
      testWidgets(
        'Після натискання на кнопку Перевірити, виходить текст пароль невідповідає вимогам',
        (widgetTester) async {
          app.main();
          await widgetTester.pumpAndSettle();
          await widgetTester.enterText(
              find.byType(TextField), 'asdwdawdawdwawd');
          await widgetTester.pumpAndSettle();
          await widgetTester.tap(find.byType(ElevatedButton));
          await widgetTester.pumpAndSettle();

          final textElement = find.text(incorrectText);
          expect(textElement, findsOneWidget);
        },
      );
    },
  );
}
