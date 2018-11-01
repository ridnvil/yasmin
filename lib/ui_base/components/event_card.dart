import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:yasmin/menu/chalange.dart';
import 'package:yasmin/menu/profile.dart';
import 'dart:async';
import 'dart:math';

class EventCard extends StatefulWidget {
  @override
  _EventCardState createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  var _date = formatDate(new DateTime.now(), [dd, '/', mm, '/', yyyy]);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
      width: 350.0,
      child: FlatButton(
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
                    'http://a.espncdn.com/combiner/i?img=/photo/2015/0305/espnw_wang_d1_800x450.jpg&w=800',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 16.0, top: 16.0, bottom: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Post Date : ${_date}'),
                    Padding(padding: EdgeInsets.only(bottom: 5.0)),
                    Text(
                      'Article Title',
                      maxLines: 1,
                      style: TextStyle(fontSize: 26.0),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 5.0)),
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
          showDialog(context: context, child: dialogShow());
        },
      ),
    );
  }
}

class dialogShow extends StatefulWidget {
  @override
  _dialogShowState createState() => _dialogShowState();
}

class _dialogShowState extends State<dialogShow>
    with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    animation = Tween(begin: 200.0, end: 2000.0).animate(animationController)
      ..addListener(() {
        setState(() {});
      });
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: animation.value,
        width: animation.value,
        child: new AlertDialog(
          title: new Text('Title Article'),
          content: Container(
            height: animation.value,
            width: animation.value,
            child: ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    new Image.network(
                      'https://upload.wikimedia.org/wikipedia/commons/7/79/Competitive_table_tennis.jpg',
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: new Text(
                        'Suasana permainan tenis mejaTenis meja, atau ping pong (sebuah merek dagang), adalah suatu olahraga raket yang dimainkan oleh dua orang (untuk tunggal) atau dua pasangan (untuk ganda) yang berlawanan. Di Republik Rakyat Tiongkok, nama resmi olahraga ini ialah "bola ping pong" (Tionghoa : 乒乓球; Pinyin : pīngpāng qiú). Permainan ini menggunakan raket yang terbuat dari papan kayu yang dilapisi karet yang biasa disebut bet, sebuah bola pingpong dan lapangan permainan yang berbentuk meja. Induk Olahraga tenis meja di Indonesia adalah PTMSI (Persatuan Tenis Meja Seluruh Indonesia)[1] dan di dunia adalah ITTF (International Table Tennis Federation) yang anggotanya mencapai 217 negara dan PTMSI tercatat sebagai Anggota ITTF sejak tahun 1961.[2]',
                        style: TextStyle(fontSize: 15.0),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: new Text('Close'),
            ),
          ],
        ),
      ),
    );
  }
}

class reportCard extends StatefulWidget {
  @override
  _reportCardState createState() => _reportCardState();
}

class _reportCardState extends State<reportCard> {
  var play, win, lose;

  @override
  void initState() {
    super.initState();
    play = 3;
    win = 3;
    lose = 0;
  }

  @override
  Widget build(BuildContext context) {
    //print(_play[1]);
    return Container(
      color: Colors.transparent,
      //padding: EdgeInsets.all(10.0),
      width: 350.0,
      child: Material(
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                    child: Text('PLAY',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center)),
                Expanded(
                    child: Text('WIN',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center)),
                Expanded(
                    child: Text('LOSE',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center))
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 10.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: Text('${play}',
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center)),
                  Expanded(
                      child: Text('${win}',
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center)),
                  Expanded(
                      child: Text('${lose}',
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class drawerMenu extends StatefulWidget {
  @override
  _drawerMenuState createState() => _drawerMenuState();
}

class _drawerMenuState extends State<drawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end:
              Alignment(0.8, 1.2), // 10% of the width, so there are ten blinds.
          colors: [
            const Color(0xFF08AEEA),
            const Color(0xFFB2FEFA),
          ], // whitish to gray
          tileMode: TileMode.mirror, // repeats the gradient over the canvas
        ),
      ),
      child: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: Column(
              children: <Widget>[
                Divider(
                  color: Colors.white,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 0.0),
                  child: FlatButton(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://cdn3.iconfinder.com/data/icons/business-and-finance-icons/512/Business_Man-512.png'),
                          backgroundColor: Colors.white,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text('Profile Name',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15.0)),
                        )
                      ],
                    ),
                    onPressed: () {},
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
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => chalangeHome()));
                      },
                    ),
                    FlatButton(
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 40.0, top: 10.0, bottom: 10.0),
                            child: Icon(Icons.person, color: Colors.white),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text('Profile',
                                style: TextStyle(color: Colors.white)),
                          )
                        ],
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => profile()));
                      },
                    ),
                    Divider(
                      color: Colors.white,
                    ),
                    Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text('Table Standing',
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.white,
                        ),
                        Container(
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
