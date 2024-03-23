import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:iotdashnew/controller/auth_controller.dart';

class Auth extends StatefulWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isLoginMode = true;
  AuthController _authController = Get.put(AuthController());

  void _login() {
    print("login");
    _authController.login(
        _usernameController.text.trim(), _passwordController.text.trim());
  }

  void _signup() {
    print('signup');
    _authController.signup(
        _usernameController.text.trim(), _passwordController.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isLoginMode ? 'Login' : 'Signup'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _isLoginMode ? _login : _signup,
              child: Text(_isLoginMode ? 'Login' : 'Signup'),
            ),
            SizedBox(height: 16.0),
            RichText(
              text: TextSpan(
                text: _isLoginMode
                    ? 'Don\'t have an account? '
                    : 'Already have an account? ',
                children: <TextSpan>[
                  TextSpan(
                    text: _isLoginMode ? 'Signup' : 'Login',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        setState(() {
                          _isLoginMode = !_isLoginMode;
                        });
                      },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
