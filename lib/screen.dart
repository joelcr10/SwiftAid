import 'package:flutter/material.dart';
import 'package:proapp/auth.dart';
import 'package:proapp/logpage.dart';
import 'package:proapp/reqlist.dart';

class screen extends StatefulWidget {
  @override
  State<screen> createState() => _screenState();
}

class _screenState extends State<screen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Authmethods.authStateChanges,
        builder: (context, snapshot) {
          print("snap data : ${snapshot.data}");

          return snapshot.connectionState == ConnectionState.active &&
                  snapshot.hasData
              ? reqlist()
              : log();
        });
  }
}
