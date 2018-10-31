import 'package:flutter/material.dart';

class chalangeHome extends StatefulWidget {
  @override
  _chalangeHomeState createState() => _chalangeHomeState();
}

class _chalangeHomeState extends State<chalangeHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: <Widget>[
            AppBar(
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                icon: Icon(Icons.sort),
                onPressed: () => Navigator.pop(context),
              ),
              title: Center(child: Text('CHALANGE')),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {

                  },
                ),
                Padding(padding: EdgeInsets.only(right: 4.0))
              ],
            ),
            Container(
              child: new Text('Welcome'),
            ),
          ],
        ),
      ),
    );
  }
}
