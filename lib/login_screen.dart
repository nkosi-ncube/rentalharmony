import 'package:flutter/material.dart';
import 'package:leaseleader/search.dart';
import 'create_account_screen.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  // Dummy credentials
  final String _dummyPhoneNumber = "0699327937";
  final String _dummyPassword = "1990";

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black, // Dark background color
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 50),
            Container(
              height: 400,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Positioned(
                    top: 50,
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF44336), // Red color
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.home,
                        color: Colors.black,
                        size: 60,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Container(
              padding: EdgeInsets.all(20),
              width: screenWidth * 0.6, // Width set to 60% of the screen width
              decoration: BoxDecoration(
                color: Colors.black, // Dark background for the form
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  _buildInputField(
                    label: "NAME",
                    hintText: "John Doe",
                  ),
                  SizedBox(height: 20),
                  _buildInputField(
                    label: "PHONENUMBER",
                    hintText: "123-456-7890",
                    controller: _phoneNumberController,
                  ),
                  SizedBox(height: 20),
                  _buildInputField(
                    label: "PASSWORD",
                    hintText: "********",
                    controller: _passwordController,
                    obscureText: true,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      _login(); // Call login method
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF44336), // Red color
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    child: Text(
                      "Login",
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      // Add functionality for Forgot Password
                    },
                    child: Text(
                      "Forgot Password",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CreateAccountScreen()));
                    },
                    child: Text(
                      "Create an Account",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  // Method to build input fields
  Widget _buildInputField({
    required String label,
    required String hintText,
    TextEditingController? controller,
    bool obscureText = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 5),
        TextField(
          controller: controller,
          obscureText: obscureText,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[800], // Dark gray background for input field
            border: OutlineInputBorder(),
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey[600]),
          ),
        ),
      ],
    );
  }

  // Method to handle login
  void _login() {
    // Check if the provided credentials match the dummy credentials
    if (_phoneNumberController.text.trim() == _dummyPhoneNumber && _passwordController.text.trim() == _dummyPassword) {
      // Navigate to welcome screen if login is successful
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Search()),
      );
    } else {
      // Display error message if credentials are incorrect
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Invalid phone number or password. Please try again.'),
        ),
      );
    }
  }
}
