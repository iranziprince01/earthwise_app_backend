import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_functions/cloud_functions.dart'; // Add this import

import '/features/screens/tips_screen.dart';
import '/features/screens/ar_experience_screen.dart';
import '/features/screens/community_screen.dart';

class LearningModulesScreen extends StatelessWidget {
  const LearningModulesScreen({Key? key}) : super(key: key);

  Future<void> _sendEnrollmentEmail(String courseName) async {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final HttpsCallable callable =
          FirebaseFunctions.instance.httpsCallable('sendEnrollmentEmail');
      try {
        await callable.call(<String, dynamic>{
          'email': user.email,
          'courseName': courseName,
        });
      } catch (e) {
        print("Failed to send enrollment email: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              // Featured Content title
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                alignment: Alignment.center,
                child: const Text(
                  'Featured Content:',
                  style: TextStyle(
                    color: Color(0xFF00BF63),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // First set of forms with stacked forms on top
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildModuleCard(
                    context,
                    'assets/images/11.png',
                    'Sustainable Living Practices',
                    'This module covers Eco-friendly habits, energy conservation, waste reduction, and sustainable product choices that can help reduce your carbon footprint.',
                    const Color(0xFF00BF63),
                    const Color(0xFF1791C8),
                  ),
                  _buildModuleCard(
                    context,
                    'assets/images/10.png',
                    'Understanding climate change',
                    'Delve into the science of climate change, exploring its causes, effects, and the evidence behind global warming.',
                    const Color(0xFF1791C8),
                    const Color(0xFF00BF63),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Second set of forms with stacked forms on top
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildModuleCard(
                    context,
                    'assets/images/12.png',
                    'Wildlife Conservation Efforts',
                    'Understand the importance of biodiversity, the threats faced by endangered species, and how conservation efforts can protect and restore wildlife habitats.',
                    const Color(0xFF00BF63),
                    const Color(0xFF1791C8),
                  ),
                  _buildModuleCard(
                    context,
                    'assets/images/13.png',
                    'Community Engagement',
                    'Gain insights into participating in environmental campaigns, and collaborating with others to make a significant impact on environmental conservation efforts.',
                    const Color(0xFF1791C8),
                    const Color(0xFF00BF63),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Module list title
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                alignment: Alignment.center,
                child: const Text(
                  'Module list:',
                  style: TextStyle(
                    color: Color(0xFF000000),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // Module list forms
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildSmallForm(
                      'Sustainable Living\nPractices',
                      const Color(0xFF1791C8),
                    ),
                    _buildSmallForm(
                      'Renewable\nEnergy Solutions',
                      const Color(0xFF00BF63),
                    ),
                    _buildSmallForm(
                      'Community Action\nand Engagement',
                      const Color(0xFFF8D106),
                    ),
                    _buildSmallForm(
                      'Impact of Pollution\non Ecosystems',
                      const Color(0xFFD800DC),
                    ),
                  ],
                ),
              ),

              // Rectangular form and ellipses
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 17,
                      height: 5,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1791C8),
                        borderRadius: BorderRadius.circular(2.5),
                      ),
                    ),
                    const SizedBox(width: 10),
                    _buildSmallEllipse(const Color(0xFF1791C8)),
                    const SizedBox(width: 5),
                    _buildSmallEllipse(const Color(0xFF1791C8)),
                    const SizedBox(width: 5),
                    _buildSmallEllipse(const Color(0xFF1791C8)),
                  ],
                ),
              ),

              // Track your progress title
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                alignment: Alignment.center,
                child: const Text(
                  'Track your progress:',
                  style: TextStyle(
                    color: Color(0xFF000000),
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // Progress forms
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildProgressForm(
                      'Sustainable Living\nPractices',
                      '48%',
                      const Color(0xFF00BF63),
                    ),
                    _buildProgressForm(
                      'Understanding\nClimate change',
                      '62%',
                      const Color(0xFF1791C8),
                    ),
                    _buildProgressForm(
                      'Community Action\nand Engagement',
                      '27%',
                      const Color(0xFF00BF63),
                    ),
                    _buildProgressForm(
                      'Impact of Pollution\non Ecosystems',
                      'Not yet started',
                      const Color(0xFF1791C8),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildModuleCard(BuildContext context, String imagePath, String title,
      String description, Color backgroundColor, Color buttonTextColor) {
    return SizedBox(
      width: 170,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: 170,
                height: 105,
                color: backgroundColor,
              ),
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  width: 170,
                  height: 103,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: 170,
            height: 140,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(8.0),
                bottomRight: Radius.circular(8.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    description,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _sendEnrollmentEmail(
                          title); // Send email when enroll button is pressed
                      if (title == 'Understanding climate change') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ARExperienceScreen(),
                          ),
                        );
                      } else if (title == 'Sustainable Living Practices') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TipsScreen(),
                          ),
                        );
                      } else if (title == 'Community Engagement') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CommunityScreen(),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 25),
                    ),
                    child: Text(
                      'Enroll',
                      style: TextStyle(
                        color: buttonTextColor,
                        fontSize: 9,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSmallForm(String text, Color backgroundColor) {
    return Container(
      width: 85,
      height: 32,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 9,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildSmallEllipse(Color backgroundColor) {
    return Container(
      width: 5,
      height: 5,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(2.5),
      ),
    );
  }

  Widget _buildProgressForm(
      String title, String progress, Color backgroundColor) {
    return Container(
      width: 90,
      height: 65,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 8,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            progress,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
