import 'package:flutter/material.dart';

class articleView extends StatefulWidget {
  @override
  _articleViewState createState() => _articleViewState();
}

class _articleViewState extends State<articleView> {
  String titleArticle = 'Flutter: Login App using REST API and SQFLite';
  String article =
      'Flutter has hit the mobile app development world like a storm. Being an Android app and web application developer, I wanted to try this new framework to see why there’s so much buzz about it. Previously, I was very much impressed by NativeScript and React. For some strange reason, I disliked JSX and hence never used React on any of my projects.Flutter is a cross-platform app development framework and it works on Android, iOS (and Fuschia?). The beta version of the framework was released just a few days back and Google claims to use it in production for some of its apps. One more interesting part here is that, Flutter is completely written in Dart. But worry not, Dart is very easy to learn if you’ve worked with Java and Javascript. It combines all the great features of Javascript and Java to offer an easy to use and robust modern language. But I’ll be honest, Kotlin is still my favorite modern language. All the B.S aside, let’s get into the actual demo of building an app with Flutter. The goal of this post is to show you how to build an app with a Login screen and a simple Home screen. I choose this topic since I couldn’t find any topics explaining how to implement a Login app with SQFLite and a REST backend. Of course you can use Firebase Authentication for this, but the point is to make it easy for you to understand the ceremony involved in setting up a REST and DB client in Flutter. main.dart will have the entry point for our app. Nothing new happening here, we just setup MaterialApp widget as root and specify to use the routes that we just defined.';
  String lastUpdate = 'Last Update : 10/11/2018';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Article'),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    new Image.asset('assets/bg.jpg'),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 15.0, left: 15.0, right: 15.0),
                          child: new Text(
                            titleArticle,
                            style: TextStyle(fontSize: 35.0),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: new Text(
                            lastUpdate,
                            style: TextStyle(fontSize: 13.0),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: new Text(
                        article,
                        style: TextStyle(fontSize: 18.0),
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
