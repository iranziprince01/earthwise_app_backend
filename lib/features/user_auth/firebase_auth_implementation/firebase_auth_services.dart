import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '/features/screens/cover_screen.dart';
import '/features/user_auth/login_screen.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Get the current user
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  // Sign up with email and password
  Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      print("Error: $e");
    }
    return null;
  }

  // Sign in with email and password
  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      print("Error: $e");
    }
    return null;
  }

  // Sign in with Google
  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleSignInAuthentication =
          await googleSignInAccount?.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication?.idToken,
        accessToken: googleSignInAuthentication?.accessToken,
      );

      UserCredential result = await _auth.signInWithCredential(credential);
      return result.user;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  // Sign out method
  Future<void> signOut(BuildContext context) async {
    await _auth.signOut();
    await _googleSignIn.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => CoverScreen(child: LoginScreen())),
    );
  }

  // Create user profile
  Future<void> createUserProfile(
      String userId, Map<String, dynamic> userProfile) async {
    await FirebaseFirestore.instance
        .collection('User')
        .doc(userId)
        .set(userProfile);
  }

  // Update user profile
  Future<void> updateUserProfile(
      String userId, Map<String, dynamic> userProfile) async {
    await FirebaseFirestore.instance
        .collection('User')
        .doc(userId)
        .update(userProfile);
  }

  // Delete user profile
  Future<void> deleteUserProfile(String userId) async {
    await FirebaseFirestore.instance.collection('User').doc(userId).delete();
  }
}
