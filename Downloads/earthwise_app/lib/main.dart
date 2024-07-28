import 'package:earthwise_app/features/screens/cover_screen.dart';
import 'package:earthwise_app/features/screens/home_screen.dart';
import 'package:earthwise_app/features/user_auth/login_screen.dart';
import 'package:earthwise_app/features/user_auth/signup_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
      apiKey: "AIzaSyAiUz0cgCgQZ6S5MK0F6PfdvTLb6jA6ss0",
      appId: "1:871595644696:web:e9556d5e88acdab358706d",
      messagingSenderId: "871595644696",
      projectId: "earth-wise-app",
      // Your web Firebase config options
    ));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EarthWise',
      routes: {
        '/': (context) => const CoverScreen(
              // Here, you can decide whether to show the LoginPage or HomePage based on user authentication
              child: LoginScreen(),
            ),
        '/login': (context) => const LoginScreen(),
        '/signUp': (context) => const SignUpScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
