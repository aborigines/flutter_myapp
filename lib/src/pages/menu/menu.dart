import 'package:flutter/material.dart';
import 'package:flutter_myapp/src/service/login_service.dart';

class Menu {
  Drawer leftMenu(
      BuildContext context, LoginService loginService, String title) {
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
              Navigator.pop(context, (route) => false);
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/home', (route) => false);
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
              Navigator.pop(context, (route) => false);
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/profile', (route) => false);
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
              Navigator.pop(context, (route) => false);
              loginService.logout().then((value) => {
                Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false)
              });
            },
          ),
        ],
      ),
    );
  }
}
