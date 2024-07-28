import 'dart:io'; // Import this for File class
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '/features/screens/settings_screen.dart';
import '/features/user_auth/firebase_auth_implementation/firebase_auth_services.dart';
import '/features/screens/cover_screen.dart';
import '/features/user_auth/firebase_auth_implementation/database.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final FirebaseAuthService _authService = FirebaseAuthService();
  final DatabaseMethods _databaseMethods = DatabaseMethods();
  final ImagePicker _picker = ImagePicker();

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _interestController = TextEditingController();

  String _profileImageUrl = ''; // URL of the profile image

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _cityController.dispose();
    _countryController.dispose();
    _interestController.dispose();
    super.dispose();
  }

  Future<void> _loadUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot<Map<String, dynamic>> userDoc =
          await _databaseMethods.getUser(user.uid);

      if (userDoc.exists) {
        var data = userDoc.data()!;
        setState(() {
          _fullNameController.text = data['fullName'] ?? 'Manzi';
          _cityController.text = data['city'] ?? 'Kigali';
          _countryController.text = data['country'] ?? 'Rwanda';
          _interestController.text = data['interest'] ?? 'Education';
          _profileImageUrl = data['profileImage'] ?? '';
        });
      } else {
        // Set default values if no data exists
        setState(() {
          _fullNameController.text = 'Manzi';
          _cityController.text = 'Kigali';
          _countryController.text = 'Rwanda';
          _interestController.text = 'Education';
        });
      }
    }
  }

  Future<void> _updateProfile() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Map<String, dynamic> updatedInfo = {
        'fullName': _fullNameController.text,
        'city': _cityController.text,
        'country': _countryController.text,
        'interest': _interestController.text,
        'profileImage': _profileImageUrl, // Include image URL
      };

      await _databaseMethods.updateUser(user.uid, updatedInfo);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Profile updated successfully")),
      );
    }
  }

  Future<void> _createProfile() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Map<String, dynamic> userInfo = {
        'fullName': _fullNameController.text,
        'city': _cityController.text,
        'country': _countryController.text,
        'interest': _interestController.text,
        'profileImage': _profileImageUrl, // Include image URL
      };

      await _databaseMethods.addUser(user.uid, userInfo);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Profile created successfully")),
      );
    }
  }

  Future<void> _deleteProfile() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await _databaseMethods.deleteUser(user.uid);
      await _authService.signOut(context);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => CoverScreen()),
      );
    }
  }

  Future<void> _uploadImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      String fileName = DateTime.now().toString() + '.png';
      Reference storageReference = FirebaseStorage.instance
          .ref()
          .child('profile_images')
          .child(fileName);

      try {
        await storageReference
            .putFile(File(image.path)); // Ensure File is imported from dart:io
        String downloadURL = await storageReference.getDownloadURL();
        setState(() {
          _profileImageUrl = downloadURL;
        });
      } catch (e) {
        print("Error uploading image: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(
                    height: 15,
                    width: 8,
                  ),
                  _buildTopButton('Settings', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SettingsScreen()),
                    );
                  }),
                  const SizedBox(
                    height: 15,
                    width: 8,
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: _profileImageUrl.isNotEmpty
                          ? NetworkImage(_profileImageUrl) as ImageProvider
                          : AssetImage('assets/images/profile.png'),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: CircleAvatar(
                        radius: 17,
                        backgroundColor: Color(0xFF1791C8),
                        child: IconButton(
                          icon: Icon(Icons.edit, color: Colors.white, size: 18),
                          onPressed: _uploadImage,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              _buildProfileItem('Full Name', _fullNameController),
              const SizedBox(height: 8),
              _buildProfileItem('City', _cityController),
              const SizedBox(height: 8),
              _buildProfileItem('Country', _countryController),
              const SizedBox(height: 8),
              _buildProfileItem('Your Interest', _interestController),
              const SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: _createProfile,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF00BF63),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 12),
                  ),
                  child: const Text(
                    'Create Profile',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: ElevatedButton(
                  onPressed: _updateProfile,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF00BF63),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 12),
                  ),
                  child: const Text(
                    'Update Profile',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: ElevatedButton(
                  onPressed: _deleteProfile,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 12),
                  ),
                  child: const Text(
                    'Delete Profile',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    await _authService.signOut(context);
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => CoverScreen()),
                      (route) => false,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF00BF63),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 12),
                  ),
                  child: const Text(
                    'Sign Out',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Text(
                '$title: ',
                style: const TextStyle(fontSize: 16),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                decoration: BoxDecoration(
                  color: Color(0xFF1791C8),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  controller: controller,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
      ],
    );
  }

  Widget _buildTopButton(String text, VoidCallback onPressed) {
    return Expanded(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF00BF63),
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
        ),
      ),
    );
  }
}
