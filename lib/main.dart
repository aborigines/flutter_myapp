import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:flutter_myapp/src/pages/home/home.dart';
import 'package:flutter_myapp/src/pages/login/login.dart';
import 'package:flutter_myapp/src/pages/user/profile.dart';

void main() {
  loadConfig();
  setPathUrlStrategy();
  runApp(MyApp());
}

loadConfig() async {
  WidgetsFlutterBinding.ensureInitialized();
  GlobalConfiguration configuration = GlobalConfiguration();
  // await configuration.loadFromPathIntoKey("assets/cfg/auth0.json", 'auth0');
}

class MyApp extends StatelessWidget {
  final String appName = 'Flutter Demo';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: <String, WidgetBuilder>{
        '/': (context) => Login(title: appName),
        '/login': (context) => Login(title: appName),
        '/home': (context) => Home(title: appName),
        '/profile': (context) => Profile(title: appName),
      },
    );
  }
}
