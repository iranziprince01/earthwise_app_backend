import 'package:flutter/material.dart'; // Import the Flutter material package

// Define a stateful widget for the Cover screen
class CoverScreen extends StatefulWidget {
  final Widget? child; // Optional child widget to navigate to
  const CoverScreen(
      {super.key, this.child}); // Constructor with optional child parameter

  @override
  State<CoverScreen> createState() =>
      _CoverScreenState(); // Create the state for the CoverScreen
}

class _CoverScreenState extends State<CoverScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF00BF63), // Set background color of the container
        child: Column(
          mainAxisAlignment: MainAxisAlignment
              .spaceBetween, // Space elements between the column
          children: [
            Center(
              child: Column(
                mainAxisSize:
                    MainAxisSize.min, // Minimize the size of the column
                children: [
                  const SizedBox(height: 100), // Add vertical spacing
                  ClipOval(
                    child: Image.asset(
                      'assets/images/earthwise_app_logo.png', // Path to the logo image
                      width: 100, // Set width of the image
                      height: 100, // Set height of the image
                      fit: BoxFit.cover, // Cover the container with the image
                    ),
                  ),
                  const SizedBox(height: 50), // Add vertical spacing
                  const Text(
                    'Earthwise',
                    style: TextStyle(
                      fontSize: 48, // Set font size
                      fontWeight: FontWeight.bold, // Set font weight
                      color: Colors.white, // Set text color
                    ),
                  ),
                  const SizedBox(height: 10), // Add vertical spacing
                  const Text(
                    'Empowering greener planet!',
                    style: TextStyle(
                      fontSize: 20, // Set font size
                      fontWeight: FontWeight.normal, // Set font weight
                      color: Colors.white, // Set text color
                    ),
                  ),
                  const SizedBox(height: 50), // Add vertical spacing
                  ElevatedButton(
                    onPressed: () {
                      if (widget.child != null) {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                widget.child!, // Navigate to the child widget
                          ),
                          (route) => false, // Remove all previous routes
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                'No destination specified.'), // Show a message if no destination is specified
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.white, // Set button background color
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30, // Set horizontal padding
                        vertical: 15, // Set vertical padding
                      ),
                    ),
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                        color: Color(0xFF1791C8), // Set text color
                        fontSize: 20, // Set font size
                        fontWeight: FontWeight.bold, // Set font weight
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 20), // Add bottom padding
              child: Text(
                'v 1.0', // Version number
                style: TextStyle(
                  fontSize: 16, // Set font size
                  color: Colors.white, // Set text color
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
