import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'header.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> login(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login Successful!')),
      );
      // Navigate to Home Page or another page after login
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonHeader(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 21, 54, 90),
              const Color.fromARGB(255, 11, 87, 173),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView( // Make the page scrollable
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Container(
                width: 350,  // Reduced width of the login box
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 21, 54, 90),  // Dark blue background
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Heading Text
                    AnimatedDefaultTextStyle(
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Poppins',
                      ),
                      duration: Duration(milliseconds: 500),
                      child: Text('Welcome Back!'),
                    ),
                    SizedBox(height: 40),
                    
                    // Email Heading and Input Field
                    buildInputField(
                      controller: emailController,
                      label: 'Email',
                      hint: 'Enter your email',
                      icon: Icons.email,
                      isHeading: true,  // Heading style
                    ),
                    
                    SizedBox(height: 20),
                    
                    // Password Heading and Input Field
                    buildInputField(
                      controller: passwordController,
                      label: 'Password',
                      hint: 'Enter your password',
                      icon: Icons.lock,
                      obscureText: true,
                      isHeading: true,  // Heading style
                    ),
                    
                    SizedBox(height: 20),

                    // Login Button with Animation and Custom Color
                    AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => login(context),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                          backgroundColor: Colors.yellow,  // Changed color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 5,
                        ),
                        child: Text("Login", style: TextStyle(fontSize: 18)),
                      ),
                    ),
                    
                    SizedBox(height: 20),
                    
                    // Sign Up Navigation
                    TextButton(
                      onPressed: () => Navigator.pushNamed(context, '/signup'),
                      child: Text(
                        "Don't have an account? Sign up",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),

                    SizedBox(height: 20),

                    // Social Login Section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        socialLoginButton(Icons.g_mobiledata, "Google"),
                        SizedBox(width: 20),
                        socialLoginButton(Icons.facebook, "Facebook"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Input Field with Heading style and Icon
  Widget buildInputField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    bool obscureText = false,
    bool isHeading = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Heading style for labels
        if (isHeading)
          AnimatedDefaultTextStyle(
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            duration: Duration(milliseconds: 500),
            child: Text(label),
          ),
        
        SizedBox(height: 8),
        
        // Input Field with Icon
        TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(icon, color: Colors.blue),
            labelStyle: TextStyle(color: Colors.white),
            filled: true,
            fillColor: Colors.white.withOpacity(0.8),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }

  // Social Login Button
  Widget socialLoginButton(IconData icon, String platform) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(icon, color: Colors.white),
      label: Text(platform, style: TextStyle(color: Colors.white)),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 5,
      ),
    );
  }
}
