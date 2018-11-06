import 'package:flutter/material.dart';
import 'package:yasmin/menu/timer_page.dart';
import 'package:yasmin/ui_base/components/event_card.dart';

class tableStanding extends StatefulWidget {
  @override
  _tableStandingState createState() => _tableStandingState();
}

class _tableStandingState extends State<tableStanding> {
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
                  title: Text('TABLE'),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Column(
                    children: <Widget>[],
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
