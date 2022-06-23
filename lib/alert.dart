import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proapp/assistance.dart';
import 'package:proapp/main.dart';
import 'package:proapp/menu.dart';
import 'package:proapp/reqlist.dart';
import 'package:proapp/styles.dart';

class alert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(250, 149, 147, 147),
      child: AlertDialog(
          backgroundColor: Color.fromARGB(248, 32, 42, 68),
          title: Text(
            'Logout',
            style: buttonTextStyle,
          ),
          content: Text(
            'Are you sure ,do you want to log out?',
            style: buttonTextStyle,
          ),
          actions: <Widget>[
            TextButton(
                onPressed: () => Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => proapp())),
                child: Text(
                  "Ok",
                )),
            TextButton(
                onPressed: () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => reqlist())),
                child: Text("Cancel"))
          ]),
    );
  }
}
