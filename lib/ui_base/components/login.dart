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

  String email = "";
  String pass = "";

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
        email = "admin";
        pass = "admin";

        if (email == "admin" && pass == "admin") {
          login = true;
        }
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
              decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: TextStyle(color: Colors.white30)),
            ),
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Passwords',
                  hintStyle: TextStyle(color: Colors.white30)),
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
                              Navigator.of(context)
                                  .pushReplacementNamed(MainLayout.tag);
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
