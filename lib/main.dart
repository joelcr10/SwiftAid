import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proapp/assistance.dart';
import 'package:proapp/reqlist.dart';
import 'package:proapp/styles.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (context, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: proapp(),
      );
    });
  }
}

class proapp extends StatefulWidget {
  @override
  State<proapp> createState() => _MyLoginState();
}

class _MyLoginState extends State<proapp> {
  TextEditingController usercontroller = TextEditingController();

  TextEditingController passcontroller = TextEditingController();

  var currentusername = "1234567890";

  var userpassword = "12345";

  final formKey = GlobalKey<FormState>();

// void dispose(){

//   usercontroller.dispose();
//   passcontroller.dispose();
//   super.dispose();
// }

  changePageOnLogin() => Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => reqlist()));
//changePage()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>FirstPage()));

  onLoginClick() {
    if (formKey.currentState!.validate()) {
      print("Right credentials eneterd");
      usercontroller.clear();
      passcontroller.clear();
      changePageOnLogin();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: SingleChildScrollView(
            child: Stack(children: [
              Container(
                  alignment: Alignment.topCenter,
                  height: 600.h,
                  width: 600.w,
                  child: Image.asset("images/p3.png")),
              loginContainer()
            ]),
          ),
        ),
      ),
    );
  }

  Widget loginContainer() {
    return Padding(
      padding: EdgeInsets.only(top: 300.h),
      child: Container(
        height: 376.h,
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(color: Color.fromARGB(255, 255, 255, 255)),
            color: Color.fromARGB(255, 32, 42, 68),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(175.r))),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 15.h, bottom: 8.h, left: 25),
                child: Text(
                  "Login",
                  textAlign: TextAlign.right,
                  style: GoogleFonts.roboto(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 2.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 10.w),
                              child: Icon(
                                Icons.phone,
                                color: Color.fromARGB(255, 210, 213, 221),
                              ),
                            ),
                            Container(
                                width: 160.w,
                                child: TextFormField(
                                  style: TextStyle(color: Colors.white),
                                  controller: usercontroller,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: "Phone Number",
                                  ),
                                  validator: (val) {
                                    var value = val!.trim();
                                    if (value.isEmpty) {
                                      return "enter your phone number";
                                    } else if (int.tryParse(value) == null) {
                                      return "Can only contain number";
                                    } else if (value.length != 10) {
                                      return "invalid phone number";
                                    } else if (value
                                            .compareTo(currentusername) !=
                                        0) {
                                      return "Invalid phone number";
                                    }
                                    return null;
                                  },
                                ))
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 10.w),
                            child: Icon(Icons.lock,
                                color: Color.fromARGB(255, 235, 236, 240)),
                          ),
                          Container(
                              width: 160.w,
                              child: TextFormField(
                                style: TextStyle(color: Colors.white),
                                controller: passcontroller,
                                obscureText: true,
                                decoration:
                                    InputDecoration(hintText: "Password"),
                                validator: (val) {
                                  var value = val!.trim();
                                  if (value.isEmpty) {
                                    return "Enter your password";
                                  } else if (value.compareTo(userpassword) !=
                                      0) {
                                    return "Invalid password";
                                  }
                                  return null;
                                },
                              ))
                        ],
                      ),
                    ],
                  )),
              Padding(
                padding: EdgeInsets.only(left: 120.w),
                child: TextButton(
                    onPressed: null,
                    child: Text(
                      "Forgot Password ?",
                      style:
                          TextStyle(color: Color.fromARGB(255, 236, 195, 145)),
                    )),
              ),
              SizedBox(
                  height: 40.h,
                  width: 200.w,
                  child: ElevatedButton(
                      onPressed: onLoginClick,
                      child: Text(
                        "Login",
                        style: buttonTextStyle,
                      ),
                      style: logbutton)),
              Padding(
                padding: EdgeInsets.only(top: 5.h, bottom: 5.h),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    height: 1.h,
                    width: 70.w,
                    color: Colors.black26,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.w, right: 10.w),
                    child: Text(
                      "OR",
                      style: TextStyle(
                          fontSize: 15.sp, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    height: 1.h,
                    width: 70.w,
                    color: Colors.black26,
                  ),
                ]),
              ),
              SizedBox(
                  height: 40.h,
                  width: 200.w,
                  child: ElevatedButton(
                    onPressed: null,
                    child: Text(
                      "Register",
                      style: buttonTextStyle,
                    ),
                    style: regbutton,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
