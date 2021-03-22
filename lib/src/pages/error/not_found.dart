import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotFound extends StatelessWidget {
  final String title;

  const NotFound({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context)
                .popAndPushNamed('/login');
          },
        ),
      ),
      body: Center(child: Text('Not Found')),
    );
  }
}
