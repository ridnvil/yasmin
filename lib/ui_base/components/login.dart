import 'package:flutter/material.dart';
import '../main_layout.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;
  Animation<double> buttonAnimation;

  bool btnState = false;
  bool login = false;

  final textEmail = new TextEditingController();
  final textPass = new TextEditingController();

  @override
  void initState() {
    super.initState();
    controller =
        new AnimationController(duration: Duration(seconds: 2), vsync: this);
    animation =
        new CurvedAnimation(parent: controller, curve: Curves.bounceOut);
    animation.addListener(() {
      this.setState(() {});
    });
    animation.addStatusListener((AnimationStatus status) {
      print("TESTING $status");
      if (status == AnimationStatus.completed) {
        btnState = true;
      }
    });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      color: Colors.black26,
      height: 170.0,
      width: animation.value * 270.0,
      child: Column(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: textEmail,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(contentPadding: EdgeInsets.all(10.0),
                  hintText: 'Email',
                hintStyle: TextStyle(color: Colors.white30),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0)),
              ),
            ),
          ),
          Expanded(
            child: TextField(
              controller: textPass,
              obscureText: true,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  hintText: 'Passwords',
                  hintStyle: TextStyle(color: Colors.white30),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(width: 2.0,
                          style: BorderStyle.solid,
                          color: Colors.white))
              ),

            ),
          ),
          Container(
            height: 50.0,
            width: animation.value * 200.0,
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: btnState
                        ? FlatButton(
                            child: new Text(
                              'SIGNUP',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () {
                              print('Clicked');
                            },
                          )
                        : Container(),
                  ),
                  Expanded(
                    child: btnState
                        ? FlatButton(
                            child: new Text(
                              'SIGNIN',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () {
                              if (textEmail.text == 'admin' &&
                                  textPass.text == 'admin') {
                                Navigator.of(context).pushReplacementNamed(
                                    MainLayout.tag);
                              } else {
                                print('Login Filed!');
                              }
                              //Navigator.of(context).pushReplacementNamed(MainLayout.tag);
                            },
                          )
                        : Container(),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
