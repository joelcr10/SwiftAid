import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:proapp/reqlist.dart';
import 'package:proapp/styles.dart';
import 'package:geolocator/geolocator.dart';

class Assistance extends StatefulWidget {
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(9.528546, 76.822137),
    zoom: 15,
  );

  @override
  State<Assistance> createState() => _AssistanceState();
}

class _AssistanceState extends State<Assistance> {
  Completer<GoogleMapController> _controller = Completer();

  late GoogleMapController newmap;

  late Position currentposition;
  var geolocator = Geolocator();

  void locateposition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentposition = position;

    LatLng latLngposition = LatLng(position.latitude, position.longitude);

    CameraPosition cameraPosition =
        new CameraPosition(target: latLngposition, zoom: 5);

    newmap.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Color.fromARGB(248, 32, 42, 68),
            leading: TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => reqlist()));
                },
                child: Icon(Icons.arrow_back, color: Colors.white))),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Assistance",
                style: GoogleFonts.alegreya(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(248, 32, 42, 68)),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 1, bottom: 1),
                child: Container(
                  height: 450.h,
                  width: 345.w,
                  child: Column(
                    children: [
                      Row(children: [
                        Container(
                            height: 50.h,
                            width: 245.w,
                            color: Color.fromARGB(255, 173, 173, 173),
                            child: Padding(
                              padding: EdgeInsets.only(top: 14.h),
                              child: Text("Assistance Requested",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.aBeeZee(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                            )),
                        Container(
                            height: 50.h,
                            width: 100.w,
                            color: Color.fromARGB(247, 180, 183, 182),
                            child: Padding(
                              padding: EdgeInsets.only(top: 14.h),
                              child: Text("100 m away",
                                  textAlign: TextAlign.center),
                            ))
                      ]),
                      Container(
                          height: 400.h,
                          alignment: Alignment.center,
                          color: Color.fromARGB(255, 210, 208, 208),
                          child: Stack(children: [
                            GoogleMap(
                                mapType: MapType.normal,
                                myLocationEnabled: true,
                                myLocationButtonEnabled: true,
                                zoomControlsEnabled: true,
                                zoomGesturesEnabled: true,
                                scrollGesturesEnabled: true,
                                initialCameraPosition: Assistance._kGooglePlex,
                                onMapCreated: (GoogleMapController controller) {
                                  _controller.complete(controller);
                                  newmap = controller;

                                  locateposition();
                                }),
                          ]))
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Container(
                    height: 45.h,
                    width: 500.w,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 10.w),
                            child: Container(
                                height: 45.h,
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
                              height: 45.h,
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
                  padding: EdgeInsets.only(top: 15.h),
                  child: Container(
                    height: 25,
                    child: Text(
                      "Amal jyothi college of engineering ,kuvappalli",
                      style: GoogleFonts.tajawal(fontWeight: FontWeight.bold),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
