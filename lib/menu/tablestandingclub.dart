import 'package:flutter/material.dart';
import 'package:yasmin/menu/timer_page.dart';
import 'package:yasmin/ui_base/components/event_card.dart';

class tableStandingClub extends StatefulWidget {
  @override
  _tableStandingClubState createState() => _tableStandingClubState();
}

class _tableStandingClubState extends State<tableStandingClub> {
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
                  title: Text('TABLE CLUB'),
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
