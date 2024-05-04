import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'login_screen.dart'; // Import the login screen
import 'create_account_screen.dart'; // Import the create account screen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(), // Display SplashScreen initially
      routes: {
        '/login': (context) => const LoginScreen(), // Route for login screen
        '/createAccount': (context) => const CreateAccountScreen(), // Route for create account screen
      },
    );
  }
}
