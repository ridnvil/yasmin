import 'package:flutter/material.dart';
import 'package:yasmin/ui_base/components/event_card.dart';
import '../main_layout.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0.0),
      color: Colors.black26,
      height: 60.0,
      width: 300.0,
      child: Column(
        children: <Widget>[
          FlatButton(
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      top: 8.0, bottom: 8.0, left: 0.0, right: 73.0),
                  child: new Image.asset('assets/Google-G.png'),
                ),
                new Text(
                  'GOOGLE',
                  style: TextStyle(color: Colors.black54, fontSize: 12.0),
                ),
              ],
            ),
            onPressed: () {
              Authentiction auth = new Authentiction();
              auth.signIn().then((FirebaseUser user) =>
                  Navigator.of(context).pushReplacementNamed(MainLayout.tag));
            },
          ),
          FlatButton(
            color: Colors.blue,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      top: 8.0, bottom: 8.0, left: 0.0, right: 73.0),
                  child: new Image.asset('assets/fb.png'),
                ),
                new Text(
                  'FACEBOOK',
                  style: TextStyle(color: Colors.white, fontSize: 12.0),
                ),
              ],
            ),
            onPressed: () {
              Authentiction auth = new Authentiction();
              auth.signIn().then((FirebaseUser user) =>
                  Navigator.of(context).pushReplacementNamed(MainLayout.tag));
            },
          ),
        ],
      ),
    );
  }
}

class Authentiction {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = new GoogleSignIn();

  Future<FirebaseUser> signIn() async {
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication gSA = await googleSignInAccount.authentication;

    FirebaseUser user = await _auth.signInWithGoogle(
        idToken: gSA.idToken, accessToken: gSA.accessToken);

    print("User Name : ${user.displayName}");
    return user;
  }

  Future<bool> isSignedIn() async {
    return await googleSignIn.isSignedIn();
  }

  Future<FirebaseUser> getCurrentUser() async {
    return await _auth.currentUser();
  }
}
