import 'package:flutter/material.dart';
import 'package:flutter_myapp/src/pages/auth/logout.dart';
import 'package:flutter_myapp/src/pages/error/not_found.dart';
import 'package:flutter_myapp/src/pages/home/home.dart';
import 'package:flutter_myapp/src/pages/auth//login.dart';
import 'package:flutter_myapp/src/pages/user/profile.dart';
import 'package:flutter_myapp/src/service/login_service.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setPathUrlStrategy();
  runApp(MyApp());
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
      initialRoute: '/login',
      routes: <String, WidgetBuilder>{
        '/login': (context) => Login(title: appName),
        '/logout': (context) => Logout(title: appName),
        '/home': (context) => Home(title: appName),
        '/profile': (context) => Profile(title: appName),
      },
      onUnknownRoute: (routerSettings) {
        return MaterialPageRoute(
            builder: (context) => NotFound(
                  title: appName,
                ));
      },
    );
  }
}
