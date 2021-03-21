import 'package:flutter/material.dart';
import 'package:flutter_myapp/src/service/login_service.dart';

LoginService _loginService = LoginService();

class Logout extends StatefulWidget {
  final String title;

  const Logout({Key? key, required this.title}) : super(key: key);

  _LogoutState createState() => _LogoutState(title);
}

class _LogoutState extends State<Logout> {
  final String title;

  _LogoutState(this.title);

  @override
  void initState() {
    super.initState();
    _loginService.logout().then((value) => {Navigator.of(context).popAndPushNamed('/login')});
  }

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator();
  }
}
