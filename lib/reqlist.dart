import 'package:flutter/material.dart';
import 'package:proapp/assistance.dart';
import 'package:proapp/menu.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class reqlist extends StatefulWidget {
  @override
  State<reqlist> createState() => _reqlistState();
}

class _reqlistState extends State<reqlist> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(backgroundColor: Color.fromARGB(248, 32, 42, 68)),
        drawer: Menubar(),
        body: SingleChildScrollView(
          child: Stack(children: [
            Padding(
              padding: const EdgeInsets.only(top: 120),
              child: Image.asset(
                "images/p1.jpg",
                color: Color.fromARGB(121, 255, 255, 255),
                colorBlendMode: BlendMode.modulate,
                height: 500.h,
                width: 500.w,
                alignment: Alignment.bottomCenter,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
              child: Column(
                children: [
                  Text(
                    "New Requests ",
                    style: GoogleFonts.alegreya(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(248, 32, 42, 68)),
                  ),
                  Card(
                    color: Color.fromARGB(31, 83, 82, 82),
                    child: ListTile(
                      title: Text(
                        "Assistence required :100 m away",
                        style: GoogleFonts.adamina(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      trailing: Text("7:02 pm"),
                      onTap: () => {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Assistance()))
                      },
                    ),
                  ),
                  Card(
                    color: Color.fromARGB(31, 83, 82, 82),
                    child: ListTile(
                      title: Text(
                        "Assistence required :300 m away",
                        style: GoogleFonts.adamina(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      trailing: Text("5:30 pm"),
                      onTap: () => {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Assistance()))
                      },
                    ),
                  ),
                  Card(
                    color: Color.fromARGB(31, 83, 82, 82),
                    child: ListTile(
                      title: Text(
                        "Assistence required : 1 km away",
                        style: GoogleFonts.adamina(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      trailing: Text("yesterday"),
                      onTap: () => {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Assistance()))
                      },
                    ),
                  ),
                  Card(
                    color: Color.fromARGB(31, 83, 82, 82),
                    child: ListTile(
                      title: Text(
                        "Assistence required : 150 m away",
                        style: GoogleFonts.adamina(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      trailing: Text("10-06-22"),
                      onTap: () => {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Assistance()))
                      },
                    ),
                  ),
                  Card(
                    color: Color.fromARGB(31, 83, 82, 82),
                    child: ListTile(
                      title: Text(
                        "Assistence required : 320 m away",
                        style: GoogleFonts.adamina(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      trailing: Text("8-06-22"),
                      onTap: () => {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Assistance()))
                      },
                    ),
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
