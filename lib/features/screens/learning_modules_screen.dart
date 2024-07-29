import 'package:flutter/material.dart'; // Import Flutter material package
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Authentication package
import 'package:cloud_functions/cloud_functions.dart'; // Import Firebase Cloud Functions package

import '/features/screens/tips_screen.dart'; // Import TipsScreen
import '/features/screens/ar_experience_screen.dart'; // Import ARExperienceScreen
import '/features/screens/community_screen.dart'; // Import CommunityScreen

class LearningModulesScreen extends StatelessWidget {
  const LearningModulesScreen({Key? key})
      : super(key: key); // Constructor for LearningModulesScreen

  Future<void> _sendEnrollmentEmail(String courseName) async {
    final User? user =
        FirebaseAuth.instance.currentUser; // Get the current user
    if (user != null) {
      final HttpsCallable callable = FirebaseFunctions.instance.httpsCallable(
          'sendEnrollmentEmail'); // Get the Cloud Function callable
      try {
        await callable.call(<String, dynamic>{
          'email': user.email, // Pass the user's email to the Cloud Function
          'courseName':
              courseName, // Pass the course name to the Cloud Function
        });
      } catch (e) {
        print(
            "Failed to send enrollment email: $e"); // Print error message if the function call fails
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 16.0), // Padding for the entire column
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0), // Padding for the title container
                alignment: Alignment.center, // Center alignment for the title
                child: const Text(
                  'Featured Content:',
                  style: TextStyle(
                    color: Color(0xFF00BF63), // Green color for the title
                    fontSize: 24, // Font size for the title
                    fontWeight:
                        FontWeight.bold, // Bold font weight for the title
                  ),
                ),
              ),
              const SizedBox(height: 10), // Vertical spacing
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, // Space between the module cards
                children: [
                  _buildModuleCard(
                    context,
                    'assets/images/11.png', // Image path for the first module
                    'Sustainable Living Practices', // Title for the first module
                    'This module covers Eco-friendly habits, energy conservation, waste reduction, and sustainable product choices that can help reduce your carbon footprint.', // Description for the first module
                    const Color(
                        0xFF00BF63), // Background color for the first module
                    const Color(
                        0xFF1791C8), // Button text color for the first module
                  ),
                  _buildModuleCard(
                    context,
                    'assets/images/10.png', // Image path for the second module
                    'Understanding climate change', // Title for the second module
                    'Delve into the science of climate change, exploring its causes, effects, and the evidence behind global warming.', // Description for the second module
                    const Color(
                        0xFF1791C8), // Background color for the second module
                    const Color(
                        0xFF00BF63), // Button text color for the second module
                  ),
                ],
              ),
              const SizedBox(height: 16), // Vertical spacing
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, // Space between the module cards
                children: [
                  _buildModuleCard(
                    context,
                    'assets/images/12.png', // Image path for the third module
                    'Wildlife Conservation Efforts', // Title for the third module
                    'Understand the importance of biodiversity, the threats faced by endangered species, and how conservation efforts can protect and restore wildlife habitats.', // Description for the third module
                    const Color(
                        0xFF00BF63), // Background color for the third module
                    const Color(
                        0xFF1791C8), // Button text color for the third module
                  ),
                  _buildModuleCard(
                    context,
                    'assets/images/13.png', // Image path for the fourth module
                    'Community Engagement', // Title for the fourth module
                    'Gain insights into participating in environmental campaigns, and collaborating with others to make a significant impact on environmental conservation efforts.', // Description for the fourth module
                    const Color(
                        0xFF1791C8), // Background color for the fourth module
                    const Color(
                        0xFF00BF63), // Button text color for the fourth module
                  ),
                ],
              ),
              const SizedBox(height: 16), // Vertical spacing
              Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0), // Padding for the module list title
                alignment: Alignment
                    .center, // Center alignment for the module list title
                child: const Text(
                  'Module list:',
                  style: TextStyle(
                    color: Color(0xFF000000), // Black color for the title
                    fontSize: 24, // Font size for the title
                    fontWeight:
                        FontWeight.bold, // Bold font weight for the title
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 8.0), // Padding for the module list forms
                child: Row(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceBetween, // Space between the small forms
                  children: [
                    _buildSmallForm(
                      'Sustainable Living\nPractices', // Text for the first small form
                      const Color(
                          0xFF1791C8), // Background color for the first small form
                    ),
                    _buildSmallForm(
                      'Renewable\nEnergy Solutions', // Text for the second small form
                      const Color(
                          0xFF00BF63), // Background color for the second small form
                    ),
                    _buildSmallForm(
                      'Community Action\nand Engagement', // Text for the third small form
                      const Color(
                          0xFFF8D106), // Background color for the third small form
                    ),
                    _buildSmallForm(
                      'Impact of Pollution\non Ecosystems', // Text for the fourth small form
                      const Color(
                          0xFFD800DC), // Background color for the fourth small form
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical:
                        8.0), // Padding for the rectangular form and ellipses
                child: Row(
                  mainAxisAlignment: MainAxisAlignment
                      .center, // Center alignment for the rectangular form and ellipses
                  children: [
                    Container(
                      width: 17,
                      height: 5,
                      decoration: BoxDecoration(
                        color: const Color(
                            0xFF1791C8), // Color for the rectangular form
                        borderRadius: BorderRadius.circular(
                            2.5), // Border radius for the rectangular form
                      ),
                    ),
                    const SizedBox(width: 10), // Horizontal spacing
                    _buildSmallEllipse(
                        const Color(0xFF1791C8)), // Small ellipse 1
                    const SizedBox(width: 5), // Horizontal spacing
                    _buildSmallEllipse(
                        const Color(0xFF1791C8)), // Small ellipse 2
                    const SizedBox(width: 5), // Horizontal spacing
                    _buildSmallEllipse(
                        const Color(0xFF1791C8)), // Small ellipse 3
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0), // Padding for the progress title
                alignment:
                    Alignment.center, // Center alignment for the progress title
                child: const Text(
                  'Track your progress:',
                  style: TextStyle(
                    color: Color(0xFF000000), // Black color for the title
                    fontSize: 13, // Font size for the title
                    fontWeight:
                        FontWeight.bold, // Bold font weight for the title
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 16.0), // Padding for the progress forms
                child: Row(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceBetween, // Space between the progress forms
                  children: [
                    _buildProgressForm(
                      'Sustainable Living\nPractices', // Title for the first progress form
                      '48%', // Progress for the first progress form
                      const Color(
                          0xFF00BF63), // Background color for the first progress form
                    ),
                    _buildProgressForm(
                      'Understanding\nClimate change', // Title for the second progress form
                      '62%', // Progress for the second progress form
                      const Color(
                          0xFF1791C8), // Background color for the second progress form
                    ),
                    _buildProgressForm(
                      'Community Action\nand Engagement', // Title for the third progress form
                      '27%', // Progress for the third progress form
                      const Color(
                          0xFF00BF63), // Background color for the third progress form
                    ),
                    _buildProgressForm(
                      'Impact of Pollution\non Ecosystems', // Title for the fourth progress form
                      'Not yet started', // Progress for the fourth progress form
                      const Color(
                          0xFF1791C8), // Background color for the fourth progress form
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
      width: 170, // Width for the module card
      height: 300, // Height for the module card
      child: Card(
        color: backgroundColor, // Background color for the card
        child: Column(
          children: [
            Image.asset(
              imagePath, // Image asset for the card
              width: double.infinity,
              height: 150,
              fit: BoxFit.cover, // Fit the image to cover the card width
            ),
            Padding(
              padding:
                  const EdgeInsets.all(8.0), // Padding for the text content
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Left alignment for the text
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18, // Font size for the title
                      fontWeight:
                          FontWeight.bold, // Bold font weight for the title
                      color: Colors.white, // White color for the title text
                    ),
                  ),
                  const SizedBox(height: 4), // Vertical spacing
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 12, // Font size for the description
                      color:
                          Colors.white, // White color for the description text
                    ),
                  ),
                  const SizedBox(height: 8), // Vertical spacing
                  TextButton(
                    onPressed: () {
                      _sendEnrollmentEmail(
                          title); // Send enrollment email on button press
                    },
                    style: TextButton.styleFrom(
                      primary: buttonTextColor, // Button text color
                    ),
                    child: const Text('Enroll'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSmallForm(String text, Color color) {
    return Container(
      width: 90, // Width for the small form
      height: 80, // Height for the small form
      decoration: BoxDecoration(
        color: color, // Background color for the small form
        borderRadius:
            BorderRadius.circular(10), // Border radius for the small form
      ),
      alignment: Alignment.center, // Center alignment for the text
      child: Text(
        text,
        textAlign:
            TextAlign.center, // Center alignment for the text within the form
        style: const TextStyle(
          fontSize: 12, // Font size for the text
          color: Colors.white, // White color for the text
        ),
      ),
    );
  }

  Widget _buildSmallEllipse(Color color) {
    return Container(
      width: 5, // Width for the ellipse
      height: 5, // Height for the ellipse
      decoration: BoxDecoration(
        color: color, // Color for the ellipse
        shape: BoxShape.circle, // Circular shape for the ellipse
      ),
    );
  }

  Widget _buildProgressForm(
      String title, String progress, Color backgroundColor) {
    return Container(
      width: 90, // Width for the progress form
      height: 100, // Height for the progress form
      decoration: BoxDecoration(
        color: backgroundColor, // Background color for the progress form
        borderRadius:
            BorderRadius.circular(10), // Border radius for the progress form
      ),
      alignment: Alignment.center, // Center alignment for the text
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center, // Center alignment for the column
        children: [
          Text(
            title,
            textAlign: TextAlign.center, // Center alignment for the title text
            style: const TextStyle(
              fontSize: 12, // Font size for the title text
              color: Colors.white, // White color for the title text
            ),
          ),
          const SizedBox(height: 8), // Vertical spacing
          Text(
            progress,
            style: const TextStyle(
              fontSize: 14, // Font size for the progress text
              fontWeight:
                  FontWeight.bold, // Bold font weight for the progress text
              color: Colors.white, // White color for the progress text
            ),
          ),
        ],
      ),
    );
  }
}
