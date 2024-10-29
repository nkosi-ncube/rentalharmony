import 'package:flutter/material.dart';
// Import the login screen

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Use Future.delayed to wait for 3 seconds
    Future.delayed(const Duration(seconds: 5), () {
      // After 3 seconds, navigate to LoginScreen
      Navigator.pushReplacementNamed(context, '/login');
    });

    return Scaffold(
      backgroundColor: const Color(0xFF212121), // Set background color
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
                children: <TextSpan>[
                  TextSpan(
                    text: 'RentalHarmony',
                    style: TextStyle(
                      color: Color(0xFFF44336), // Set different color for app name
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
