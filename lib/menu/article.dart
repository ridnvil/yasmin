import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yasmin/ui_base/components/login.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:http/http.dart' as http;

class ArticleView extends StatefulWidget {
  final String title;
  final String photoUrl;
  final String content;
  final String postdate;

  const ArticleView(
      {Key key, this.title, this.photoUrl, this.content, this.postdate})
      : super(key: key);

  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
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

class AddArticle extends StatefulWidget {

  @override
  _AddArticleState createState() => _AddArticleState();
}

class _AddArticleState extends State<AddArticle> {
  File _image;
  var _title;
  var _articles;

  final TextEditingController titleController = new TextEditingController();
  final TextEditingController articleController = new TextEditingController();
  final FirebaseStorage storage = FirebaseStorage(storageBucket: 'gs://yasmin-967d6.appspot.com');

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  Future getData(String title, String article) async {
    setState(() {
      this._title = title;
      this._articles = article;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('Post Article / Event'),
        actions: <Widget>[
          IconButton(
            icon: new Icon(Icons.add_a_photo),
            onPressed: () async{
              getImage();
            },
          )
        ],
        backgroundColor: Colors.blue,
      ),
      body: new Center(
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Material(
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        _image == null
                            ? new Text('No image selected')
                            : new Image.file(_image),
                        Container(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            children: <Widget>[
                              new TextField(
                                controller: titleController,
                                decoration: new InputDecoration(
                                    hintText: 'Judul Article / Event',
                                    border: new OutlineInputBorder(
                                        borderSide: new BorderSide(
                                            color: Colors.teal))),
                              ),
                              new Container(
                                padding: EdgeInsets.only(top: 10.0),
                              ),
                              new TextField(
                                controller: articleController,
                                maxLines: null,
                                keyboardType: TextInputType.multiline,
                                decoration: InputDecoration(
                                    hintText: 'Article / Event',
                                    border: new OutlineInputBorder(
                                        borderSide: new BorderSide(
                                            color: Colors.teal))),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                new FlatButton(
                  color: Colors.blue,
                  child: new Text('Post Article / Event',
                      style: TextStyle(color: Colors.white)),
                  onPressed: () async {
                    Authentiction auth = new Authentiction();
                    FirebaseUser user = await auth.getCurrentUser();
                    var postdate = new Timestamp.now();

                    print(this.titleController.text);
                    print(this._image);
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
