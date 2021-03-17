import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myapp/src/pages/menu/menu.dart';
import 'package:flutter_myapp/src/service/login_service.dart';

LoginService _loginService = LoginService();
Menu _menu = Menu();

class Home extends StatefulWidget {
  final String title;

  const Home({Key? key, required this.title}) : super(key: key);

  _HomeState createState() => _HomeState(title);
}

class _HomeState extends State<Home> {
  final String title;

  _HomeState(this.title);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _loginService.isLogin(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data == 'true') {
            return Scaffold(
              appBar: AppBar(
                title: Text(title),
              ),
              drawer: _menu.leftMenu(context, _loginService, title),
              body: Center(child: Text('Welcome Home')),
            );
          } else {
            Navigator.pop(context, (route) => false);
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/login', (route) => false);
          }
        }
        return CircularProgressIndicator();
      },
    );
  }
}
