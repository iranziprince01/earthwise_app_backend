import 'package:earthwise_app/features/user_auth/firebase_auth_implementation/firebase_auth_services.dart'; // Importing Firebase authentication services
import 'package:earthwise_app/features/user_auth/login_screen.dart'; // Importing the login screen
import 'package:earthwise_app/features/widgets/form_container_widget.dart'; // Importing the form container widget
import 'package:firebase_auth/firebase_auth.dart'; // Importing the Firebase Authentication package
import 'package:flutter/material.dart'; // Importing the Flutter material package
import 'package:google_sign_in_web/google_sign_in_web.dart'; // Importing the Google Sign-In for web

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key}); // Constructor for SignUpScreen

  @override
  State<SignUpScreen> createState() => _SignUpScreenState(); // Creating the state for SignUpScreen
}

class _SignUpScreenState extends State<SignUpScreen> {
  final FirebaseAuthService _auth = FirebaseAuthService(); // Initializing FirebaseAuthService instance

  final TextEditingController _nameController = TextEditingController(); // Initializing TextEditingController for name
  final TextEditingController _usernameController = TextEditingController(); // Initializing TextEditingController for username
  final TextEditingController _emailController = TextEditingController(); // Initializing TextEditingController for email
  final TextEditingController _passwordController = TextEditingController(); // Initializing TextEditingController for password

  @override
  void dispose() {
    _nameController.dispose(); // Disposing the name controller
    _usernameController.dispose(); // Disposing the username controller
    _emailController.dispose(); // Disposing the email controller
    _passwordController.dispose(); // Disposing the password controller
    super.dispose(); // Calling the super dispose method
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Signup',
          style: TextStyle(
            fontSize: 20, // Setting font size
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
                'Signup',
                style: TextStyle(
                  fontSize: 30, // Setting font size
                  fontWeight: FontWeight.bold, // Setting font weight
                ),
              ),
              const SizedBox(
                height: 30, // Adding vertical space
              ),
              FormContainerWidget(
                controller: _nameController, // Assigning the name controller
                hintText: "Name", // Setting hint text
                isPasswordField: false, // Indicating this is not a password field
              ),
              const SizedBox(
                height: 20, // Adding vertical space
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
                controller: _usernameController, // Assigning the username controller
                hintText: "Username", // Setting hint text
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
                onTap: _signUp, // Calling the _signUp method when tapped
                child: Container(
                  width: double.infinity, // Setting container width to full
                  height: 50, // Setting container height
                  decoration: BoxDecoration(
                    color: const Color(0xFF00BF63), // Setting background color
                    borderRadius: BorderRadius.circular(10), // Setting border radius
                  ),
                  child: const Center(
                    child: Text(
                      'Signup',
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center, // Centering row contents
                children: [
                  const Text("Already have an account?"), // Displaying a text
                  const SizedBox(
                    width: 5, // Adding horizontal space
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()), // Navigating to LoginScreen
                        (route) => false, // Removing all previous routes
                      );
                    },
                    child: const Text(
                      "Login",
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

  void _signUp() async {
    String name = _nameController.text; // Getting name from the name controller
    String username = _usernameController.text; // Getting username from the username controller
    String email = _emailController.text; // Getting email from the email controller
    String password = _passwordController.text; // Getting password from the password controller

    User? user = await _auth.signUpWithEmailAndPassword(email, password); // Signing up with email and password

    if (user != null) {
      print("User is successfully created"); // Printing success message
      Navigator.pushNamed(context, "/home"); // Navigating to the home screen
    } else {
      print("Some error happened"); // Printing error message
    }
  }
}
