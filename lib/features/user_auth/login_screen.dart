import 'package:earthwise_app/features/user_auth/firebase_auth_implementation/firebase_auth_services.dart'; // Importing Firebase authentication services
import 'package:earthwise_app/features/user_auth/signup_screen.dart'; // Importing the signup screen
import 'package:earthwise_app/features/screens/forgot_password.dart'; // Importing the forgot password screen
import 'package:earthwise_app/features/widgets/form_container_widget.dart'; // Importing the form container widget
import 'package:firebase_auth/firebase_auth.dart'; // Importing the Firebase Authentication package
import 'package:flutter/material.dart'; // Importing the Flutter material package

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key}); // Constructor for LoginScreen

  @override
  State<LoginScreen> createState() => _LoginScreenState(); // Creating the state for LoginScreen
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuthService _auth = FirebaseAuthService(); // Initializing FirebaseAuthService instance
  final TextEditingController _emailController = TextEditingController(); // Initializing TextEditingController for email
  final TextEditingController _passwordController = TextEditingController(); // Initializing TextEditingController for password

  @override
  void dispose() {
    _emailController.dispose(); // Disposing the email controller
    _passwordController.dispose(); // Disposing the password controller
    super.dispose(); // Calling the super dispose method
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15), // Adding horizontal padding
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Centering the column contents
            children: [
              const Text(
                'Login',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30, // Adding vertical space
              ),
              FormContainerWidget(
                controller: _emailController, // Assigning the email controller
                hintText: "Email", // Setting hint text
                isPasswordField: false, // Indicating this is not a password field
              ),
              const SizedBox(
                height: 20, // Adding vertical space
              ),
              FormContainerWidget(
                controller: _passwordController, // Assigning the password controller
                hintText: "Password", // Setting hint text
                isPasswordField: true, // Indicating this is a password field
              ),
              const SizedBox(
                height: 30, // Adding vertical space
              ),
              GestureDetector(
                onTap: _signIn, // Calling the _signIn method when tapped
                child: Container(
                  width: double.infinity, // Setting container width to full
                  height: 50, // Setting container height
                  decoration: BoxDecoration(
                    color: const Color(0xFF00BF63), // Setting background color
                    borderRadius: BorderRadius.circular(10), // Setting border radius
                  ),
                  child: const Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white, // Setting text color
                        fontWeight: FontWeight.bold, // Setting text weight
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20, // Adding vertical space
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ForgotPassword()), // Navigating to ForgotPassword screen
                  );
                },
                child: const Text(
                  "Forgot Password?",
                  style: TextStyle(
                    color: Colors.blue, // Setting text color
                    fontWeight: FontWeight.bold, // Setting text weight
                  ),
                ),
              ),
              const SizedBox(
                height: 20, // Adding vertical space
              ),
              const Divider(), // Adding a divider
              GestureDetector(
                onTap: _signInWithGoogle, // Calling the _signInWithGoogle method when tapped
                child: Container(
                  width: double.infinity, // Setting container width to full
                  height: 50, // Setting container height
                  decoration: BoxDecoration(
                    color: Colors.white, // Setting background color
                    border: Border.all(color: Colors.grey), // Setting border color
                    borderRadius: BorderRadius.circular(10), // Setting border radius
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center, // Centering row contents
                    children: [
                      Image.asset(
                        'assets/images/google.jpg', // Adding the Google logo asset
                        height: 24.0, // Setting image height
                      ),
                      const SizedBox(width: 8.0), // Adding horizontal space
                      const Text(
                        'Continue with Google',
                        style: TextStyle(
                          color: Colors.black, // Setting text color
                          fontWeight: FontWeight.bold, // Setting text weight
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20, // Adding vertical space
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center, // Centering row contents
                children: [
                  const Text("Don't have an account?"),
                  const SizedBox(
                    width: 5, // Adding horizontal space
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpScreen()), // Navigating to SignUpScreen
                        (route) => false, // Removing all previous routes
                      );
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Color(0xFF00BF63), // Setting text color
                        fontWeight: FontWeight.bold, // Setting text weight
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _signIn() async {
    String email = _emailController.text; // Getting email from the email controller
    String password = _passwordController.text; // Getting password from the password controller

    User? user = await _auth.signInWithEmailAndPassword(email, password); // Signing in with email and password

    if (user != null) {
      print("User is successfully signed in"); // Printing success message
      Navigator.pushNamed(context, "/home"); // Navigating to the home screen
    } else {
      print("Some error occurred"); // Printing error message
    }
  }

  void _signInWithGoogle() async {
    User? user = await _auth.signInWithGoogle(); // Signing in with Google

    if (user != null) {
      print("User is successfully signed in with Google"); // Printing success message
      Navigator.pushNamed(context, "/home"); // Navigating to the home screen
    } else {
      print("Some error occurred with Google Sign-In"); // Printing error message
    }
  }
}
