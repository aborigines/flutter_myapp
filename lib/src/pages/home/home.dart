import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myapp/src/pages/menu/menu.dart';
import 'package:flutter_myapp/src/service/login_service.dart';

LoginService _loginService = LoginService();

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
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data) {
            return Scaffold(
              appBar: AppBar(
                title: Text(title),
              ),
              drawer: Menu(title: title,),
              body: Center(child: Text('Welcome Home')),
            );
          } else {
            Navigator.of(context).popAndPushNamed('/login');
          }
        }
        return CircularProgressIndicator();
      },
    );
  }
}
