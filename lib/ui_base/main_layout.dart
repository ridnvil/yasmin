import 'package:flutter/material.dart';
import 'package:yasmin/ui_base/components/event_card.dart';
import 'package:date_format/date_format.dart';

class MainLayout extends StatefulWidget {
  static final String tag = "/MAIN_LAYOUT";

  @override
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout>{
  final _date = formatDate(new DateTime.now(), [
    dd,
    ' ',
    MM,
    ' ',
    yyyy,
  ]);

  final List<String> titlearticle = ['one', 'two', 'three', 'four'];

  var refreshKey = GlobalKey<RefreshIndicatorState>();

  Future<Widget> refreshPage() async {
    refreshKey.currentState?.show();
    await Future.delayed(Duration(seconds: 2));
    print('Page Refresh');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: RefreshIndicator(
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
                        onPressed: () {},
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
                            backgroundImage: NetworkImage(
                                'https://cdn3.iconfinder.com/data/icons/business-and-finance-icons/512/Business_Man-512.png'),
                          ),
                          onPressed: (){
                            print('Icon Button');
                          },
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 18.0)),
                        Text('Hello, User',
                            style:
                                TextStyle(fontSize: 28.0, color: Colors.white)),
                        Text(
                          'Birtdate : dd-mm-yyyy',
                          style: TextStyle(fontSize: 15.0, color: Colors.white),
                        ),
                        Text(
                          'DNM : 280',
                          style: TextStyle(fontSize: 15.0, color: Colors.white),
                        ),
                        Text(
                          'RING : 2',
                          style: TextStyle(fontSize: 15.0, color: Colors.white),
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
                    height: 380.0,
                    child: ListView.builder(
                      padding: EdgeInsets.only(left: 16.0),
                      scrollDirection: Axis.horizontal,
                      itemCount: titlearticle.length,
                      itemBuilder: (context, index) {
                        return EventCard();
                      },
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(top: 10.0, left: 20.0, bottom: 20.0),
                      child: Text(
                        'Today ${_date}',
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ))
                ],
              ),
            ],
          ),
          onRefresh: refreshPage,
        ),
      ),
    );
  }
}

//class CardAnimation extends AnimatedWidget{
//  CardAnimation({Key key, Animation animation})
//    : super(key: key, listenable: animation);
//
//  @override
//  Widget build(BuildContext context) {
//    return Center(
//      child: Container(
//        height: animation.value,
//      ),
//    );
//  }
//}