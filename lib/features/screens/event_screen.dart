import 'package:flutter/material.dart'; // Import the Flutter material package

// Define a stateless widget called EventScreen
class EventScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Override the build method to create the UI
    return Scaffold(
      // Create a Scaffold widget to provide structure
      appBar: AppBar(
        // Create an AppBar at the top of the screen
        backgroundColor:
            Colors.green, // Set the background color of the AppBar to green
        title: const Text(
          // Set the title of the AppBar
          'Event Details', // Text to display in the AppBar
          style: TextStyle(
              color:
                  Colors.white), // Set the color of the AppBar title to white
        ),
      ),
      body: Container(
        // Create a Container widget for the main body
        color: Colors.blue, // Set the background color of the container to blue
        child: Padding(
          // Add padding around the container
          padding:
              const EdgeInsets.all(16.0), // Set padding to 16.0 on all sides
          child: SingleChildScrollView(
            // Allow scrolling for the content
            child: Column(
              // Arrange the child widgets in a vertical column
              crossAxisAlignment: CrossAxisAlignment
                  .start, // Align children to the start of the column
              children: <Widget>[
                const Text(
                  // Add a text widget
                  'Climate Change Workshop', // Text content
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Set text style to bold and black
                  ),
                ),
                const SizedBox(height: 12.0), // Add a vertical space of 12.0
                const Text(
                  // Add another text widget
                  'Date and time: June 15, 2024, 11:00 AM - 3:00 PM', // Text content
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white, // Set text color to white
                  ),
                ),
                const SizedBox(height: 8.0), // Add a vertical space of 8.0
                const Text(
                  // Add another text widget
                  'Location: Green Community Center, KK 127 St, Kigali', // Text content
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white, // Set text color to white
                  ),
                ),
                const SizedBox(height: 20.0), // Add a vertical space of 20.0
                const Text(
                  // Add another text widget
                  'Event Details', // Text content
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Set text style to bold and black
                  ),
                ),
                const SizedBox(height: 8.0), // Add a vertical space of 8.0
                const Text(
                  // Add another text widget
                  'Join us for a hands-on workshop focused on actionable steps you can take to combat climate change. Learn from experts in the field and connect with like-minded individuals passionate about making a difference.', // Text content
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white, // Set text color to white
                  ),
                ),
                const SizedBox(height: 20.0), // Add a vertical space of 20.0
                const Text(
                  // Add another text widget
                  'Agenda', // Text content
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Set text style to bold and black
                  ),
                ),
                const SizedBox(height: 8.0), // Add a vertical space of 8.0
                const Text(
                  // Add another text widget
                  '10:00 AM - 11:00 AM: Introduction and Keynote Address', // Text content
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white, // Set text color to white
                  ),
                ),
                const Text(
                  // Add another text widget
                  '11:00 AM - 12:30 PM: Breakout Sessions', // Text content
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white, // Set text color to white
                  ),
                ),
                const Text(
                  // Add another text widget
                  '12:30 PM - 1:30 PM: Lunch Break', // Text content
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white, // Set text color to white
                  ),
                ),
                const Text(
                  // Add another text widget
                  '1:30 PM - 3:00 PM: Hands-on Activities and Workshops', // Text content
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white, // Set text color to white
                  ),
                ),
                const Text(
                  // Add another text widget
                  '3:00 PM - 3:55 PM: Q&A and Networking', // Text content
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white, // Set text color to white
                  ),
                ),
                const Text(
                  // Add another text widget
                  '3:55 - 4:00 PM: Closing Remark', // Text content
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white, // Set text color to white
                  ),
                ),
                const SizedBox(height: 20.0), // Add a vertical space of 20.0
                const Text(
                  // Add another text widget
                  'Speakers/Hosts', // Text content
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Set text style to bold and black
                  ),
                ),
                const SizedBox(height: 8.0), // Add a vertical space of 8.0
                const Text(
                  // Add another text widget
                  'Dr. Jane Smith - Environmental Scientist', // Text content
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white, // Set text color to white
                  ),
                ),
                const Text(
                  // Add another text widget
                  'Dr. John Doe - Climate Activist', // Text content
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white, // Set text color to white
                  ),
                ),
                const SizedBox(height: 20.0), // Add a vertical space of 20.0
                const Text(
                  // Add another text widget
                  'Follow us:', // Text content
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Set text style to bold and black
                  ),
                ),
                const SizedBox(height: 8.0), // Add a vertical space of 8.0
                const Text(
                  // Add another text widget
                  '@earthwise', // Text content
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white, // Set text color to white
                  ),
                ),
                const SizedBox(height: 20.0), // Add a vertical space of 20.0
                Center(
                  // Center the child widget
                  child: ElevatedButton(
                    // Add a button widget
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.red, // Set button background color to red
                    ),
                    onPressed: () {
                      // Add an onPressed callback
                      // Add your registration logic here
                    },
                    child: const Text(
                      // Set button text
                      'Register Now', // Text content
                      style: TextStyle(
                        color: Colors.white, // Set button text color to white
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0), // Add a vertical space of 20.0
                const Text(
                  // Add another text widget
                  'Additional Information', // Text content
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Set text style to bold and black
                  ),
                ),
                const SizedBox(height: 8.0), // Add a vertical space of 8.0
                const Text(
                  // Add another text widget
                  'Email us: events@earthwise.com', // Text content
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white, // Set text color to white
                  ),
                ),
                const SizedBox(height: 20.0), // Add a vertical space of 20.0
                Center(
                  // Center the child widget
                  child: ElevatedButton(
                    // Add a button widget
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.red, // Set button background color to red
                    ),
                    onPressed: () {
                      // Add an onPressed callback
                      Navigator.pop(
                          context); // Pop the current screen from the navigation stack
                    },
                    child: const Text(
                      // Set button text
                      'Back', // Text content
                      style: TextStyle(
                        color: Colors.white, // Set button text color to white
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
