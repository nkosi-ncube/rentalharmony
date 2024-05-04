import 'package:flutter/material.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  String _selectedAccountType = 'Landlord'; // Default account type
  bool _isTenant = false; // Variable to track if user is a tenant
  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;

  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _surnameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _idNumberController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/background.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: 30,
                      width: 80,
                      height: 200,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/light-1.png'),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 140,
                      width: 80,
                      height: 150,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/light-2.png'),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 40,
                      top: 40,
                      width: 80,
                      height: 150,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/clock.png'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(30.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Color.fromRGBO(143, 148, 251, 1),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(143, 148, 251, .2),
                            blurRadius: 20.0,
                            offset: Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Color.fromRGBO(143, 148, 251, 1),
                                ),
                              ),
                            ),
                            child: TextField(
                              controller: _fullNameController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Full Name",
                                hintStyle: TextStyle(color: Colors.grey[700]),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Color.fromRGBO(143, 148, 251, 1),
                                ),
                              ),
                            ),
                            child: TextField(
                              controller: _surnameController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Surname",
                                hintStyle: TextStyle(color: Colors.grey[700]),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Color.fromRGBO(143, 148, 251, 1),
                                ),
                              ),
                            ),
                            child: TextField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Email",
                                hintStyle: TextStyle(color: Colors.grey[700]),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Color.fromRGBO(143, 148, 251, 1),
                                ),
                              ),
                            ),
                            child: TextField(
                              controller: _idNumberController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "ID/Passport/Asylum Number",
                                hintStyle: TextStyle(color: Colors.grey[700]),
                              ),
                            ),
                          ),
                          DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "I am a",
                              hintStyle: TextStyle(color: Colors.grey[700]),
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
                            child: Text('Upload Lease PDF'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Take live picture logic
                            },
                            child: Text('Take Picture'),
                          ),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Color.fromRGBO(143, 148, 251, 1),
                                ),
                              ),
                            ),
                            child: TextField(
                              controller: _passwordController,
                              obscureText: !_passwordVisible,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Password",
                                hintStyle: TextStyle(color: Colors.grey[700]),
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
                          ),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Color.fromRGBO(143, 148, 251, 1),
                                ),
                              ),
                            ),
                            child: TextField(
                              controller: _confirmPasswordController,
                              obscureText: !_confirmPasswordVisible,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Confirm Password",
                                hintStyle: TextStyle(color: Colors.grey[700]),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _confirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                                    color: Theme.of(context).primaryColorDark,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _confirmPasswordVisible = !_confirmPasswordVisible;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        // Create account logic
                      },
                      child: Text(
                        "Create Account",
                        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 70),
                    GestureDetector(
                      onTap: () {
                        // Navigate to login screen
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Already have an account? Login",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
