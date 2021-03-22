import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Menu extends StatefulWidget {
  final String title;

  const Menu({Key? key, required this.title}) : super(key: key);

  @override
  _MenuState createState() => _MenuState(title);
}

class _MenuState extends State<Menu> {
  final String title;

  _MenuState(this.title);

  @override
  Widget build(BuildContext context) {
    String currentRoute = ModalRoute.of(context)!.settings.name!;
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Text(title),
            decoration: BoxDecoration(color: Colors.blue),
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(Icons.home),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text('Home', style: TextStyle(color: (currentRoute == '/home' ? Colors.blue : Colors.black))),
                )
              ],
            ),
            onTap: () {
              Navigator.of(context).popAndPushNamed('/home');
            },
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(Icons.people),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text('Profile', style: TextStyle(color: (currentRoute == '/profile' ? Colors.blue : Colors.black))),
                )
              ],
            ),
            onTap: () {
              Navigator.of(context).popAndPushNamed('/profile');
            },
          ),
          Divider(),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(Icons.logout),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text('Logout', style: TextStyle(color: Colors.black)),
                )
              ],
            ),
            onTap: () {
              Navigator.of(context).popAndPushNamed('/logout');
            },
          ),
        ],
      ),
    );
  }
}
