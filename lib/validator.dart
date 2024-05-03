class PasswordValidator {
  final int _minLength = 8;
  final int _minSymbolSets = 2;

  final RegExp _latinLowerCase = RegExp(r'[a-z]');
  final RegExp _latinUpperCase = RegExp(r'[A-Z]');
  final RegExp _digits = RegExp(r'\d');
  final RegExp _specialChars = RegExp(r'[\#\@\(\)\:\"\|\~`\.]');

  bool validatePassword(String password) {
    if (password.length < _minLength) {
      return false;
    }

    int symbolSetCount = 0;

    if (_latinLowerCase.hasMatch(password)) {
      symbolSetCount++;
    }
    if (_latinUpperCase.hasMatch(password)) {
      symbolSetCount++;
    }
    if (_digits.hasMatch(password)) {
      symbolSetCount++;
    }
    if (_specialChars.hasMatch(password)) {
      symbolSetCount++;
    }

    return symbolSetCount >= _minSymbolSets;
  }
}
