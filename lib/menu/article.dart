import 'package:flutter/material.dart';

class articleView extends StatefulWidget {
  final String title;
  final String photoUrl;
  final String content;
  final String postdate;

  const articleView(
      {Key key, this.title, this.photoUrl, this.content, this.postdate})
      :super(key: key);

  @override
  _articleViewState createState() => _articleViewState();
}

class _articleViewState extends State<articleView> {
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
                    new Image.network(widget.photoUrl),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 15.0, left: 15.0, right: 15.0),
                          child: new Text(
                            widget.title,
                            style: TextStyle(fontSize: 35.0),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: new Text(
                            'Last Update : ${widget.postdate}',
                            style: TextStyle(fontSize: 13.0),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: new Text(
                        widget.content,
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
