import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Add a new user to Firestore
  Future<void> addUser(String userId, Map<String, dynamic> userInfoMap) async {
    try {
      await _firestore.collection("User").doc(userId).set(userInfoMap);
    } catch (e) {
      print("Error adding user: $e");
    }
  }

  // Update user information in Firestore
  Future<void> updateUser(
      String userId, Map<String, dynamic> updatedInfo) async {
    try {
      await _firestore.collection("User").doc(userId).update(updatedInfo);
    } catch (e) {
      print("Error updating user: $e");
    }
  }

  // Delete user from Firestore
  Future<void> deleteUser(String userId) async {
    try {
      await _firestore.collection("User").doc(userId).delete();
    } catch (e) {
      print("Error deleting user: $e");
    }
  }

  // Get user information from Firestore
  Future<DocumentSnapshot<Map<String, dynamic>>> getUser(String userId) async {
    try {
      return await _firestore.collection("User").doc(userId).get();
    } catch (e) {
      print("Error getting user: $e");
      rethrow;
    }
  }
}
