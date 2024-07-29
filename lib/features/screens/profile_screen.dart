import 'dart:io'; // Import for File class from dart:io package
import 'package:cloud_firestore/cloud_firestore.dart'; // Import for Cloud Firestore
import 'package:firebase_auth/firebase_auth.dart'; // Import for Firebase Authentication
import 'package:firebase_storage/firebase_storage.dart'; // Import for Firebase Storage
import 'package:flutter/material.dart'; // Import for Flutter Material package
import 'package:image_picker/image_picker.dart'; // Import for image picker package
import '/features/screens/settings_screen.dart'; // Import SettingsScreen
import '/features/user_auth/firebase_auth_implementation/firebase_auth_services.dart'; // Import FirebaseAuthService
import '/features/screens/cover_screen.dart'; // Import CoverScreen
import '/features/user_auth/firebase_auth_implementation/database.dart'; // Import DatabaseMethods

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key}); // Constructor for ProfileScreen with key

  @override
  State<ProfileScreen> createState() =>
      _ProfileScreenState(); // Create state for ProfileScreen
}

class _ProfileScreenState extends State<ProfileScreen> {
  final FirebaseAuthService _authService =
      FirebaseAuthService(); // Instance of FirebaseAuthService
  final DatabaseMethods _databaseMethods =
      DatabaseMethods(); // Instance of DatabaseMethods
  final ImagePicker _picker = ImagePicker(); // Instance of ImagePicker

  final TextEditingController _fullNameController =
      TextEditingController(); // Controller for full name input
  final TextEditingController _cityController =
      TextEditingController(); // Controller for city input
  final TextEditingController _countryController =
      TextEditingController(); // Controller for country input
  final TextEditingController _interestController =
      TextEditingController(); // Controller for interest input

  String _profileImageUrl = ''; // URL of the profile image

  @override
  void initState() {
    super.initState();
    _loadUserData(); // Load user data when the widget is initialized
  }

  @override
  void dispose() {
    _fullNameController.dispose(); // Dispose full name controller
    _cityController.dispose(); // Dispose city controller
    _countryController.dispose(); // Dispose country controller
    _interestController.dispose(); // Dispose interest controller
    super.dispose(); // Call dispose on the superclass
  }

  Future<void> _loadUserData() async {
    User? user = FirebaseAuth.instance.currentUser; // Get current user
    if (user != null) {
      DocumentSnapshot<Map<String, dynamic>> userDoc = await _databaseMethods
          .getUser(user.uid); // Get user data from Firestore

      if (userDoc.exists) {
        var data = userDoc.data()!;
        setState(() {
          _fullNameController.text =
              data['fullName'] ?? 'Manzi'; // Set full name
          _cityController.text = data['city'] ?? 'Kigali'; // Set city
          _countryController.text = data['country'] ?? 'Rwanda'; // Set country
          _interestController.text =
              data['interest'] ?? 'Education'; // Set interest
          _profileImageUrl =
              data['profileImage'] ?? ''; // Set profile image URL
        });
      } else {
        // Set default values if no data exists
        setState(() {
          _fullNameController.text = 'Manzi'; // Default full name
          _cityController.text = 'Kigali'; // Default city
          _countryController.text = 'Rwanda'; // Default country
          _interestController.text = 'Education'; // Default interest
        });
      }
    }
  }

  Future<void> _updateProfile() async {
    User? user = FirebaseAuth.instance.currentUser; // Get current user
    if (user != null) {
      Map<String, dynamic> updatedInfo = {
        'fullName': _fullNameController.text, // Updated full name
        'city': _cityController.text, // Updated city
        'country': _countryController.text, // Updated country
        'interest': _interestController.text, // Updated interest
        'profileImage': _profileImageUrl, // Updated profile image URL
      };

      await _databaseMethods.updateUser(
          user.uid, updatedInfo); // Update user data in Firestore
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content:
                Text("Profile updated successfully")), // Show success message
      );
    }
  }

  Future<void> _createProfile() async {
    User? user = FirebaseAuth.instance.currentUser; // Get current user
    if (user != null) {
      Map<String, dynamic> userInfo = {
        'fullName': _fullNameController.text, // Full name
        'city': _cityController.text, // City
        'country': _countryController.text, // Country
        'interest': _interestController.text, // Interest
        'profileImage': _profileImageUrl, // Profile image URL
      };

      await _databaseMethods.addUser(
          user.uid, userInfo); // Add user data to Firestore
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content:
                Text("Profile created successfully")), // Show success message
      );
    }
  }

  Future<void> _deleteProfile() async {
    User? user = FirebaseAuth.instance.currentUser; // Get current user
    if (user != null) {
      await _databaseMethods
          .deleteUser(user.uid); // Delete user data from Firestore
      await _authService.signOut(context); // Sign out user
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => CoverScreen()), // Navigate to CoverScreen
      );
    }
  }

  Future<void> _uploadImage() async {
    final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery); // Pick image from gallery
    if (image != null) {
      String fileName =
          DateTime.now().toString() + '.png'; // Generate unique file name
      Reference storageReference = FirebaseStorage.instance
          .ref()
          .child('profile_images')
          .child(fileName); // Reference to Firebase Storage

      try {
        await storageReference
            .putFile(File(image.path)); // Upload image to Firebase Storage
        String downloadURL = await storageReference
            .getDownloadURL(); // Get download URL of the image
        setState(() {
          _profileImageUrl = downloadURL; // Set profile image URL
        });
      } catch (e) {
        print("Error uploading image: $e"); // Print error if upload fails
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'), // App bar title
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding for the entire body
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Align children to the start
            children: [
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly, // Space children evenly
                children: [
                  const SizedBox(
                    height: 15, // Height of the sized box
                    width: 8, // Width of the sized box
                  ),
                  _buildTopButton('Settings', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              SettingsScreen()), // Navigate to SettingsScreen
                    );
                  }),
                  const SizedBox(
                    height: 15, // Height of the sized box
                    width: 8, // Width of the sized box
                  ),
                ],
              ),
              const SizedBox(height: 30), // Vertical spacing
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 50, // Radius of the circle avatar
                      backgroundImage: _profileImageUrl.isNotEmpty
                          ? NetworkImage(_profileImageUrl)
                              as ImageProvider // Use network image if URL is not empty
                          : AssetImage(
                              'assets/images/profile.png'), // Use default asset image
                    ),
                    Positioned(
                      right: 0, // Position from the right
                      bottom: 0, // Position from the bottom
                      child: CircleAvatar(
                        radius: 17, // Radius of the edit button circle avatar
                        backgroundColor: Color(0xFF1791C8), // Background color
                        child: IconButton(
                          icon: Icon(Icons.edit,
                              color: Colors.white, size: 18), // Edit icon
                          onPressed: _uploadImage, // Call _uploadImage on press
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50), // Vertical spacing
              _buildProfileItem('Full Name',
                  _fullNameController), // Profile item for full name
              const SizedBox(height: 8), // Vertical spacing
              _buildProfileItem(
                  'City', _cityController), // Profile item for city
              const SizedBox(height: 8), // Vertical spacing
              _buildProfileItem(
                  'Country', _countryController), // Profile item for country
              const SizedBox(height: 8), // Vertical spacing
              _buildProfileItem('Your Interest',
                  _interestController), // Profile item for interest
              const SizedBox(height: 30), // Vertical spacing
              Center(
                child: ElevatedButton(
                  onPressed: _createProfile, // Call _createProfile on press
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Color(0xFF00BF63), // Button background color
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 12), // Button padding
                  ),
                  child: const Text(
                    'Create Profile', // Button text
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold), // Button text style
                  ),
                ),
              ),
              const SizedBox(height: 10), // Vertical spacing
              Center(
                child: ElevatedButton(
                  onPressed: _updateProfile, // Call _updateProfile on press
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Color(0xFF00BF63), // Button background color
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 12), // Button padding
                  ),
                  child: const Text(
                    'Update Profile', // Button text
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold), // Button text style
                  ),
                ),
              ),
              const SizedBox(height: 10), // Vertical spacing
              Center(
                child: ElevatedButton(
                  onPressed: _deleteProfile, // Call _deleteProfile on press
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, // Button background color
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 12), // Button padding
                  ),
                  child: const Text(
                    'Delete Profile', // Button text
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold), // Button text style
                  ),
                ),
              ),
              const SizedBox(height: 10), // Vertical spacing
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    await _authService.signOut(context); // Sign out user
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              CoverScreen()), // Navigate to CoverScreen
                      (route) => false, // Remove all previous routes
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Color(0xFF00BF63), // Button background color
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 12), // Button padding
                  ),
                  child: const Text(
                    'Sign Out', // Button text
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold), // Button text style
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileItem(String title, TextEditingController controller) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start, // Align children to the start
      children: [
        Row(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align children to the start
          children: [
            Expanded(
              flex: 2, // Flex value for title
              child: Text(
                '$title: ', // Title text
                style: const TextStyle(fontSize: 16), // Title text style
              ),
            ),
            Expanded(
              flex: 3, // Flex value for input field
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 8.0, vertical: 4.0), // Input field padding
                decoration: BoxDecoration(
                  color: Color(0xFF1791C8), // Input field background color
                  borderRadius:
                      BorderRadius.circular(8), // Input field border radius
                ),
                child: TextField(
                  controller: controller, // Input field controller
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white), // Input field text style
                  decoration: InputDecoration(
                    border: InputBorder.none, // Remove input field border
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8), // Vertical spacing
      ],
    );
  }

  Widget _buildTopButton(String text, VoidCallback onPressed) {
    return Expanded(
      child: ElevatedButton(
        onPressed: onPressed, // Button press callback
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF00BF63), // Button background color
          padding: const EdgeInsets.symmetric(
              vertical: 8.0, horizontal: 4.0), // Button padding
        ),
        child: Text(
          text, // Button text
          textAlign: TextAlign.center, // Center align text
          style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12), // Button text style
        ),
      ),
    );
  }
}
