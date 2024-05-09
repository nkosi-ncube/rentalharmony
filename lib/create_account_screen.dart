import 'package:flutter/material.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  String _selectedAccountType = 'Landlord'; // Default account type
  bool _isTenant = false; // Variable to track if user is a tenant
  bool _passwordVisible = false;
  // ignore: unused_field
  final bool _confirmPasswordVisible = false;

  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _surnameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _idNumberController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.black, // Black background
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 50),
              Container(
                height: 400,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/background.jpg'),
                    fit: BoxFit.cover,
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
                        decoration: const BoxDecoration(
                          color: Color(0xFFF44336), // Red color
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.home,
                          color: Colors.black,
                          size: 60,
                        ),
                      ),
                    ),
                    const Positioned(
                      bottom: 20,
                      child: Text(
                        "Create Account",
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
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(20),
                width: screenWidth * 0.6, // Width set to 60% of the screen width
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7), // Dark background for the form with opacity
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    _buildInputField(label: "Full Name", controller: _fullNameController),
                    const SizedBox(height: 20),
                    _buildInputField(label: "Surname", controller: _surnameController),
                    const SizedBox(height: 20),
                    _buildInputField(label: "Email", controller: _emailController),
                    const SizedBox(height: 20),
                    _buildInputField(label: "ID/Passport/Asylum Number", controller: _idNumberController),
                    const SizedBox(height: 20),
                    DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "I am a",
                        hintStyle: TextStyle(color: Colors.white70),
                      ),
                      value: _selectedAccountType,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedAccountType = newValue!;
                          _isTenant = newValue == 'Tenant';
                        });
                      },
                      items: <String>['Landlord', 'Tenant'].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    ElevatedButton(
                      onPressed: _isTenant ? null : () {
                        // Upload lease PDF logic
                      },
                      child: const Text('Upload Lease PDF'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Take live picture logic
                      },
                      child: const Text('Take Picture'),
                    ),
                    const SizedBox(height: 20),
                    _buildPasswordField(label: "Password", controller: _passwordController),
                    const SizedBox(height: 20),
                    _buildPasswordField(label: "Confirm Password", controller: _confirmPasswordController),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // Create account logic
                },
                child: const Text(
                  "Create Account",
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  // Navigate to login screen
                  Navigator.pop(context);
                },
                child: const Text(
                  "Already have an account? Login",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  // Method to build input fields
  Widget _buildInputField({required String label, required TextEditingController controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 5),
        TextField(
          controller: controller,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[800], // Dark gray background for input field
            border: const OutlineInputBorder(),
            hintStyle: TextStyle(color: Colors.grey[600]),
          ),
        ),
      ],
    );
  }

  // Method to build password input fields
  Widget _buildPasswordField({required String label, required TextEditingController controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 5),
        TextField(
          controller: controller,
          obscureText: !_passwordVisible,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[800], // Dark gray background for input field
            border: const OutlineInputBorder(),
            hintStyle: TextStyle(color: Colors.grey[600]),
            suffixIcon: IconButton(
              icon: Icon(
                _passwordVisible ? Icons.visibility : Icons.visibility_off,
                color: Theme.of(context).primaryColorDark,
              ),
              onPressed: () {
                setState(() {
                  _passwordVisible = !_passwordVisible;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
