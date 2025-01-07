import 'package:flutter/material.dart';
import 'screens/login.dart'; // Import the Login Page
import 'screens/signup.dart'; // Import the Signup Page

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Auth Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login', // Set the initial page
      debugShowCheckedModeBanner: false,
      routes: {
        '/login': (context) => LoginPage(), // Route for Login Page
        '/signup': (context) => SignupPage(), // Route for Signup Page
      },
    );
  }
}
