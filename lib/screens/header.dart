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
      title: Row(
        children: [
          Image.asset(
            'assets/logo.png', // Add your logo here
            height: 40,
            width: 40,
          ),
          SizedBox(width: 10),
          Text('SJCE-IT'),
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
            style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'Track',
            style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'Apply OD',
            style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
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
            style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
          ),
        ),
      ],
    );
  }
}
