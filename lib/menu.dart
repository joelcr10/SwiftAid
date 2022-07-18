import 'package:flutter/material.dart';
import 'package:proapp/auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Menubar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text('Doctor Name'),
          accountEmail: Text('doctor@gmail.com'),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.white,
            child: ClipOval(
              child: Image.asset(
                'images/profile.png',
                fit: BoxFit.cover,
                width: 90.w,
                height: 90.h,
              ),
            ),
          ),
          decoration: BoxDecoration(
            color: Color.fromARGB(248, 32, 42, 68),
          ),
        ),
        ListTile(
          leading: Icon(Icons.person, color: Color.fromARGB(255, 6, 43, 74)),
          title: Text('Profile'),
          onTap: () => {Navigator.of(context).pop()},
        ),
        ListTile(
          leading: Icon(Icons.settings, color: Color.fromARGB(255, 6, 43, 74)),
          title: Text('Settings'),
          onTap: () => {Navigator.of(context).pop()},
        ),
        ListTile(
          leading: Icon(Icons.feedback, color: Color.fromARGB(255, 6, 43, 74)),
          title: Text('Feedback'),
          onTap: () => {Navigator.of(context).pop()},
        ),
        ListTile(
          leading: Icon(Icons.people, color: Color.fromARGB(255, 6, 43, 74)),
          title: Text('About us'),
          onTap: () => {Navigator.of(context).pop()},
        ),
        ListTile(
          leading: Icon(Icons.logout, color: Color.fromARGB(255, 6, 43, 74)),
          title: Text('Logout'),
          onTap: () => {
            alert("Log out?", context),
          },
        ),
      ],
    ));
  }

  void alert(String text, BuildContext ctx) {
    showDialog(
        context: ctx,
        builder: (ctx) {
          return AlertDialog(
            title: Text(text),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  child: const Text("No")),
              TextButton(
                  onPressed: () {
                    // function();
                    Authmethods.signOut();
                    Navigator.of(ctx).pop();
                  },
                  child: const Text("Yes")),
            ],
          );
        });
  }
}
