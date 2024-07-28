import 'package:flutter/material.dart'; // Import the Flutter material package
import '/features/screens/discussion_forum_screen.dart'; // Import the DiscussionForumScreen


// Define a stateless widget for the Community screen
class CommunityScreen extends StatelessWidget {
  const CommunityScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0), // Add padding to the content
            child: Column(
              crossAxisAlignment: CrossAxisAlignment
                  .center, // Center align the children horizontally
              children: [
                const Text(
                  'Community Engagement',
                  style: TextStyle(
                    fontSize: 28, // Set font size
                    fontWeight: FontWeight.bold, // Set font weight
                    color: Color(0xFF00BF63), // Set text color
                  ),
                ),
                const SizedBox(height: 16), // Add vertical spacing
                Container(
                  alignment: Alignment.center, // Center align the text
                  child: const Text(
                    'Events Map',
                    style: TextStyle(
                      color: Color(0xFF00BF63), // Set text color
                      fontSize: 20, // Set font size
                      fontWeight: FontWeight.bold, // Set font weight
                    ),
                    textAlign: TextAlign.center, // Center align the text
                  ),
                ),
                const SizedBox(height: 8), // Add vertical spacing
                Container(
                  padding:
                      const EdgeInsets.all(8.0), // Add padding to the container
                  child: const Text(
                    'Engage with local environmental events and forums.',
                    style: TextStyle(
                      color: Colors.black, // Set text color
                      fontSize: 16, // Set font size
                    ),
                    textAlign: TextAlign.center, // Center align the text
                  ),
                ),
                const SizedBox(height: 16), // Add vertical spacing
                SizedBox(
                  width: double.infinity, // Make the image take full width
                  height: constraints.maxHeight *
                      0.3, // Set height relative to screen height
                  child: Image.asset(
                    'assets/images/1.png', // Ensure the correct path
                    fit: BoxFit.cover, // Cover the entire container
                  ),
                ),
                const SizedBox(height: 16), // Add vertical spacing
                Container(
                  alignment: Alignment.center, // Center align the text
                  child: const Text(
                    'Discussion Forum',
                    style: TextStyle(
                      color: Colors.black, // Set text color
                      fontSize: 20, // Set font size
                      fontWeight: FontWeight.bold, // Set font weight
                    ),
                    textAlign: TextAlign.center, // Center align the text
                  ),
                ),
                const SizedBox(height: 8), // Add vertical spacing
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0), // Add horizontal padding
                  child: const Text(
                    'Explore wildlife conservation companies:',
                    style: TextStyle(
                      color: Colors.black, // Set text color
                      fontSize: 16, // Set font size
                    ),
                    textAlign: TextAlign.left, // Align the text to the left
                  ),
                ),
                const SizedBox(height: 16), // Add vertical spacing
                Container(
                  width: double.infinity, // Make the container take full width
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0), // Add horizontal padding
                  child: const Text(
                    'Join the Earthwise community today and connect with like-minded individuals passionate about making a positive impact on our planet!',
                    style: TextStyle(
                      color: Colors.black, // Set text color
                      fontSize: 16, // Set font size
                    ),
                    textAlign: TextAlign.left, // Align the text to the left
                  ),
                ),
                const SizedBox(height: 16), // Add vertical spacing
                Container(
                  width: double.infinity, // Make the container take full width
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0), // Add horizontal padding
                  child: const Text(
                    'Use the space below to start a conversation, share your thoughts, and collaborate on sustainable solutions.',
                    style: TextStyle(
                      color: Colors.black, // Set text color
                      fontSize: 16, // Set font size
                    ),
                    textAlign: TextAlign.left, // Align the text to the left
                  ),
                ),
                const SizedBox(height: 16), // Add vertical spacing
                Container(
                  width: double.infinity, // Make the container take full width
                  height: 150, // Set the height
                  margin: const EdgeInsets.all(
                      8.0), // Add margin around the container
                  padding:
                      const EdgeInsets.all(8.0), // Add padding to the container
                  decoration: BoxDecoration(
                    color: const Color(0xFFD9D9D9), // Set background color
                    borderRadius:
                        BorderRadius.circular(8.0), // Set border radius
                  ),
                  child: const TextField(
                    maxLines: null, // Allow multiple lines
                    decoration: InputDecoration(
                      hintText: 'Type your thoughts here...', // Set hint text
                      border: InputBorder.none, // Remove border
                    ),
                  ),
                ),
                const SizedBox(height: 14), // Add vertical spacing
                Row(
                  mainAxisAlignment: MainAxisAlignment
                      .center, // Center align the elements horizontally
                  children: [
                    Container(
                      width: constraints.maxWidth *
                          0.2, // Set width relative to screen width
                      height: 40, // Set the height
                      margin: const EdgeInsets.only(
                          bottom: 16.0), // Add bottom margin
                      decoration: BoxDecoration(
                        color: const Color(0xFF00BF63), // Set background color
                        borderRadius:
                            BorderRadius.circular(100.0), // Set border radius
                      ),
                      child: TextButton(
                        onPressed: () {}, // Add an empty onPressed function
                        child: const Text(
                          'Send',
                          style: TextStyle(
                            color: Colors.white, // Set text color
                            fontSize: 16, // Set font size
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                        width: 10), // Add horizontal spacing between buttons
                    Container(
                      width: constraints.maxWidth *
                          0.3, // Set width relative to screen width
                      height: 40, // Set the height
                      margin: const EdgeInsets.only(
                          bottom: 16.0), // Add bottom margin
                      decoration: BoxDecoration(
                        color: const Color(0xFF1791C8), // Set background color
                        borderRadius:
                            BorderRadius.circular(100.0), // Set border radius
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const DiscussionForumScreen(), // Navigate to DiscussionForumScreen
                            ),
                          );
                        },
                        child: const Text(
                          'Discuss',
                          style: TextStyle(
                            color: Colors.white, // Set text color
                            fontSize: 16, // Set font size
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16), // Add vertical spacing
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0), // Add horizontal padding
                  child: const Text(
                    'Top companies:',
                    style: TextStyle(
                      color: Colors.black, // Set text color
                      fontSize: 20, // Set font size
                      fontWeight: FontWeight.bold, // Set font weight
                    ),
                    textAlign: TextAlign.left, // Align the text to the left
                  ),
                ),
                const SizedBox(height: 16), // Add vertical spacing
                Row(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceEvenly, // Space the elements evenly
                  children: [
                    Container(
                      width: constraints.maxWidth *
                          0.4, // Set width relative to screen width
                      height: 60, // Set the height
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0), // Add vertical margin
                      padding: const EdgeInsets.all(
                          8.0), // Add padding to the container
                      decoration: BoxDecoration(
                        color: const Color(0xFFFC0D38), // Set background color
                        borderRadius:
                            BorderRadius.circular(8.0), // Set border radius
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/images/2.png', // Ensure the correct path
                          width: constraints.maxWidth *
                              0.2, // Set width relative to screen width
                          height: 41, // Set the height
                          fit: BoxFit
                              .contain, // Contain the image within the container
                        ),
                      ),
                    ),
                    Container(
                      width: constraints.maxWidth *
                          0.45, // Set width relative to screen width
                      height: 60, // Set the height
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0), // Add vertical margin
                      padding: const EdgeInsets.all(
                          8.0), // Add padding to the container
                      decoration: BoxDecoration(
                        color: const Color(0xFF1791C8), // Set background color
                        borderRadius:
                            BorderRadius.circular(8.0), // Set border radius
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/images/3.png', // Ensure the correct path
                          width: constraints.maxWidth *
                              0.25, // Set width relative to screen width
                          height: 44, // Set the height
                          fit: BoxFit
                              .contain, // Contain the image within the container
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16), // Add vertical spacing
                Row(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceEvenly, // Space the elements evenly
                  children: [
                    Container(
                      width: constraints.maxWidth *
                          0.25, // Set width relative to screen width
                      height: 60, // Set the height
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0), // Add vertical margin
                      padding: const EdgeInsets.all(
                          8.0), // Add padding to the container
                      decoration: BoxDecoration(
                        color: const Color(0xFFF8D106), // Set background color
                        borderRadius:
                            BorderRadius.circular(8.0), // Set border radius
                      ),
                      child: const Center(
                        child: Text(
                          'African Parks',
                          style: TextStyle(
                            color: Colors.black, // Set text color
                            fontSize: 12, // Set font size
                            fontWeight: FontWeight.bold, // Set font weight
                          ),
                          textAlign: TextAlign.center, // Center align the text
                        ),
                      ),
                    ),
                    Container(
                      width: constraints.maxWidth *
                          0.35, // Set width relative to screen width
                      height: 60, // Set the height
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0), // Add vertical margin
                      padding: const EdgeInsets.all(
                          8.0), // Add padding to the container
                      decoration: BoxDecoration(
                        color: const Color(0xFFD800DC), // Set background color
                        borderRadius:
                            BorderRadius.circular(8.0), // Set border radius
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment
                            .center, // Center align the elements horizontally
                        children: [
                          Image.asset(
                            'assets/images/4.png', // Ensure the correct path
                            width: 43, // Set the width
                            height: 48, // Set the height
                            fit: BoxFit
                                .contain, // Contain the image within the container
                          ),
                          const SizedBox(width: 4), // Add horizontal spacing
                          const Column(
                            mainAxisAlignment: MainAxisAlignment
                                .center, // Center align the elements vertically
                            crossAxisAlignment: CrossAxisAlignment
                                .start, // Align the elements to the start
                            children: [
                              Text(
                                'WCS',
                                style: TextStyle(
                                  color: Colors.white, // Set text color
                                  fontSize: 12, // Set font size
                                  fontWeight:
                                      FontWeight.bold, // Set font weight
                                ),
                              ),
                              Text(
                                'Rwanda',
                                style: TextStyle(
                                  color: Colors.white, // Set text color
                                  fontSize: 12, // Set font size
                                  fontWeight:
                                      FontWeight.bold, // Set font weight
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: constraints.maxWidth *
                          0.3, // Set width relative to screen width
                      height: 60, // Set the height
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0), // Add vertical margin
                      padding: const EdgeInsets.all(
                          8.0), // Add padding to the container
                      decoration: BoxDecoration(
                        color: const Color(0xFF1791C8), // Set background color
                        borderRadius:
                            BorderRadius.circular(8.0), // Set border radius
                      ),
                      child: const Center(
                        child: Text(
                          'Inspire',
                          style: TextStyle(
                            color: Colors.white, // Set text color
                            fontSize: 12, // Set font size
                            fontWeight: FontWeight.bold, // Set font weight
                          ),
                          textAlign: TextAlign.center, // Center align the text
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
