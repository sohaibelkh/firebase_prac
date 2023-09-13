import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_prac/sign_up/data/models/exceptions.dart';
import 'package:flutter/foundation.dart';

abstract class SignUpSource {
  Future<String?> userSignUp({required String email, required String password});
}

class SignUpSourceImpl implements SignUpSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<String?> userSignUp(
      {required String email, required String password}) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user?.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw const SignUpException(
          "Password is too weak. Please choose a stronger password.",
        );
      } else if (e.code == 'email-already-in-use') {
        throw const SignUpException(
          "Email address is already in use. Please use a different email.",
        );
      } else {
        throw SignUpException("Sign-up failed: ${e.message}");
      }
    } catch (e) {
      debugPrint('Sign-up failed: $e');
      return null;
    }
  }
}
