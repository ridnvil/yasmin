import 'package:flutter/material.dart';
import 'package:yasmin/ui_base/components/event_card.dart';

class profile extends StatefulWidget {
  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            new Image(
              image: new AssetImage("assets/bg3.jpg"),
              fit: BoxFit.cover,
              color: Colors.black54,
              colorBlendMode: BlendMode.darken,
            ),
            ListView(
              children: <Widget>[
                AppBar(
                  elevation: 0.0,
                  backgroundColor: Colors.transparent,
                  title: Text('PROFILE'),
                ),
                Container(
                  child: Column(
                    children: <Widget>[Text('Welcome to Profile Mode')],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
