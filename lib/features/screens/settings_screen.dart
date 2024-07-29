import 'package:flutter/material.dart'; // Importing the Flutter material package

void main() {
  runApp(MyApp()); // Running the MyApp widget
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Settings Screen', // Title of the application
      theme: ThemeData(
        primarySwatch: Colors.blue, // Setting the primary color theme
      ),
      home: SettingsScreen(), // Setting the home screen to SettingsScreen
    );
  }
}

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState(); // Creating state for SettingsScreen
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = false; // Variable to track notification settings

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'), // Title of the app bar
      ),
      body: ListView(
        children: [
          SettingsSection(
            title: 'Notifications', // Title for the notifications section
            tiles: [
              SwitchListTile(
                title: const Text('Enable/Disable'), // Title for the switch
                value: _notificationsEnabled, // Current value of the switch
                onChanged: (value) {
                  setState(() {
                    _notificationsEnabled = value; // Updating the switch value
                  });
                },
              ),
            ],
          ),
          SettingsSection(
            title: 'Privacy', // Title for the privacy section
            tiles: [
              const ListTile(
                leading: Icon(Icons.lock), // Leading icon for account privacy
                title: Text('Account privacy'), // Title for account privacy
              ),
              const ListTile(
                leading: Icon(Icons.data_usage), // Leading icon for data sharing
                title: Text('Data sharing'), // Title for data sharing
              ),
              const ListTile(
                leading: Icon(Icons.location_on), // Leading icon for location services
                title: Text('Location and services'), // Title for location services
              ),
            ],
          ),
          SettingsSection(
            title: 'Feedback and support', // Title for feedback and support section
            tiles: [
              const ListTile(
                leading: Icon(Icons.report), // Leading icon for report issues
                title: Text('Report issues'), // Title for report issues
              ),
              const ListTile(
                leading: Icon(Icons.support), // Leading icon for support
                title: Text('Ask support/help'), // Title for support
              ),
              const ListTile(
                leading: Icon(Icons.feedback), // Leading icon for feedback
                title: Text('Provide feedback'), // Title for feedback
              ),
            ],
          ),
          SettingsSection(
            title: 'General settings', // Title for general settings section
            tiles: [
              const ListTile(
                leading: Icon(Icons.language), // Leading icon for language settings
                title: Text('Change Language'), // Title for language settings
              ),
              const ListTile(
                leading: Icon(Icons.format_paint), // Leading icon for theme settings
                title: Text('Theme'), // Title for theme settings
              ),
              const ListTile(
                leading: Icon(Icons.visibility), // Leading icon for appearance settings
                title: Text('Appearance'), // Title for appearance settings
              ),
              const ListTile(
                leading: Icon(Icons.accessibility), // Leading icon for accessibility settings
                title: Text('Accessibility'), // Title for accessibility settings
              ),
              const ListTile(
                leading: Icon(Icons.settings), // Leading icon for preferences
                title: Text('Preferences'), // Title for preferences
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SettingsSection extends StatelessWidget {
  final String title; // Title for the section
  final List<Widget> tiles; // List of tiles for the section

  SettingsSection({required this.title, required this.tiles}); // Constructor for SettingsSection

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0), // Padding for the section title
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18, // Font size for the section title
              fontWeight: FontWeight.bold, // Font weight for the section title
            ),
          ),
        ),
        ...tiles, // Spread operator to include all tiles
        const Divider(), // Divider after the section
      ],
    );
  }
}
