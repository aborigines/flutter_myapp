import 'package:flutter/material.dart';
import 'package:flutter_myapp/src/service/login_service.dart';

class Menu {
  Drawer leftMenu(BuildContext context, LoginService loginService, String title) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Text(title),
            decoration: BoxDecoration(color: Colors.blue),
          ),
          ListTile(
            title: Text.rich(TextSpan(children: <InlineSpan>[
              WidgetSpan(
                child: Icon(Icons.home),
              ),
              TextSpan(text: "    "),
              TextSpan(text: 'Home'),
            ])),
            onTap: () {
              Navigator.of(context).popAndPushNamed('/home');
            },
          ),
          ListTile(
            title: Text.rich(TextSpan(children: <InlineSpan>[
              WidgetSpan(
                child: Icon(Icons.people),
              ),
              TextSpan(text: "    "),
              TextSpan(text: 'Profile'),
            ])),
            onTap: () {
              Navigator.of(context).popAndPushNamed('/profile');
            },
          ),
          ListTile(
            title: Text.rich(TextSpan(children: <InlineSpan>[
              WidgetSpan(
                child: Icon(Icons.logout),
              ),
              TextSpan(text: "    "),
              TextSpan(text: 'Logout'),
            ])),
            onTap: () {
              Navigator.popAndPushNamed(context, '/logout');
            },
          ),
        ],
      ),
    );
  }
}
