import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:yasmin/menu/article.dart';
import 'package:yasmin/menu/chalange.dart';
import 'package:yasmin/menu/database.dart';
import 'package:yasmin/menu/profile.dart';
import 'package:yasmin/menu/scedule.dart';
import 'package:yasmin/menu/tablestanding.dart';
import 'package:yasmin/menu/tablestandingclub.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:yasmin/menu/timer_page.dart';
import 'package:yasmin/ui_base/components/login.dart';

class EventCard extends StatefulWidget {
  @override
  _EventCardState createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  var _date = formatDate(new DateTime.now(), [dd, '/', mm, '/', yyyy]);

  Firestore database = new Firestore();

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
      width: 250.0,
    );
  }
}

class reportCard extends StatefulWidget {
  @override
  _reportCardState createState() => _reportCardState();
}

class _reportCardState extends State<reportCard> {
  Future getArticles() async {
    var firestore = Firestore.instance;
    QuerySnapshot qs = await firestore.collection("articles").getDocuments();
    return qs.documents;
  }

  @override
  Widget build(BuildContext context) {
    //print(_play[1]);
    return Container(
      child: FutureBuilder(
        future: getArticles(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return new Material(
                child: new Text('Data not Found'),
              );
            case ConnectionState.waiting:
              return new Material(
                child: new Text('Loading...'),
              );
            default:
              if (snapshot.hasError) {
                return new Material();
              } else {
                return new ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, index) {
                    return new FlatButton(
                      padding: EdgeInsets.all(5.0),
                      child: Material(
                        elevation: 2.0,
                        borderRadius: BorderRadius.circular(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: ClipRRect(
                                borderRadius: new BorderRadius.only(
                                  topLeft: Radius.circular(8.0),
                                  topRight: Radius.circular(8.0),
                                ),
                                child: Image.network(
                                  snapshot.data[index].data["photoUrl"],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  left: 20.0, top: 20.0, bottom: 20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                      'Post Date : ${snapshot.data[index]
                                          .data["postdate"]}'),
                                  Padding(
                                      padding: EdgeInsets.only(bottom: 5.0)),
                                  Text(
                                    snapshot.data[index].data["title"],
                                    maxLines: 1,
                                    style: TextStyle(fontSize: 26.0),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(bottom: 5.0)),
                                  Container(
                                    width: 80.0,
                                    height: 5.0,
                                    child: Material(
                                      color: Colors.green,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => articleView()));
                      },
                    );
                  },
                );
              }
          }
        },
      ),
    );
  }
}

class drawerMenu extends StatefulWidget {
  @override
  _drawerMenuState createState() => _drawerMenuState();
}

class _drawerMenuState extends State<drawerMenu> {
  Future<UserInfo> getData() async {
    Authentiction auth = new Authentiction();
    FirebaseUser user = await auth.getCurrentUser();

    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end:
          Alignment(0.8, 1.2), // 10% of the width, so there are ten blinds.
          colors: [
            const Color(0xFF141E30),
            const Color(0xFF243B55),
          ], // whitish to gray
          tileMode: TileMode.mirror, // repeats the gradient over the canvas
        ),
      ),
      child: ListView(
        children: <Widget>[
          Divider(
            color: Colors.white,
          ),
          Container(
            padding: EdgeInsets.all(5.0),
            child: Column(
              children: <Widget>[
                Container(
                  child: new FutureBuilder<UserInfo>(
                    future: getData(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                          return new Row();
                        case ConnectionState.waiting:
                          return new Row();
                        default:
                          if (snapshot.hasError) {} else {
                            return GestureDetector(
                              child: Row(
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundImage:
                                    NetworkImage(snapshot.data.photoUrl),
                                    backgroundColor: Colors.white,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Text(snapshot.data.displayName,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15.0)),
                                  )
                                ],
                              ),
                              onTap: () {
                                Navigator.of(context).pop();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => profile()));
                              },
                            );
                          }
                      }
                    },
                  ),
                ),
                Divider(
                  color: Colors.white,
                ),
                Column(
                  children: <Widget>[
                    FlatButton(
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 40.0, top: 10.0, bottom: 10.0),
                            child: Icon(Icons.dashboard, color: Colors.white),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              'Home',
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    FlatButton(
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 40.0, top: 10.0, bottom: 10.0),
                            child: Icon(Icons.play_circle_outline,
                                color: Colors.white),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text('Chalenge',
                                style: TextStyle(color: Colors.white)),
                          )
                        ],
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => chalangeHome()));
                      },
                    ),
                    FlatButton(
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 40.0, top: 10.0, bottom: 10.0),
                            child: Icon(Icons.date_range, color: Colors.white),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text('Scedules',
                                style: TextStyle(color: Colors.white)),
                          )
                        ],
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => scedule()));
                      },
                    ),
                    Divider(
                      color: Colors.white,
                    ),
                    Column(
                      children: <Widget>[
                        GestureDetector(
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text('National Standing Table',
                                    style: TextStyle(color: Colors.white)),
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.of(context).pop();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => tableStanding()));
                          },
                        ),
                        Divider(
                          color: Colors.white,
                        ),
                        Container(
                          child: GestureDetector(
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, right: 10.0),
                                  child: Text('Player Name',
                                      style: TextStyle(color: Colors.white)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 150.0, right: 10.0),
                                  child: Text('Point',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ],
                            ),
                            onTap: () {
                              Navigator.of(context).pop();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          tableStandingClub()));
                            },
                          ),
                        ),
                        Divider(
                          color: Colors.white,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 5.0),
                          child: Column(
                            children: <Widget>[
                              listPlayer(),
                              listPlayer(),
                              listPlayer(),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class listPlayer extends StatefulWidget {
  @override
  _listPlayerState createState() => _listPlayerState();
}

class _listPlayerState extends State<listPlayer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 20.0, bottom: 5.0),
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 5.0),
                child: CircleAvatar(
                  maxRadius: 15.0,
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(
                      'https://cdn3.iconfinder.com/data/icons/business-and-finance-icons/512/Business_Man-512.png'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 15.0),
                child:
                Text('Atlet Name', style: TextStyle(color: Colors.white)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 100.0, right: 10.0),
                child: Text('0',
                    textAlign: TextAlign.right,
                    style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
