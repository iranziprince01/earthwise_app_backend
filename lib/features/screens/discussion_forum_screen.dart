import 'package:flutter/material.dart'; // Importing the Flutter material package

void main() {
  runApp(const MaterialApp(
    home: DiscussionForumScreen(),
  )); // Running the app and setting the home screen to DiscussionForumScreen
}

class DiscussionForumScreen extends StatelessWidget {
  const DiscussionForumScreen({Key? key})
      : super(key: key); // Constructor for the DiscussionForumScreen class

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Building the main structure of the screen
      appBar: AppBar(
        backgroundColor: const Color(
            0xFF00BF63), // Setting the background color of the app bar
        automaticallyImplyLeading: false, // Remove the default back arrow
        title: Row(
          mainAxisAlignment: MainAxisAlignment
              .start, // Aligning children at the start of the row
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back,
                  color: Colors.white), // Back arrow icon
              onPressed: () {
                Navigator.of(context)
                    .pop(); // Action to navigate back to the previous screen
              },
            ),
            const SizedBox(
                width:
                    8), // Adding horizontal space between the icon and the text
            const Text(
              'Discussion Forum',
              style: TextStyle(
                color: Colors.white, // Text color
                fontSize: 20, // Text size
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        // Making the body scrollable
        child: Column(
          children: [
            const SizedBox(height: 25), // Adding vertical space
            Center(
              child: Container(
                width: 384, // Container width
                decoration: BoxDecoration(
                  color: const Color(0xFF1791C8), // Container background color
                  borderRadius: BorderRadius.circular(8.0), // Rounded corners
                ),
                padding: const EdgeInsets.all(16.0), // Container padding
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment
                      .start, // Aligning children at the start of the column
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment
                          .spaceBetween, // Spacing between elements
                      children: [
                        const Text(
                          'Effects of Climate Change',
                          style: TextStyle(
                            color: Colors.white, // Text color
                            fontSize: 16, // Text size
                            fontWeight: FontWeight.bold, // Text weight
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {
                            // Add new post action
                          },
                          icon: const Icon(
                            Icons.add,
                            color: Colors.black, // Icon color
                            size: 16, // Adjust icon size to fit the button
                          ),
                          label: const Text(
                            'Add new post',
                            style: TextStyle(
                              color: Colors.black, // Text color
                              fontSize:
                                  12, // Adjust text size to fit the button
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors.white, // Button background color
                            minimumSize: const Size(
                                100, 24), // Adjust size to fit the form
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(8.0), // Rounded corners
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20), // Adding vertical space
                    Center(
                      child: Container(
                        height: 136, // Container height
                        width: 305, // Container width
                        decoration: BoxDecoration(
                          color: Colors.white, // Container background color
                          borderRadius:
                              BorderRadius.circular(8.0), // Rounded corners
                        ),
                        padding:
                            const EdgeInsets.all(16.0), // Container padding
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment
                              .start, // Aligning children at the start of the column
                          children: [
                            Text(
                              'Discussion list',
                              style: TextStyle(
                                color: Color(0xFF00BF63), // Text color
                                fontSize: 16, // Text size
                                fontWeight: FontWeight.bold, // Text weight
                              ),
                            ),
                            SizedBox(height: 10), // Adding vertical space
                            Flexible(
                              child: Text(
                                '1. Latest climate science\n'
                                '2. Sustainable living\n'
                                '3. Climate policy\n', // List of discussion topics
                                style: TextStyle(
                                  color: Color(0xFF00BF63), // Text color
                                  fontSize: 14, // Text size
                                ),
                                overflow: TextOverflow
                                    .ellipsis, // Text overflow handling
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20), // Adding vertical space
                    Center(
                      child: Container(
                        height: 165, // Container height
                        width: 305, // Container width
                        decoration: BoxDecoration(
                          color: Colors.white, // Container background color
                          borderRadius:
                              BorderRadius.circular(8.0), // Rounded corners
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                              8.0), // Rounded corners for the image
                          child: Image.asset(
                            'assets/images/14.png', // Replace with your image asset path
                            fit: BoxFit
                                .cover, // Fit the image within the container
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30), // Adding vertical space
                    const Text(
                      'The forum provides a dedicated space for users to engage in thoughtful conversations about the pressing global issue of climate change.',
                      style: TextStyle(
                        color: Colors.white, // Text color
                        fontSize: 14, // Text size
                      ),
                    ),
                    const SizedBox(height: 20), // Adding vertical space
                    Row(
                      mainAxisAlignment: MainAxisAlignment
                          .spaceAround, // Spacing around elements
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 31, // Container height
                              width: 31, // Container width
                              decoration: BoxDecoration(
                                color:
                                    Colors.white, // Container background color
                                borderRadius: BorderRadius.circular(
                                    100.0), // Rounded corners
                              ),
                              child: Center(
                                child: IconButton(
                                  onPressed: () {
                                    // Like action
                                  },
                                  icon: const Icon(
                                    Icons.thumb_up,
                                    color: Colors.black, // Icon color
                                  ),
                                  iconSize: 20, // Icon size
                                ),
                              ),
                            ),
                            const Text(
                              'Like',
                              style: TextStyle(
                                color: Colors.white, // Text color
                                fontSize: 14, // Text size
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: 31, // Container height
                              width: 31, // Container width
                              decoration: BoxDecoration(
                                color:
                                    Colors.white, // Container background color
                                borderRadius: BorderRadius.circular(
                                    100.0), // Rounded corners
                              ),
                              child: Center(
                                child: IconButton(
                                  onPressed: () {
                                    // Comment action
                                  },
                                  icon: const Icon(
                                    Icons.comment,
                                    color: Colors.black, // Icon color
                                  ),
                                  iconSize: 20, // Icon size
                                ),
                              ),
                            ),
                            const Text(
                              'Comment',
                              style: TextStyle(
                                color: Colors.white, // Text color
                                fontSize: 14, // Text size
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: 31, // Container height
                              width: 31, // Container width
                              decoration: BoxDecoration(
                                color:
                                    Colors.white, // Container background color
                                borderRadius: BorderRadius.circular(
                                    100.0), // Rounded corners
                              ),
                              child: Center(
                                child: IconButton(
                                  onPressed: () {
                                    // Repost action
                                  },
                                  icon: const Icon(
                                    Icons.repeat,
                                    color: Colors.black, // Icon color
                                  ),
                                  iconSize: 20, // Icon size
                                ),
                              ),
                            ),
                            const Text(
                              'Repost',
                              style: TextStyle(
                                color: Colors.white, // Text color
                                fontSize: 14, // Text size
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: 31, // Container height
                              width: 31, // Container width
                              decoration: BoxDecoration(
                                color:
                                    Colors.white, // Container background color
                                borderRadius: BorderRadius.circular(
                                    100.0), // Rounded corners
                              ),
                              child: Center(
                                child: IconButton(
                                  onPressed: () {
                                    // Share action
                                  },
                                  icon: const Icon(
                                    Icons.share,
                                    color: Colors.black, // Icon color
                                  ),
                                  iconSize: 20, // Icon size
                                ),
                              ),
                            ),
                            const Text(
                              'Share',
                              style: TextStyle(
                                color: Colors.white, // Text color
                                fontSize: 14, // Text size
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 30), // Adding vertical space
                    Row(
                      children: [
                        Container(
                          height: 44, // Container height
                          width: 44, // Container width
                          decoration: BoxDecoration(
                            color:
                                Colors.grey[300], // Container background color
                            shape: BoxShape.circle, // Make it circular
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              'assets/images/profile.png', // Replace with your profile image asset path
                              fit: BoxFit
                                  .cover, // Fit the image within the container
                            ),
                          ),
                        ),
                        const SizedBox(width: 10), // Adding horizontal space
                        Expanded(
                          child: Container(
                            height: 72, // Increased height
                            decoration: BoxDecoration(
                              color: Colors.white, // Changed to white
                              borderRadius:
                                  BorderRadius.circular(8.0), // Rounded corners
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0), // Container padding
                            child: const TextField(
                              style: TextStyle(
                                color: Color(0xFF00BF63), // Text color green
                              ),
                              decoration: InputDecoration(
                                hintText: 'Add your comment...', // Hint text
                                hintStyle: TextStyle(
                                  color: Color(0xFF00BF63), // Hint color green
                                ),
                                border: InputBorder.none, // Removing border
                              ),
                              maxLines: null, // Allowing multiple lines
                            ),
                          ),
                        ),
                        const SizedBox(width: 10), // Adding horizontal space
                        Container(
                          height: 36, // Container height
                          width: 62, // Container width
                          decoration: BoxDecoration(
                            color: Colors.white, // Container background color
                            borderRadius:
                                BorderRadius.circular(100.0), // Rounded corners
                          ),
                          child: TextButton(
                            onPressed: () {
                              // Post action
                            },
                            style: TextButton.styleFrom(
                              backgroundColor:
                                  Colors.white, // Button background color
                            ),
                            child: const Text(
                              'Post',
                              style: TextStyle(
                                color: Color(0xFF1791C8), // Text color
                                fontSize: 12, // Text size
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
