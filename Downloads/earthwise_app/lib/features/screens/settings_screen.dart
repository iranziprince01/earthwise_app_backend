import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Settings Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SettingsScreen(),
    );
  }
}

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          SettingsSection(
            title: 'Notifications',
            tiles: [
              SwitchListTile(
                title: const Text('Enable/Disable'),
                value: _notificationsEnabled,
                onChanged: (value) {
                  setState(() {
                    _notificationsEnabled = value;
                  });
                },
              ),
            ],
          ),
          SettingsSection(
            title: 'Privacy',
            tiles: [
              const ListTile(
                leading: Icon(Icons.lock),
                title: Text('Account privacy'),
              ),
              const ListTile(
                leading: Icon(Icons.data_usage),
                title: Text('Data sharing'),
              ),
              const ListTile(
                leading: Icon(Icons.location_on),
                title: Text('Location and services'),
              ),
            ],
          ),
          SettingsSection(
            title: 'Feedback and support',
            tiles: [
              const ListTile(
                leading: Icon(Icons.report),
                title: Text('Report issues'),
              ),
              const ListTile(
                leading: Icon(Icons.support),
                title: Text('Ask support/help'),
              ),
              const ListTile(
                leading: Icon(Icons.feedback),
                title: Text('Provide feedback'),
              ),
            ],
          ),
          SettingsSection(
            title: 'General settings',
            tiles: [
              const ListTile(
                leading: Icon(Icons.language),
                title: Text('Change Language'),
              ),
              const ListTile(
                leading: Icon(Icons.format_paint),
                title: Text('Theme'),
              ),
              const ListTile(
                leading: Icon(Icons.visibility),
                title: Text('Appearance'),
              ),
              const ListTile(
                leading: Icon(Icons.accessibility),
                title: Text('Accessibility'),
              ),
              const ListTile(
                leading: Icon(Icons.settings),
                title: Text('Preferences'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SettingsSection extends StatelessWidget {
  final String title;
  final List<Widget> tiles;

  SettingsSection({required this.title, required this.tiles});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ...tiles,
        const Divider(),
      ],
    );
  }
}
