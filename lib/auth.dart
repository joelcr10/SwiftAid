import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Authmethods {
  static FirebaseAuth auth = FirebaseAuth.instance;

  static Future checkmail(String email) async {
    try {
      List response = await auth.fetchSignInMethodsForEmail(email);
      if (response.isEmpty) {
        print(response);
        return "error";
      } else {
        print(response) {
          return "ok";
        }
      }
    } on FirebaseAuthException catch (e) {
      return "error";
    }
  }

  static Future emailSignUp(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "OK";
    } on FirebaseException catch (e) {
      return "Error";
    }
  }

  static Future emailSignIn(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return "ok";
    } on FirebaseAuthException catch (e) {
      return "error";
    }
  }

  @override
  static Stream<String> get authStateChanges =>
      auth.authStateChanges().map((user) => user!.uid);

  static Future signOut() async {
    FirebaseAuth.instance.signOut();
    await auth.signOut();
  }
}
