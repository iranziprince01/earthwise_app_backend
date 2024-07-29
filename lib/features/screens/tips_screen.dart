import 'package:flutter/material.dart'; // Import the Flutter material package

class TipsScreen extends StatefulWidget {
  const TipsScreen({Key? key}) : super(key: key); // Constructor for TipsScreen widget

  @override
  _TipsScreenState createState() => _TipsScreenState(); // Create state for TipsScreen
}

class _TipsScreenState extends State<TipsScreen> {
  final TextEditingController tipController = TextEditingController(); // Controller for the text input
  final List<String> tips = [ // List of initial tips
    '1. Carbon footprint tracking',
    '2. Sustainable transportation',
    '3. Waste reduction and recycling',
    '4. Sustainable consumption',
    '5. Community engagement',
    '6. Daily habits',
    '7. Advocacy and education',
    '8. Support urban green spaces',
    '9. Lifestyle inspiration',
    '10. Sustainable investing',
  ];

  @override
  void dispose() {
    tipController.dispose(); // Dispose of the text controller when no longer needed
    super.dispose(); // Call dispose on the superclass
  }

  void _submitTip() {
    final tip = tipController.text; // Get the text from the controller
    if (tip.isNotEmpty) { // Check if the text is not empty
      setState(() {
        tips.add(tip); // Add the new tip to the list
      });
      tipController.clear(); // Clear the text input
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF00BF63), // Set background color of app bar
        automaticallyImplyLeading: false, // Remove the default back arrow
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start, // Align title to the start
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white), // Back arrow icon
              onPressed: () {
                Navigator.pop(context); // Go back to the previous screen
              },
            ),
            const SizedBox(width: 10), // Add space between back icon and title
            const Text(
              'Sustainable Living Practices', // Title of the app bar
              style: TextStyle(
                color: Colors.white, // Set text color to white
                fontSize: 20, // Set font size
                fontWeight: FontWeight.bold, // Set font weight to bold
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20), // Add vertical spacing
            const Text(
              'Lifestyle Tips', // Title for the tips section
              style: TextStyle(
                color: Color(0xFF00BF63), // Set text color
                fontSize: 20, // Set font size
                fontWeight: FontWeight.bold, // Set font weight to bold
              ),
              textAlign: TextAlign.center, // Center the text
            ),
            const SizedBox(height: 20), // Add vertical spacing
            Container(
              width: 356, // Set the width of the container
              decoration: BoxDecoration(
                color: const Color(0xFFD800DC), // Set background color
                borderRadius: BorderRadius.circular(12.0), // Set border radius
              ),
              padding: const EdgeInsets.all(16.0), // Add padding inside the container
              child: Text(
                tips.join('\n'), // Join tips with new lines
                style: const TextStyle(
                  color: Colors.white, // Set text color
                  fontSize: 16, // Set font size
                ),
              ),
            ),
            const SizedBox(height: 20), // Add vertical spacing
            Container(
              width: 356, // Set the width of the container
              decoration: BoxDecoration(
                color: const Color(0xFF00BF63), // Set background color
                borderRadius: BorderRadius.circular(12.0), // Set border radius
              ),
              padding: const EdgeInsets.all(16.0), // Add padding inside the container
              child: const Text(
                'Stay informed and get involved in local climate initiatives. '
                'Together, we can make a difference in the community and beyond '
                'in order to increase the standard of living among the people.', // Text inside the container
                style: TextStyle(
                  color: Colors.white, // Set text color
                  fontSize: 16, // Set font size
                ),
                textAlign: TextAlign.center, // Center the text
              ),
            ),
            const SizedBox(height: 20), // Add vertical spacing
            const Text(
              'Environmental Organizations:', // Title for the organizations section
              style: TextStyle(
                color: Colors.black, // Set text color
                fontSize: 18, // Set font size
                fontWeight: FontWeight.bold, // Set font weight to bold
              ),
              textAlign: TextAlign.center, // Center the text
            ),
            const SizedBox(height: 20), // Add vertical spacing
            Container(
              width: 356, // Set the width of the container
              decoration: BoxDecoration(
                color: const Color(0xFF1791C8), // Set background color
                borderRadius: BorderRadius.circular(12.0), // Set border radius
              ),
              padding: const EdgeInsets.all(16.0), // Add padding inside the container
              child: const Text(
                '1. Green peace\n'
                '2. Earth Island Institute\n'
                '3. Earth Justice\n'
                '4. Environmental defense fund\n'
                '5. Fauna and flora International(FFI)\n'
                '6. Global footprint network\n', // List of organizations
                style: TextStyle(
                  color: Colors.white, // Set text color
                  fontSize: 16, // Set font size
                ),
              ),
            ),
            const SizedBox(height: 20), // Add vertical spacing
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0), // Add horizontal padding
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center, // Center the row contents
                children: [
                  Container(
                    height: 38, // Set height of the container
                    width: 38, // Set width of the container
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle, // Set shape to circle
                      image: DecorationImage(
                        image: AssetImage('assets/images/profile.png'), // Profile image
                        fit: BoxFit.cover, // Cover the container
                      ),
                    ),
                  ),
                  const SizedBox(width: 10), // Add horizontal spacing
                  Expanded(
                    child: Container(
                      height: 80, // Set height of the container
                      decoration: BoxDecoration(
                        color: const Color(0xFF00BF63), // Set background color
                        borderRadius: BorderRadius.circular(12.0), // Set border radius
                      ),
                      alignment: Alignment.center, // Center the contents
                      padding: const EdgeInsets.all(8.0), // Add padding inside the container
                      child: TextField(
                        controller: tipController, // Controller for the text input
                        decoration: const InputDecoration(
                          hintText: 'Add your tips here......', // Hint text
                          hintStyle: TextStyle(color: Colors.white), // Set hint text color
                          border: InputBorder.none, // Remove the border
                        ),
                        style: const TextStyle(
                          color: Colors.white, // Set text color
                          fontSize: 14, // Set font size
                        ),
                        textAlign: TextAlign.left, // Align text to the left
                      ),
                    ),
                  ),
                  const SizedBox(width: 6), // Add horizontal spacing
                  ElevatedButton(
                    onPressed: _submitTip, // Set the onPressed function
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFC0D38), // Set button color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0), // Set border radius
                      ),
                    ),
                    child: const Text(
                      'Submit', // Button text
                      style: TextStyle(
                        color: Colors.white, // Set text color
                        fontSize: 14, // Set font size
                      ),
                      textAlign: TextAlign.center, // Center the text
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20), // Add some spacing at the bottom
          ],
        ),
      ),
    );
  }
}
