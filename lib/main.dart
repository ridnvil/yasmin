import 'package:flutter/material.dart';
import 'package:yasmin/ui_base/components/event_card.dart';
import 'package:yasmin/ui_base/login_layout.dart';
import 'package:yasmin/ui_base/main_layout.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './ui_base/components/login.dart';


/**
 STANDARD GRADIENT THEME
 #83a4d4 -> #b6fbff
 */

Future<void> main() async {
  Authentiction auth = new Authentiction();
  bool isSignedIn = await auth.isSignedIn();
  FirebaseUser user = await auth.getCurrentUser();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: isSignedIn ? MainLayout(user: user) : LoginLayout(),
    initialRoute: '/',
    routes: {
      MainLayout.tag: (ctx) => MainLayout(user: user),
      LoginLayout.tag: (ctx) => LoginLayout(),
    },
  ));
}
