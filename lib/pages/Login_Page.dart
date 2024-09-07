import 'package:flutter/material.dart';
import 'package:minetrack/pages/Shift_Page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/images/coal_mine_login_bg_img.jpeg'),
                fit: BoxFit.cover, // Fit the image dynamically
              ),
            ),
          ),
          // Logo and Company Details
          Positioned(
            top: 50,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Image.asset(
                  'lib/images/MineTrackLogo.png',
                  width: 100,
                  height: 100,
                ),
                SizedBox(height: 10),
                Text(
                  'MINE TRACK',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Empowering Safety, Enhancing Productivity!',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 255, 132, 0),
                  ),
                ),
              ],
            ),
          ),
          // Login Container
          Positioned(
            bottom: 50,
            left: 16,
            right: 16,
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 220, 220, 220)
                    .withOpacity(0.8), // Partially transparent gray color
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 255, 132, 0),
                    ),
                  ),
                  SizedBox(height: 32),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white, // White background for input fields
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Icon(Icons.email),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white, // White background for input fields
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Icon(Icons.lock),
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // Handle forgot password
                        // Implement forgot password functionality here
                      },
                      child: Text('Forgot Password?',
                          style: TextStyle(color: Colors.blue)),
                    ),
                  ),
                  SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        _handleLogin(context);
                      },
                      child: Text('Login'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange, // Orange color for login button
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Checkbox(
                          value: rememberMe,
                          onChanged: (newValue) {
                            setState(() {
                              rememberMe = newValue!;
                            });
                          },
                        ),
                        Text('Remember Me'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _handleLogin(BuildContext context) {
    final email = emailController.text;
    final password = passwordController.text;

    bool loginSuccess =
        _validateLogin(email, password); // Placeholder for actual login validation

    if (loginSuccess) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ShiftPage(), // Navigate to ShiftPage
        ),
      );
    } else {
      // Show error message if login fails
      _showLoginError(context);
    }
  }

  bool _validateLogin(String email, String password) {
    // Replace with actual validation logic
    return email == 'test@example.com' && password == '123';
  }

  void _showLoginError(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Login failed. Please check your credentials.'),
        backgroundColor: Colors.red,
      ),
    );
  }
}
