import 'package:flutter/material.dart';

class LoginLayout extends StatefulWidget {
  static final String tag = "/LOGIN_LAYOUT";

  @override
  _LoginLayoutState createState() => _LoginLayoutState();
}

class _LoginLayoutState extends State<LoginLayout> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
            image: new AssetImage("assets/bg.jpg"),
            fit: BoxFit.cover,
            color: Colors.black54,
            colorBlendMode: BlendMode.darken,
          ),
          new Column(
            children: <Widget>[
            ],
          ),
        ],
      ),
    );
  }
}
