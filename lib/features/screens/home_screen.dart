import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Authentication package
import 'package:flutter/material.dart'; // Import Flutter material package
import '/features/screens/tracker_screen.dart'; // Import TrackerScreen
import '/features/screens/community_screen.dart'; // Import CommunityScreen
import '/features/screens/learning_modules_screen.dart'; // Import LearningModulesScreen
import '/features/screens/profile_screen.dart'; // Import ProfileScreen
import '/features/screens/event_screen.dart'; // Import EventScreen
import '/features/screens/ar_experience_screen.dart'; // Import ARExperienceScreen
import '/features/screens/ar_visualization_screen.dart'; // Import ARVisualizationsScreen

class HomeScreen extends StatefulWidget {
  // Define HomeScreen as a stateful widget
  const HomeScreen({super.key}); // Constructor for HomeScreen

  @override
  State<HomeScreen> createState() =>
      _HomeScreenState(); // Create state for HomeScreen
}

class _HomeScreenState extends State<HomeScreen> {
  // Define state for HomeScreen
  int _selectedIndex =
      0; // Index to keep track of the selected bottom navigation item

  static final List<Widget> _widgetOptions = <Widget>[
    // List of widgets for different screens
    HomeScreenContent(), // HomeScreen content
    TrackerScreen(), // TrackerScreen
    CommunityScreen(), // CommunityScreen
    LearningModulesScreen(), // LearningModulesScreen
    ProfileScreen(), // ProfileScreen
  ];

  void _onItemTapped(int index) {
    // Function to handle bottom navigation item taps
    setState(() {
      _selectedIndex =
          index; // Update selected index when a bottom navigation item is tapped
    });
  }

  @override
  Widget build(BuildContext context) {
    // Build method for the widget tree
    return Scaffold(
      // Scaffold widget for the basic material design visual layout
      appBar: AppBar(
        // App bar at the top of the screen
        title: const Text(
          // Title of the app bar
          'Home', // Title text
          style: TextStyle(
            fontWeight: FontWeight.bold, // Bold font weight for the title
            color: Colors.white, // White color for the title text
          ),
        ),
        backgroundColor:
            const Color(0xFF00BF63), // Background color of the app bar
        actions: [
          IconButton(
            // Logout icon button
            icon: const Icon(Icons.logout), // Icon for the button
            onPressed: () {
              // Function to handle button press
              FirebaseAuth.instance
                  .signOut(); // Sign out from Firebase Authentication
              Navigator.pushNamed(
                  context, "/login"); // Navigate to login screen
            },
          ),
        ],
      ),
      body: _widgetOptions
          .elementAt(_selectedIndex), // Display the selected widget
      bottomNavigationBar: BottomNavigationBar(
        // Bottom navigation bar
        items: const [
          BottomNavigationBarItem(
            // Home navigation item
            icon: Icon(Icons.home), // Home icon
            label: 'Home', // Home label
          ),
          BottomNavigationBarItem(
            // Tracker navigation item
            icon: Icon(Icons.track_changes), // Tracker icon
            label: 'Tracker', // Tracker label
          ),
          BottomNavigationBarItem(
            // Community navigation item
            icon: Icon(Icons.people), // Community icon
            label: 'Community', // Community label
          ),
          BottomNavigationBarItem(
            // Learn navigation item
            icon: Icon(Icons.school), // Learn icon
            label: 'Learn', // Learn label
          ),
          BottomNavigationBarItem(
            // Profile navigation item
            icon: Icon(Icons.person), // Profile icon
            label: 'Profile', // Profile label
          ),
        ],
        currentIndex:
            _selectedIndex, // Set the current index of the bottom navigation bar
        selectedItemColor:
            const Color(0xFF00BF63), // Color for the selected item
        unselectedItemColor: Colors.grey, // Color for the unselected items
        onTap: _onItemTapped, // Handle tap on bottom navigation items
        showUnselectedLabels: true, // Show labels for unselected items
      ),
    );
  }
}

class HomeScreenContent extends StatelessWidget {
  // Define HomeScreenContent as a stateless widget
  @override
  Widget build(BuildContext context) {
    // Build method for the widget tree
    return Padding(
      // Padding around the content
      padding: const EdgeInsets.all(16.0), // Padding value
      child: SingleChildScrollView(
        // Scrollable content
        child: Column(
          // Column layout for children widgets
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align children to the start
          children: [
            const Text(
              // Greeting text
              'Hello there!', // Text content
              style: TextStyle(
                fontSize: 36, // Font size
                fontWeight: FontWeight.bold, // Bold font weight
                color: Color(0xFF00BF63), // Green color
              ),
            ),
            const SizedBox(height: 20), // Vertical spacing
            Container(
              // Container for description text
              padding:
                  const EdgeInsets.all(16.0), // Padding inside the container
              decoration: BoxDecoration(
                color: const Color(0xFF1791C8), // Background color
                borderRadius: BorderRadius.circular(10), // Rounded corners
              ),
              child: const Text(
                // Description text
                'Earthwise app is a revolutionary tool designed to empower individuals and communities in combating climate change and preserving biodiversity.', // Text content
                style: TextStyle(
                  fontSize: 18, // Font size
                  color: Colors.white, // White color
                ),
              ),
            ),
            const SizedBox(height: 20), // Vertical spacing
            _buildFeatureCard(
              // Feature card
              context,
              'Track your carbon footprint.', // Feature card text
              Icons.track_changes, // Feature card icon
              () {
                Navigator.push(
                  // Navigate to TrackerScreen
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          TrackerScreen()), // Navigation route
                );
              },
            ),
            const SizedBox(height: 20), // Vertical spacing
            _buildFeatureCard(
              // Feature card
              context,
              'Join local events.', // Feature card text
              Icons.event, // Feature card icon
              () {
                Navigator.push(
                  // Navigate to EventScreen
                  context,
                  MaterialPageRoute(
                      builder: (context) => EventScreen()), // Navigation route
                );
              },
            ),
            const SizedBox(height: 20), // Vertical spacing
            _buildFeatureCard(
              // Feature card
              context,
              'Explore climate change impacts.', // Feature card text
              Icons.explore, // Feature card icon
              () {
                Navigator.push(
                  // Navigate to ARVisualizationsScreen
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ARVisualizationsScreen()), // Navigation route
                );
              },
            ),
            const SizedBox(height: 20), // Vertical spacing
            const Text(
              // Listings section title
              'Listings', // Title text
              style: TextStyle(
                fontSize: 24, // Font size
                fontWeight: FontWeight.bold, // Bold font weight
                color: Color(0xFF00BF63), // Green color
              ),
            ),
            const SizedBox(height: 10), // Vertical spacing
            _buildListingItem(
              // Listing item
              context,
              'Local Clean-Up Event', // Listing item title
              'Join us for a community clean-up event this weekend.', // Listing item description
            ),
            const SizedBox(height: 10), // Vertical spacing
            _buildListingItem(
              // Listing item
              context,
              'Climate Change Webinar', // Listing item title
              'Attend an online webinar about the impacts of climate change.', // Listing item description
            ),
            const SizedBox(height: 10), // Vertical spacing
            _buildListingItem(
              // Listing item
              context,
              'Sustainability Workshop', // Listing item title
              'Participate in our workshop on sustainable living practices.', // Listing item description
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCard(
      BuildContext context, String text, IconData icon, VoidCallback onTap) {
    // Function to build a feature card
    return GestureDetector(
      // Detect taps on the feature card
      onTap: onTap, // Handle tap
      child: Container(
        // Container for the feature card
        decoration: BoxDecoration(
          color: Colors.white, // Background color
          borderRadius: BorderRadius.circular(10), // Rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3), // Shadow color
              spreadRadius: 2, // Spread radius
              blurRadius: 5, // Blur radius
              offset: const Offset(0, 3), // Offset
            ),
          ],
        ),
        padding: const EdgeInsets.all(20), // Padding inside the container
        child: Row(
          // Row layout for icon and text
          children: [
            Icon(
              // Icon for the feature card
              icon, // Icon data
              size: 36, // Icon size
              color: const Color(0xFF00BF63), // Green color
            ),
            const SizedBox(width: 20), // Horizontal spacing
            Expanded(
              // Expand the text to fill available space
              child: Text(
                // Text for the feature card
                text, // Text content
                style: const TextStyle(
                  fontSize: 18, // Font size
                  color: Colors.black, // Black color
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListingItem(
      BuildContext context, String title, String description) {
    // Function to build a listing item
    return Container(
      // Container for the listing item
      decoration: BoxDecoration(
        color: Colors.white, // Background color
        borderRadius: BorderRadius.circular(10), // Rounded corners
        border: Border.all(color: const Color(0xFF00BF63)), // Border color
      ),
      padding: const EdgeInsets.all(20), // Padding inside the container
      child: Column(
        // Column layout for title and description
        crossAxisAlignment:
            CrossAxisAlignment.start, // Align children to the start
        children: [
          Text(
            // Listing item title
            title, // Title text
            style: const TextStyle(
              fontSize: 18, // Font size
              fontWeight: FontWeight.bold, // Bold font weight
              color: Colors.black, // Black color
            ),
          ),
          const SizedBox(height: 5), // Vertical spacing
          Text(
            // Listing item description
            description, // Description text
            style: const TextStyle(
              fontSize: 16, // Font size
              color: Colors.grey, // Grey color
            ),
          ),
        ],
      ),
    );
  }
}
