import 'package:flutter/material.dart';
import 'package:flutter_myapp/src/service/login_service.dart';

import 'login_form.dart';

LoginService _loginService = LoginService();

class Login extends StatefulWidget {
  final String title;

  const Login({Key? key, required this.title}) : super(key: key);

  _LoginState createState() => _LoginState(title);
}

class _LoginState extends State<Login> {
  final String title;

  _LoginState(this.title);

  @override
  void initState() {
    _loginService.isLogin().then((value) => {
          if (value == 'true')
            {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/home', (route) => false)
            }
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    width: 400,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      elevation: 5.0,
                      child: LoginForm(loginService: _loginService),
                    )),
              ]),
        ));
  }
}
