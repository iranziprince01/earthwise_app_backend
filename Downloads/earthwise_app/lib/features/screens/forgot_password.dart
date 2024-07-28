import 'package:firebase_auth/firebase_auth.dart'; // Importing Firebase Authentication package
import 'package:flutter/material.dart'; // Importing Flutter material package
import '/features/user_auth/signup_screen.dart'; // Importing the SignUpScreen from the specified path

class ForgotPassword extends StatefulWidget {
  // Defining the ForgotPassword widget as a stateful widget
  const ForgotPassword(
      {super.key}); // Constructor for ForgotPassword with a super key

  @override
  State<ForgotPassword> createState() =>
      _ForgotPasswordState(); // Creating state for the ForgotPassword widget
}

class _ForgotPasswordState extends State<ForgotPassword> {
  // State class for ForgotPassword
  final TextEditingController _emailController =
      TextEditingController(); // Controller for the email input field
  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(); // Key to identify the form

  Future<void> _resetPassword() async {
    // Asynchronous function to reset the password
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
          email: _emailController.text
              .trim()); // Sending password reset email using Firebase Auth
      if (mounted) {
        // Checking if the widget is still mounted
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            "Password Reset Email has been sent!", // Message to show on successful password reset email
            style: TextStyle(fontSize: 20.0),
          ),
        ));
      }
    } on FirebaseAuthException catch (e) {
      // Catching FirebaseAuth exceptions
      if (mounted) {
        // Checking if the widget is still mounted
        if (e.code == "user-not-found") {
          // Checking if the error code is "user-not-found"
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
              "No user found for that email.", // Message to show if no user is found
              style: TextStyle(fontSize: 20.0),
            ),
          ));
        }
      }
    } catch (e) {
      // Catching any other exceptions
      if (mounted) {
        // Checking if the widget is still mounted
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            "An error occurred: ${e.toString()}", // Message to show if an error occurs
            style: const TextStyle(fontSize: 20.0),
          ),
        ));
      }
    }
  }

  void _navigateToSignUp() {
    // Function to navigate to the sign-up screen
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              const SignUpScreen()), // Navigating to SignUpScreen
    );
  }

  @override
  Widget build(BuildContext context) {
    // Building the ForgotPassword widget
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forgot Password"), // Title for the app bar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding for the body
        child: Column(
          children: [
            const SizedBox(height: 70.0), // Adding vertical space
            const Text(
              "Password Recovery", // Title text
              style: TextStyle(
                color: Colors.black,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0), // Adding vertical space
            const Text(
              "Enter your email", // Subtitle text
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: Form(
                key: _formKey, // Associating the form key with this form
                child: ListView(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0), // Padding for the ListView
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0), // Padding for the container
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black54,
                            width: 2.0), // Border for the container
                        borderRadius: BorderRadius.circular(
                            30), // Rounded corners for the container
                      ),
                      child: TextFormField(
                        controller:
                            _emailController, // Associating the email controller with this TextFormField
                        style:
                            const TextStyle(color: Colors.black), // Text style
                        decoration: const InputDecoration(
                          hintText: "Email", // Hint text
                          hintStyle: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black54), // Hint text style
                          prefixIcon: Icon(Icons.person,
                              color: Colors.black54, size: 30.0), // Prefix icon
                          border: InputBorder.none, // No border
                        ),
                        validator: (value) {
                          // Validator for the TextFormField
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email'; // Error message if the input is empty
                          }
                          return null; // No error if the input is valid
                        },
                      ),
                    ),
                    const SizedBox(height: 40.0), // Adding vertical space
                    GestureDetector(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          // Checking if the form is valid
                          _resetPassword(); // Calling the reset password function
                        }
                      },
                      child: Container(
                        width: 140, // Width of the container
                        padding: const EdgeInsets.all(
                            10), // Padding for the container
                        decoration: BoxDecoration(
                          color: Colors.black, // Background color
                          borderRadius:
                              BorderRadius.circular(10), // Rounded corners
                        ),
                        child: const Center(
                          child: Text(
                            "Send Email", // Text for the button
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50.0), // Adding vertical space
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.center, // Centering the row
                      children: [
                        const Text(
                          "Don't have an account?", // Text
                          style: TextStyle(fontSize: 18.0, color: Colors.black),
                        ),
                        const SizedBox(width: 5.0), // Adding horizontal space
                        GestureDetector(
                          onTap:
                              _navigateToSignUp, // Navigating to the sign-up screen
                          child: const Text(
                            "Create", // Text for the sign-up link
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500,
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
