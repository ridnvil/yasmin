import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yasmin/ui_base/components/event_card.dart';
import 'package:date_format/date_format.dart';
import 'package:yasmin/ui_base/components/login.dart';

class MainLayout extends StatefulWidget {
  final FirebaseUser user;
  static final String tag = "/MAIN_LAYOUT";

  const MainLayout({Key key, this.user}) : super(key: key);

  @override
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  final _date = formatDate(new DateTime.now(), [
    dd,
    ' ',
    MM,
    ' ',
    yyyy,
  ]);

  final List<String> titlearticle = ['one', 'two', 'three'];

  var refreshKey = GlobalKey<RefreshIndicatorState>();

  Future<Widget> refreshPage() async {
    refreshKey.currentState?.show();
    await Future.delayed(Duration(seconds: 2));
  }

  Future<UserInfo> getUser() async {
    Authentiction auth = new Authentiction();
    FirebaseUser user = await auth.getCurrentUser();
    return user;
  }

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
              const Color(0xFF141E30),
              const Color(0xFF243B55),
            ], // whitish to gray
            tileMode: TileMode.mirror, // repeats the gradient over the canvas
          ),
        ),
        child: Stack(fit: StackFit.expand, children: <Widget>[
          new Image(
            image: new AssetImage("assets/bg3.jpg"),
            fit: BoxFit.cover,
            color: Colors.black54,
            colorBlendMode: BlendMode.darken,
          ),
          RefreshIndicator(
            notificationPredicate: defaultScrollNotificationPredicate,
            child: ListView(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 80.0,
                      child: AppBar(
                        elevation: 0.0,
                        backgroundColor: Colors.transparent,
                        leading: IconButton(
                          icon: Icon(Icons.sort),
                          onPressed: () => _drawer.currentState.openDrawer(),
                        ),
                        title: Center(child: Text('PTMSI')),
                        actions: <Widget>[
                          IconButton(
                            icon: Icon(Icons.search),
                            onPressed: () {
                              print(formatDate(
                                  new DateTime.now(), [dd, '-', M, '-', yyyy]));
                            },
                          ),
                          Padding(padding: EdgeInsets.only(right: 4.0))
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 50.0, bottom: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          IconButton(
                            padding: EdgeInsets.all(0.0),
                            iconSize: 50.0,
                            icon: CircleAvatar(
                              backgroundColor: Colors.white,
                              backgroundImage:
                              NetworkImage(widget.user.photoUrl),
                            ),
                            onPressed: () {
                              print('Icon Button');
                            },
                          ),
                          Padding(padding: EdgeInsets.only(bottom: 18.0)),
                          Text('Hello, ${widget.user.displayName}',
                              style: TextStyle(
                                  fontSize: 28.0, color: Colors.white)),
                          Text(
                            'Birtdate : dd-mm-yyyy',
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.white),
                          ),
                          Text(
                            'DNM : 280',
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.white),
                          ),
                          Text(
                            'RING : 2',
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.white),
                          ),
                          Container(
                              padding: EdgeInsets.only(top: 10.0),
                              child: Text(
                                '',
                                style: TextStyle(
                                    fontSize: 15.0, color: Colors.white),
                              )),
                          reportCard()
                        ],
                      ),
                    ),
                    Container(
                      height: 300.0,
                      child: ListView.builder(
                        padding: EdgeInsets.only(left: 16.0),
                        scrollDirection: Axis.horizontal,
                        itemCount: titlearticle.length,
                        itemBuilder: (context, index) {
                          return EventCard();
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
            onRefresh: refreshPage,
          ),
        ]),
      ),
    );
  }
}
