import 'package:flutter/material.dart'; // Import the Flutter material package
import '/features/screens/ar_experience_screen.dart'; // Import the ARExperienceScreen


// Define a stateless widget for the AR Visualizations screen
class ARVisualizationsScreen extends StatelessWidget {
  const ARVisualizationsScreen({Key? key}) : super(key: key);


  // Helper method to build a small ellipse with a specified color
  Widget _buildSmallEllipse(Color color) {
    return Container(
      width: 6, // Set the width of the ellipse
      height: 6, // Set the height of the ellipse
      decoration: BoxDecoration(
        color: color, // Set the color of the ellipse
        shape: BoxShape.circle, // Set the shape of the ellipse to a circle
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    final double screenWidth =
        MediaQuery.of(context).size.width; // Get the width of the screen


    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            const Color(0xFF00BF63), // Set the background color of the app bar
        automaticallyImplyLeading: false, // Remove the default back arrow
        title: Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween, // Space the elements evenly
          children: [
            Container(
              width: 75, // Set the width of the back button container
              height: 30, // Set the height of the back button container
              margin:
                  const EdgeInsets.all(4.0), // Add margin around the container
              child: TextButton.icon(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero, // Remove padding
                  backgroundColor: Colors.white, // Set background color
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(8.0), // Set border radius
                  ),
                ),
                icon: const Icon(Icons.arrow_back,
                    color: Color(0xFF00BF63)), // Set back icon color
                label: const Text(
                  'Back',
                  style: TextStyle(color: Color(0xFF00BF63)), // Set label color
                ),
                onPressed: () {
                  Navigator.pop(context); // Go back to the previous screen
                },
              ),
            ),
            const Spacer(), // Add space between elements
            const Text(
              'AR Visualizations',
              style: TextStyle(color: Colors.white), // Set text color
            ),
            const Spacer(), // Add space between elements
            Container(width: 66), // Placeholder container to balance the layout
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Add padding to the content
          child: Column(
            children: [
              Container(
                width:
                    screenWidth * 0.7, // Set the width relative to screen width
                alignment: Alignment.center, // Center align the text
                margin: const EdgeInsets.symmetric(
                    vertical: 16.0), // Add vertical margin
                child: const Text(
                  'Explore AR Visualization',
                  style: TextStyle(
                    color: Color(0xFF00BF63), // Set text color
                    fontSize: 24, // Set font size
                    fontWeight: FontWeight.bold, // Set font weight
                  ),
                ),
              ),
              Container(
                width:
                    screenWidth * 0.9, // Set the width relative to screen width
                padding:
                    const EdgeInsets.all(16.0), // Add padding to the container
                decoration: BoxDecoration(
                  color: const Color(0xFF1791C8), // Set background color
                  borderRadius: BorderRadius.circular(8.0), // Set border radius
                ),
                alignment: Alignment.center, // Center align the content
                child: const Text(
                  'Discover the power of augmented reality with Earthwise! Our AR Experience Launch feature immerses you in the real-world impacts of climate change and wildlife conservation.',
                  style: TextStyle(
                    color: Colors.white, // Set text color
                    fontSize: 16, // Set font size
                    height: 1.5, // Set line height
                  ),
                  textAlign: TextAlign.center, // Center align the text
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ARExperienceScreen()), // Navigate to ARExperienceScreen
                  );
                },
                child: Container(
                  width: screenWidth *
                      0.55, // Set the width relative to screen width
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0), // Add vertical padding
                  margin: const EdgeInsets.symmetric(
                      vertical: 16.0), // Add vertical margin
                  alignment: Alignment.center, // Center align the content
                  decoration: BoxDecoration(
                    color: const Color(0xFF00BF63), // Set background color
                    borderRadius:
                        BorderRadius.circular(100.0), // Set border radius
                  ),
                  child: const Text(
                    'Start AR Experience',
                    style: TextStyle(
                      color: Colors.white, // Set text color
                      fontSize: 16, // Set font size
                      fontWeight: FontWeight.bold, // Set font weight
                    ),
                    textAlign: TextAlign.center, // Center align the text
                  ),
                ),
              ),
              Container(
                width:
                    screenWidth * 0.6, // Set the width relative to screen width
                alignment: Alignment.center, // Center align the text
                margin: const EdgeInsets.symmetric(
                    vertical: 16.0), // Add vertical margin
                child: const Text(
                  'Educational overlays:',
                  style: TextStyle(
                    color: Color(0xFF1791C8), // Set text color
                    fontSize: 22, // Set font size
                    fontWeight: FontWeight.bold, // Set font weight
                  ),
                ),
              ),
              Container(
                width: screenWidth *
                    0.95, // Set the width relative to screen width
                padding:
                    const EdgeInsets.all(16.0), // Add padding to the container
                alignment: Alignment.center, // Center align the content
                margin: const EdgeInsets.symmetric(
                    vertical: 16.0), // Add vertical margin
                child: const Text(
                  'Experience the reality of climate change like never before with Earthwise’s AR Visualizations. Our cutting-edge augmented reality feature brings the effects of environmental degradation directly to your surroundings.\n\nSee the stark contrast of lush forests transforming into barren lands due to deforestation, visualize rising sea levels encroaching on coastal areas, and observe the decline in wildlife populations right where you stand.',
                  style: TextStyle(
                    color: Colors.black, // Set text color
                    fontSize: 16, // Set font size
                    height: 1.5, // Set line height
                  ),
                  textAlign: TextAlign.center, // Center align the text
                ),
              ),
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly, // Space the elements evenly
                children: [
                  Container(
                    width: screenWidth *
                        0.20, // Set the width relative to screen width
                    height: screenWidth *
                        0.20 *
                        (45 / 120), // Set the height based on the aspect ratio
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(8.0), // Set border radius
                    ),
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(8.0), // Set border radius
                      child: Image.asset(
                        'assets/images/6.png',
                        fit: BoxFit.cover, // Cover the entire container
                      ),
                    ),
                  ),
                  Container(
                    width: screenWidth *
                        0.20, // Set the width relative to screen width
                    height: screenWidth *
                        0.20 *
                        (45 / 80), // Set the height based on the aspect ratio
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(8.0), // Set border radius
                    ),
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(8.0), // Set border radius
                      child: Image.asset(
                        'assets/images/7.png',
                        fit: BoxFit.cover, // Cover the entire container
                      ),
                    ),
                  ),
                  Container(
                    width: screenWidth *
                        0.20, // Set the width relative to screen width
                    height: screenWidth *
                        0.20 *
                        (45 / 90), // Set the height based on the aspect ratio
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(8.0), // Set border radius
                    ),
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(8.0), // Set border radius
                      child: Image.asset(
                        'assets/images/8.png',
                        fit: BoxFit.cover, // Cover the entire container
                      ),
                    ),
                  ),
                  Container(
                    width: screenWidth *
                        0.20, // Set the width relative to screen width
                    height: screenWidth *
                        0.20 *
                        (45 / 95), // Set the height based on the aspect ratio
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(8.0), // Set border radius
                    ),
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(8.0), // Set border radius
                      child: Image.asset(
                        'assets/images/9.png',
                        fit: BoxFit.cover, // Cover the entire container
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16), // Add vertical spacing
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0), // Add vertical padding
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Center align the elements
                  children: [
                    Container(
                      width: screenWidth *
                          0.045, // Set the width relative to screen width
                      height: 5, // Set the height
                      decoration: BoxDecoration(
                        color: const Color(0xFF00BF63), // Set background color
                        borderRadius:
                            BorderRadius.circular(2.5), // Set border radius
                      ),
                    ),
                    const SizedBox(width: 10), // Add horizontal spacing
                    _buildSmallEllipse(const Color(
                        0xFF00BF63)), // Build small ellipse with specified color
                    const SizedBox(width: 5), // Add horizontal spacing
                    _buildSmallEllipse(const Color(
                        0xFF00BF63)), // Build small ellipse with specified color
                    const SizedBox(width: 5), // Add horizontal spacing
                    _buildSmallEllipse(const Color(
                        0xFF00BF63)), // Build small ellipse with specified color
                  ],
                ),
              ),
              const SizedBox(height: 16), // Add vertical spacing
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Center align the elements
                children: [
                  const Text(
                    'Share:',
                    style: TextStyle(
                      fontSize: 16, // Set font size
                      fontWeight: FontWeight.bold, // Set font weight
                    ),
                  ),
                  const SizedBox(width: 16), // Add horizontal spacing
                  Image.asset(
                    'assets/images/facebook_earthwise_app.png',
                    width: 20, // Set the width of the image
                    height: 19.92, // Set the height of the image
                  ),
                  const SizedBox(width: 16), // Add horizontal spacing
                  Image.asset(
                    'assets/images/instagram_earthwise_app.png',
                    width: 20, // Set the width of the image
                    height: 20, // Set the height of the image
                  ),
                  const SizedBox(width: 16), // Add horizontal spacing
                  Image.asset(
                    'assets/images/linkedin_earthwise_app.png',
                    width: 18, // Set the width of the image
                    height: 18, // Set the height of the image
                  ),
                  const SizedBox(width: 16), // Add horizontal spacing
                  Image.asset(
                    'assets/images/twitter_earthwise_app.png',
                    width: 28, // Set the width of the image
                    height: 28, // Set the height of the image
                  ),
                ],
              ),
              const SizedBox(height: 16), // Add vertical spacing
              const Center(
                  child:
                      Text('')), // Placeholder for potential additional content
            ],
          ),
        ),
      ),
    );
  }
}


