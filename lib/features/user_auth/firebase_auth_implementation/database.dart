import 'package:cloud_firestore/cloud_firestore.dart'; // Importing the Cloud Firestore package

class DatabaseMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance; // Initializing Firestore instance

  // Add a new user to Firestore
  Future<void> addUser(String userId, Map<String, dynamic> userInfoMap) async {
    try {
      await _firestore.collection("User").doc(userId).set(userInfoMap); // Adding a new document with userId in the User collection
    } catch (e) {
      print("Error adding user: $e"); // Catching and printing any errors
    }
  }

  // Update user information in Firestore
  Future<void> updateUser(String userId, Map<String, dynamic> updatedInfo) async {
    try {
      await _firestore.collection("User").doc(userId).update(updatedInfo); // Updating the document with userId in the User collection
    } catch (e) {
      print("Error updating user: $e"); // Catching and printing any errors
    }
  }

  // Delete user from Firestore
  Future<void> deleteUser(String userId) async {
    try {
      await _firestore.collection("User").doc(userId).delete(); // Deleting the document with userId in the User collection
    } catch (e) {
      print("Error deleting user: $e"); // Catching and printing any errors
    }
  }

  // Get user information from Firestore
  Future<DocumentSnapshot<Map<String, dynamic>>> getUser(String userId) async {
    try {
      return await _firestore.collection("User").doc(userId).get(); // Getting the document with userId from the User collection
    } catch (e) {
      print("Error getting user: $e"); // Catching and printing any errors
      rethrow; // Rethrowing the error to be handled by the caller
    }
  }
}
