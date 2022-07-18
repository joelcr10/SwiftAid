import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

  static Future emailSignUp(String email, String password, String name,
      String specialization, String id, String dob) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        try {
          await FirebaseAuth.instance.currentUser!.updateDisplayName(name);
          await FirebaseFirestore.instance
              .collection("Doctors")
              .doc(value.user!.email)
              .set({
            'email': Authmethods.auth.currentUser!.email,
            'name': Authmethods.auth.currentUser!.displayName,
            'specilization': specialization,
            'dob': dob,
            'id': id
          });
        } on FirebaseException catch (e) {
          return "An error occured";
        }
      });
    } on FirebaseException catch (e) {
      return "An error occured";
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
