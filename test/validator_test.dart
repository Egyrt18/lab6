import 'package:flutter_test/flutter_test.dart';
import 'package:lab66/validator.dart';

void main() {
group(
    'Password validator',
    () {
      final passwordValidator = PasswordValidator();
      test('Вірний пароль', () {
        const mock = 'asdwA@p1#2';
        final res = passwordValidator.validatePassword(mock);
        expect(res, true);
      });
       test('Не виконано дві умови для стійкості паролю', () {
        const mock = 'asdwswasdwasew';
        final res = passwordValidator.validatePassword(mock);
        expect(res, false);
      });
      test('Виконано дві умови(цифри та латинські маленькі літери)', () {
        const mock = 'asdwswasdwasew9';
        final res = passwordValidator.validatePassword(mock);
        expect(res, true);
      });
      test('Виконано дві умови(цифри та латинські Великі літери)', () {
        const mock = 'AWSDERTYD9';
        final res = passwordValidator.validatePassword(mock);
        expect(res, true);
    },);
    test('Невідповідна довжина паролю', () {
        const mock = 'AWSDER9';
        final res = passwordValidator.validatePassword(mock);
        expect(res, false);
    },);
}
);}
