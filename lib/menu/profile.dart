import 'package:flutter/material.dart';
import 'package:yasmin/ui_base/components/event_card.dart';

class profile extends StatefulWidget {
  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {
  GlobalKey<ScaffoldState> _drawer = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawer,
      drawer: Opacity(
        opacity: 0.8,
        child: Drawer(
          elevation: 10.0,
          child: drawerMenu(),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment(
                0.8, 1.2), // 10% of the width, so there are ten blinds.
            colors: [
              const Color(0xFF08AEEA),
              const Color(0xFF2AF598),
            ], // whitish to gray
            tileMode: TileMode.mirror, // repeats the gradient over the canvas
          ),
        ),
        child: ListView(
          children: <Widget>[
            AppBar(
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                icon: Icon(Icons.sort),
                onPressed: () => _drawer.currentState.openDrawer(),
              ),
              title: Center(child: Text('CHALANGE')),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Padding(padding: EdgeInsets.only(right: 4.0))
              ],
            ),
            Container(
              child: Column(
                children: <Widget>[Text('Welcome to Chalange Mode')],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
