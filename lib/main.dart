import 'package:earthwise_app/features/screens/cover_screen.dart'; // Import the CoverScreen widget
import 'package:earthwise_app/features/screens/home_screen.dart'; // Import the HomeScreen widget
import 'package:earthwise_app/features/user_auth/login_screen.dart'; // Import the LoginScreen widget
import 'package:earthwise_app/features/user_auth/signup_screen.dart'; // Import the SignUpScreen widget
import 'package:firebase_core/firebase_core.dart'; // Import the Firebase core package
import 'package:flutter/foundation.dart'; // Import the Flutter foundation package
import 'package:flutter/material.dart'; // Import the Flutter material package

Future main() async { // Define the main function as asynchronous
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter widgets are initialized

  if (kIsWeb) { // Check if the app is running on the web
    await Firebase.initializeApp( // Initialize Firebase for web with specific options
        options: const FirebaseOptions(
      apiKey: "AIzaSyAiUz0cgCgQZ6S5MK0F6PfdvTLb6jA6ss0", // Web API key
      appId: "1:871595644696:web:e9556d5e88acdab358706d", // Web app ID
      messagingSenderId: "871595644696", // Web messaging sender ID
      projectId: "earth-wise-app", // Web project ID
      // Your web Firebase config options
    ));
  } else {
    await Firebase.initializeApp(); // Initialize Firebase for non-web platforms
  }
  runApp(const MyApp()); // Run the MyApp widget
}

class MyApp extends StatelessWidget { // Define a stateless widget called MyApp
  const MyApp({super.key}); // Constructor with key

  @override
  Widget build(BuildContext context) { // Override the build method
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Disable the debug banner
      title: 'EarthWise', // Set the title of the app
      routes: { // Define routes for navigation
        '/': (context) => const CoverScreen( // Set CoverScreen as the default route
              // Here, you can decide whether to show the LoginPage or HomePage based on user authentication
              child: LoginScreen(), // Child widget for CoverScreen
            ),
        '/login': (context) => const LoginScreen(), // Route for the login screen
        '/signUp': (context) => const SignUpScreen(), // Route for the sign-up screen
        '/home': (context) => const HomeScreen(), // Route for the home screen
      },
    );
  }
}
