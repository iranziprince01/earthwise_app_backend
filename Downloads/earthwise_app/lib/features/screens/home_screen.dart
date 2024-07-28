import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '/features/screens/tracker_screen.dart';
import '/features/screens/community_screen.dart';
import '/features/screens/learning_modules_screen.dart';
import '/features/screens/profile_screen.dart';
import '/features/screens/event_screen.dart';
import '/features/screens/ar_experience_screen.dart';
import '/features/screens/ar_visualization_screen.dart'; // Add the import for ARVisualizationsScreen

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    HomeScreenContent(),
    TrackerScreen(),
    CommunityScreen(),
    LearningModulesScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF00BF63),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushNamed(context, "/login");
            },
          ),
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.track_changes),
            label: 'Tracker',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Community',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Learn',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF00BF63),
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        showUnselectedLabels: true,
      ),
    );
  }
}

class HomeScreenContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Hello there!',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Color(0xFF00BF63),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: const Color(0xFF1791C8),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                'Earthwise app is a revolutionary tool designed to empower individuals and communities in combating climate change and preserving biodiversity.',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildFeatureCard(
              context,
              'Track your carbon footprint.',
              Icons.track_changes,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TrackerScreen()),
                );
              },
            ),
            const SizedBox(height: 20),
            _buildFeatureCard(
              context,
              'Join local events.',
              Icons.event,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EventScreen()),
                );
              },
            ),
            const SizedBox(height: 20),
            _buildFeatureCard(
              context,
              'Explore climate change impacts.',
              Icons.explore,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ARVisualizationsScreen()), // Updated navigation to ARVisualizationsScreen
                );
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'Listings',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF00BF63),
              ),
            ),
            const SizedBox(height: 10),
            _buildListingItem(
              context,
              'Local Clean-Up Event',
              'Join us for a community clean-up event this weekend.',
            ),
            const SizedBox(height: 10),
            _buildListingItem(
              context,
              'Climate Change Webinar',
              'Attend an online webinar about the impacts of climate change.',
            ),
            const SizedBox(height: 10),
            _buildListingItem(
              context,
              'Sustainability Workshop',
              'Participate in our workshop on sustainable living practices.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCard(
      BuildContext context, String text, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Icon(
              icon,
              size: 36,
              color: const Color(0xFF00BF63),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
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
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFF00BF63)),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            description,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
