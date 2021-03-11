import 'package:flutter/material.dart';
import 'package:flutter_myapp/src/pages/menu/menu.dart';
import 'package:flutter_myapp/src/service/login_service.dart';

LoginService _loginService = LoginService();
Menu _menu = Menu();

class Profile extends StatefulWidget {
  final String title;

  const Profile({Key key, @required this.title}) : super(key: key);

  _ProfileState createState() => _ProfileState(title);
}

class _ProfileState extends State<Profile> {
  final String title;

  _ProfileState(this.title);

  @override
  void initState() {
    _loginService.isLogin().then((value) => {
          if (value != 'true')
            {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/login', (route) => false)
            }
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _loginService.user(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var data = snapshot.data;
          return Scaffold(
            appBar: AppBar(
              title: Text(title),
            ),
            drawer: _menu.leftMenu(context, _loginService, title),
            body: Center(child: Text.rich(
              TextSpan(children: [
                TextSpan(text: data)
              ])
            )),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
