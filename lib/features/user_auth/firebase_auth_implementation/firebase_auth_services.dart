import 'package:firebase_auth/firebase_auth.dart'; // Importing the Firebase Authentication package
import 'package:flutter/material.dart'; // Importing the Flutter material package
import 'package:google_sign_in/google_sign_in.dart'; // Importing the Google Sign-In package
import 'package:cloud_firestore/cloud_firestore.dart'; // Importing the Cloud Firestore package
import 'package:firebase_storage/firebase_storage.dart'; // Importing the Firebase Storage package
import '/features/screens/cover_screen.dart'; // Importing the CoverScreen widget
import '/features/user_auth/login_screen.dart'; // Importing the LoginScreen widget

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance; // Initializing FirebaseAuth instance
  final GoogleSignIn _googleSignIn = GoogleSignIn(); // Initializing GoogleSignIn instance

  // Get the current user
  User? getCurrentUser() {
    return _auth.currentUser; // Returning the current user
  }

  // Sign up with email and password
  Future<User?> signUpWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password); // Creating a user with email and password
      return credential.user; // Returning the created user
    } on FirebaseAuthException catch (e) {
      print("Error: $e"); // Catching and printing any errors
    }
    return null; // Returning null if an error occurs
  }

  // Sign in with email and password
  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password); // Signing in a user with email and password
      return credential.user; // Returning the signed-in user
    } on FirebaseAuthException catch (e) {
      print("Error: $e"); // Catching and printing any errors
    }
    return null; // Returning null if an error occurs
  }

  // Sign in with Google
  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn(); // Initiating the Google sign-in flow
      final GoogleSignInAuthentication? googleSignInAuthentication =
          await googleSignInAccount?.authentication; // Getting Google sign-in authentication

      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication?.idToken, // Getting ID token
        accessToken: googleSignInAuthentication?.accessToken, // Getting access token
      );

      UserCredential result = await _auth.signInWithCredential(credential); // Signing in with Google credentials
      return result.user; // Returning the signed-in user
    } catch (e) {
      print(e.toString()); // Catching and printing any errors
    }
    return null; // Returning null if an error occurs
  }

  // Sign out method
  Future<void> signOut(BuildContext context) async {
    await _auth.signOut(); // Signing out from FirebaseAuth
    await _googleSignIn.signOut(); // Signing out from GoogleSignIn
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => CoverScreen(child: LoginScreen())), // Navigating to CoverScreen with LoginScreen
    );
  }

  // Create user profile
  Future<void> createUserProfile(
      String userId, Map<String, dynamic> userProfile) async {
    await FirebaseFirestore.instance
        .collection('User')
        .doc(userId)
        .set(userProfile); // Creating a new document in the User collection with user profile
  }

  // Update user profile
  Future<void> updateUserProfile(
      String userId, Map<String, dynamic> userProfile) async {
    await FirebaseFirestore.instance
        .collection('User')
        .doc(userId)
        .update(userProfile); // Updating the document in the User collection with user profile
  }

  // Delete user profile
  Future<void> deleteUserProfile(String userId) async {
    await FirebaseFirestore.instance
        .collection('User')
        .doc(userId)
        .delete(); // Deleting the document from the User collection
  }
}
