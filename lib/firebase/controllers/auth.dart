import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  static Future login({required String email, required String password}) async {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }

  static Future signup({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((_) {});
  }
}
