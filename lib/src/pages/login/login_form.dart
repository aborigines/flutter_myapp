import 'package:flutter/material.dart';
import 'package:flutter_myapp/src/service/login_service.dart';

class LoginForm extends StatefulWidget {
  final LoginService loginService;

  LoginForm({Key? key, required this.loginService}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState(loginService);
}

class _LoginFormState extends State<LoginForm> {
  final LoginService loginService;
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();

  _LoginFormState(this.loginService);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              autofocus: true,
              controller: _email,
              decoration: InputDecoration(hintText: 'Email'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter email';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _password,
              obscureText: true,
              autocorrect: false,
              decoration: InputDecoration(hintText: 'Password'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter password';
                }
                return null;
              },
            ),
          ),
          TextButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                this.loginService.login(context);
              }
            },
            child: Text('Login'),
          ),
          InkWell(onTap:() => {
            Navigator.pushNamedAndRemoveUntil(context, 'login-oauth', (route) => false)
          }, child: Text("Login via OAuth"),)
        ],
      ),
    );
  }
}
