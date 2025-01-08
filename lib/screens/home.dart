import 'package:flutter/material.dart';
import 'header.dart'; // Assuming header.dart is where CommonHeader is located

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SJCE-IT Portal',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonHeader(),
      body: SingleChildScrollView(
        // Wrap the body with SingleChildScrollView to prevent overflow on small screens
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Add a large image at the top of the homepage
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                'assets/sjce.jpg', // Replace with your large image
                width: double.infinity,
                height: 250, // You can adjust the height
                fit: BoxFit.cover,
              ),
            ),
            // Text in the center with improved styling
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Welcome to SJCE-IT Portal',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                  letterSpacing: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            // Some additional content for the page
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'This is a modern portal for the SJCE IT Department where students can manage their profiles, track activities, and apply for OD.',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                  height: 1.6,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            // You can add more content here as needed
          ],
        ),
      ),
    );
  }
}
