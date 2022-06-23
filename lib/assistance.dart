import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proapp/menu.dart';
import 'package:proapp/reqlist.dart';
import 'package:proapp/styles.dart';

class Assistance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //return MaterialApp(debugShowCheckedModeBanner: false);

    return SafeArea(
      child: Scaffold(
        //drawer: Menubar(),
        appBar: AppBar(
            backgroundColor: Color.fromARGB(248, 32, 42, 68),
            leading: TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => reqlist()));
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ))),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Assistance",
                style: GoogleFonts.alegreya(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(248, 32, 42, 68)),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w, bottom: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "New Requests ",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.balthazar(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                height: 150.h,
                width: 300.w,
                child: Column(
                  children: [
                    Row(children: [
                      Container(
                          height: 50.h,
                          width: 200.w,
                          color: Color.fromARGB(255, 173, 173, 173),
                          child: Padding(
                            padding: EdgeInsets.only(top: 14.h),
                            child: Text("Assistance Requested",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.aBeeZee(
                                    fontSize: 15, fontWeight: FontWeight.bold)),
                          )),
                      Container(
                          height: 50.h,
                          width: 100.w,
                          color: Color.fromARGB(247, 180, 183, 182),
                          child: Padding(
                            padding: EdgeInsets.only(top: 14.h),
                            child:
                                Text("100 m away", textAlign: TextAlign.center),
                          ))
                    ]),
                    Container(
                        height: 100.h,
                        alignment: Alignment.center,
                        color: Color.fromARGB(255, 210, 208, 208),
                        child: Text("(Location)", textAlign: TextAlign.center))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Container(
                    height: 50.h,
                    width: 500.w,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 10.w),
                            child: Container(
                                height: 50.h,
                                width: 150.w,
                                child: ElevatedButton(
                                  onPressed: null,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(right: 15.w),
                                        child: Icon(
                                          Icons.thumb_up,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        "Accept",
                                        style: buttonTextStyle,
                                      )
                                    ],
                                  ),
                                  style: accept,
                                )),
                          ),
                          Container(
                              height: 50.h,
                              width: 150.w,
                              child: ElevatedButton(
                                onPressed: null,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(right: 15.w),
                                      child: Icon(
                                        Icons.thumb_down,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      "Decline",
                                      style: buttonTextStyle,
                                    )
                                  ],
                                ),
                                style: decline,
                              )),
                        ])),
              ),
              Padding(
                padding: EdgeInsets.only(top: 1.h),
                child: Image.asset(
                  "images/p1.jpg",
                  color: const Color.fromRGBO(255, 255, 255, 0.5),
                  colorBlendMode: BlendMode.modulate,
                  height: 255.h,
                  width: 400.w,
                  alignment: Alignment.bottomCenter,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
