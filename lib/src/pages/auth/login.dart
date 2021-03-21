import 'package:flutter/material.dart';
import 'package:flutter_myapp/src/service/login_service.dart';

LoginService _loginService = LoginService();

class Login extends StatefulWidget {
  final String title;

  const Login({Key? key, required this.title}) : super(key: key);

  _LoginState createState() => _LoginState(title);
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();

  final String title;

  _LoginState(this.title);

  @override
  void initState() {
    _loginService.isLogin().then((value) => {
          if (value) {Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false)}
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
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                      elevation: 5.0,
                      child: Form(
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
                                  _loginService.login(context);
                                }
                              },
                              child: Text('Login'),
                            ),
                            TextButton(
                              onPressed: () {
                                _loginService.signInWithGoogle().then((value) => {
                                      if (value) {Navigator.pushNamed(context, '/home')}
                                    });
                              },
                              child: Text('Login With Google'),
                            ),
                          ],
                        ),
                      ),
                    )),
              ]),
        ));
  }
}
