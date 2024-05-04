import 'package:flutter/material.dart';
// Import the login screen

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Use Future.delayed to wait for 3 seconds
    Future.delayed(const Duration(seconds: 10), () {
      // After 3 seconds, navigate to LoginScreen
      Navigator.pushReplacementNamed(context, '/login');
    });

    return Scaffold(
      backgroundColor: Colors.deepPurple, // Set background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Use a rich text widget for better styling flexibility
            RichText(
              text: const TextSpan(
                text: 'Welcome to ',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Set text color
                ),
                // ignore: prefer_const_literals_to_create_immutables
                children: <TextSpan>[
                  TextSpan(
                    text: 'RentalHarmony',
                    style: TextStyle(
                      color: Colors.yellow, // Set different color for app name
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Add a CircularProgressIndicator with a specific color
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
