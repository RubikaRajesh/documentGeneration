import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login.dart'; // Import the LoginPage
import 'header.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  final TextEditingController sectionController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final FocusNode nameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode departmentFocusNode = FocusNode();
  final FocusNode yearFocusNode = FocusNode();
  final FocusNode sectionFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode confirmPasswordFocusNode = FocusNode();

  Future<void> signup(BuildContext context) async {
    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Passwords do not match!')),
      );
      return;
    }

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Signup Successful!')),
      );
      Navigator.pop(context); // Go back to the login page after signup
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  @override
  void dispose() {
    nameFocusNode.dispose();
    emailFocusNode.dispose();
    departmentFocusNode.dispose();
    yearFocusNode.dispose();
    sectionFocusNode.dispose();
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonHeader(),
      body: SingleChildScrollView(
        // Wrap the entire body in a SingleChildScrollView
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 46, 1, 54),
                const Color.fromARGB(255, 148, 17, 124)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create an Account',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                buildLabel("Full Name"),
                buildTextField(
                    nameController, nameFocusNode, "Enter your full name"),
                SizedBox(height: 20),
                buildLabel("Email"),
                buildTextField(emailController, emailFocusNode,
                    "Enter your email address"),
                SizedBox(height: 20),
                buildLabel("Department"),
                buildTextField(departmentController, departmentFocusNode,
                    "Enter your department"),
                SizedBox(height: 20),
                buildLabel("Year"),
                buildTextField(
                    yearController, yearFocusNode, "Enter your year"),
                SizedBox(height: 20),
                buildLabel("Section"),
                buildTextField(
                    sectionController, sectionFocusNode, "Enter your section"),
                SizedBox(height: 20),
                buildLabel("Password"),
                buildTextField(passwordController, passwordFocusNode,
                    "Enter your password",
                    obscureText: true),
                SizedBox(height: 20),
                buildLabel("Confirm Password"),
                buildTextField(confirmPasswordController,
                    confirmPasswordFocusNode, "Re-enter your password",
                    obscureText: true),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => signup(context),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text("Signup", style: TextStyle(fontSize: 18)),
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  ),
                  child: Text(
                    "Already have an account? Login",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Method to build a label for each input field
  Widget buildLabel(String label) {
    return Text(
      label,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  // Method to build each text field
  Widget buildTextField(
      TextEditingController controller, FocusNode focusNode, String hintText,
      {bool obscureText = false}) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      focusNode: focusNode,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
        filled: true,
        fillColor: Colors.white.withOpacity(0.8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
