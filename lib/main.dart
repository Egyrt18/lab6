import 'package:flutter/material.dart';
import 'package:lab66/validator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String _validationError = '';

  late final TextEditingController _con;
  final PasswordValidator _passwordValidator = PasswordValidator();

  @override
  void initState() {
    _con = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _con.dispose();
    super.dispose();
  }

  void _validate(String password) {
    final res = _passwordValidator.validatePassword(password);

    if (res) {
      _validationError = 'Пароль відповідає вимогам';
    } else {
      _validationError = 'Пароль невідповідає вимогам';
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _con,
                onChanged: (_) {
                  _validationError = '';
                  setState(() {});
                },
              ),
              Text(
                _validationError,
                key: const Key('validation_text'),
              ),
              ElevatedButton(
                onPressed: () {
                  _validate(_con.text);
                },
                style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 92, 39, 176),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                foregroundColor: Colors.black,
                textStyle: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold)),
                child: const Text('Перевірити'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

