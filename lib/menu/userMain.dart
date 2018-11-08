import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:yasmin/ui_base/components/event_card.dart';
import 'package:yasmin/ui_base/components/login.dart';

class usermain extends StatefulWidget {
  @override
  _usermainState createState() => _usermainState();
}

class _usermainState extends State<usermain> {
  Future<UserInfo> getUser() async {
    Authentiction auth = new Authentiction();
    FirebaseUser user = await auth.getCurrentUser();
    return user;
  }

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
                  title: Text('User Main'),
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: FutureBuilder<UserInfo>(
                    future: getUser(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                          return new Column();
                        case ConnectionState.waiting:
                          return new Column();
                        default:
                          if (snapshot.hasError) {
                          } else {
                            return new Column(
                              children: <Widget>[
                                new CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(snapshot.data.photoUrl),
                                  maxRadius: 50.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: new Text(snapshot.data.email,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15.0)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 15.0),
                                  child: new Text(snapshot.data.displayName,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 25.0)),
                                ),
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      new Text(
                                        'CAREER PLAYERS',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                                new Material(
                                  color: Colors.black45,
                                  child: new Column(
                                    children: <Widget>[
                                      new Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: new Text('PLAY',
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: new Text(': 100',
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                new Material(
                                  color: Colors.black26,
                                  child: new Column(
                                    children: <Widget>[
                                      new Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: new Text('WIN',
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: new Text(': 100',
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                new Material(
                                  color: Colors.black45,
                                  child: new Column(
                                    children: <Widget>[
                                      new Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: new Text('LOSE',
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: new Text(': 100',
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Padding(padding: EdgeInsets.all(5.0)),
                                ),
                                new Material(
                                  color: Colors.black26,
                                  child: new Column(
                                    children: <Widget>[
                                      new Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: new Text('Nasional RANK',
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: new Text(': 100',
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                new Material(
                                  color: Colors.black45,
                                  child: new Column(
                                    children: <Widget>[
                                      new Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: new Text('Club RANK',
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: new Text(': 100',
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Padding(padding: EdgeInsets.all(5.0)),
                                ),
                                new Material(
                                  color: Colors.black26,
                                  child: new Column(
                                    children: <Widget>[
                                      new Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: new Text('CLUB',
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: new Text(': PTM YASMIN499',
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                new Material(
                                  color: Colors.black45,
                                  child: new Column(
                                    children: <Widget>[
                                      new Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: new Text('CITY',
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: new Text(': BOGOR',
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                new Material(
                                  color: Colors.black26,
                                  child: new Column(
                                    children: <Widget>[
                                      new Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: new Text('CLASS',
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: new Text(': JUNIOR',
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Padding(padding: EdgeInsets.all(8.0)),
                                ),
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      new Text(
                                        'PERSONAL DETAIL',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                                new Material(
                                  color: Colors.black45,
                                  child: new Column(
                                    children: <Widget>[
                                      new Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: new Text('DNM',
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: new Text(': 280',
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                new Material(
                                  color: Colors.black26,
                                  child: new Column(
                                    children: <Widget>[
                                      new Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: new Text('CONDITION',
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: new Text(': ',
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          }
                      }
                    },
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
