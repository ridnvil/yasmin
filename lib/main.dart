import 'package:flutter/material.dart';
import 'package:yasmin/ui_base/login_layout.dart';
import 'package:yasmin/ui_base/main_layout.dart';

/**
 STANDARD GRADIENT THEME
 #83a4d4 -> #b6fbff
 */

void main() {
  runApp(MaterialApp(
    title: "PTMSI",
    debugShowCheckedModeBanner: false,
    home: MainLayout(),
    initialRoute: '/',
    routes: {
      MainLayout.tag: (ctx) => MainLayout(),
      LoginLayout.tag: (ctx) => LoginLayout(),
    },
  ));
}
