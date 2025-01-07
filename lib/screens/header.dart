import 'package:flutter/material.dart';
import 'home.dart'; // Import your HomePage
import 'login.dart'; // Import the LoginPage

class CommonHeader extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  CommonHeader({Key? key})
      : preferredSize = Size.fromHeight(80.0), // Height of the app bar
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black, // Set the background color to black
      title: Row(
        children: [
          Image.asset(
            'assets/logo.png', // Add your logo here
            height: 40,
            width: 40,
          ),
          SizedBox(width: 10),
          Text('SJCE-IT',
              style:
                  TextStyle(color: Colors.white)), // Change text color to white
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            // Navigate to HomePage when "Home" is clicked
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
          child: Text(
            'Home',
            style: TextStyle(color: Colors.white), // Change text color to white
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'Track',
            style: TextStyle(color: Colors.white), // Change text color to white
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'Apply OD',
            style: TextStyle(color: Colors.white), // Change text color to white
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          },
          child: Text(
            'Login',
            style: TextStyle(color: Colors.white), // Change text color to white
          ),
        ),
      ],
    );
  }
}
