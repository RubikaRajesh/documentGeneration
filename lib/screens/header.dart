// import 'package:flutter/material.dart';
// import 'home.dart'; // Import your HomePage
// import 'login.dart'; // Import the LoginPage

// class CommonHeader extends StatelessWidget implements PreferredSizeWidget {
//   @override
//   final Size preferredSize;

//   CommonHeader({Key? key})
//       : preferredSize = Size.fromHeight(80.0), // Height of the app bar
//         super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       title: Row(
//         children: [
//           Image.asset(
//             'assets/logo.png', // Add your logo here
//             height: 40,
//             width: 40,
//           ),
//           SizedBox(width: 10),
//           Text('SJCE-IT'),
//         ],
//       ),
//       actions: [
//         TextButton(
//           onPressed: () {
//             // Navigate to HomePage when "Home" is clicked
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(builder: (context) => HomePage()),
//             );
//           },
//           child: Text(
//             'Home',
//             style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
//           ),
//         ),
//         TextButton(
//           onPressed: () {},
//           child: Text(
//             'Track',
//             style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
//           ),
//         ),
//         TextButton(
//           onPressed: () {},
//           child: Text(
//             'Apply OD',
//             style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
//           ),
//         ),
//         TextButton(
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => LoginPage()),
//             );
//           },
//           child: Text(
//             'Login',
//             style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
//           ),
//         ),
//       ],
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'home.dart'; // Import your HomePage
// import 'login.dart'; // Import the LoginPage
// import 'od_form.dart'; // Import the OD Form Page

// class CommonHeader extends StatelessWidget implements PreferredSizeWidget {
//   @override
//   final Size preferredSize;

//   CommonHeader({Key? key})
//       : preferredSize = Size.fromHeight(80.0), // Height of the app bar
//         super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       backgroundColor: Colors.black, // Set the background color to black
//       title: Row(
//         children: [
//           Image.asset(
//             'assets/logo.png', // Add your logo here
//             height: 40,
//             width: 40,
//           ),
//           SizedBox(width: 10),
//           Text('SJCE-IT',
//               style:
//                   TextStyle(color: Colors.white)), // Change text color to white
//         ],
//       ),
//       actions: [
//         TextButton(
//           onPressed: () {
//             // Navigate to HomePage when "Home" is clicked
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(builder: (context) => HomePage()),
//             );
//           },
//           child: Text(
//             'Home',
//             style: TextStyle(color: Colors.white), // Change text color to white
//           ),
//         ),
//         TextButton(
//           onPressed: () {},
//           child: Text(
//             'Track',
//             style: TextStyle(color: Colors.white), // Change text color to white
//           ),
//         ),
//         TextButton(
//           onPressed: () {
//             // Navigate to the OD Form Page when "Apply OD" is clicked
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => OdFormPage()),
//             );
//           },
//           child: Text(
//             'Apply OD',
//             style: TextStyle(color: Colors.white), // Change text color to white
//           ),
//         ),
//         TextButton(
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => LoginPage()),
//             );
//           },
//           child: Text(
//             'Login',
//             style: TextStyle(color: Colors.white), // Change text color to white
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'home.dart'; // Import your HomePage
import 'login.dart';
import 'profile.dart'; // Import the LoginPage
import 'od_form.dart'; // Import the OD Form Page
import 'track.dart'; // Import the Tracking Page

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
          Text(
            'SJCE-IT',
            style: TextStyle(color: Colors.white), // Change text color to white
          ),
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
          onPressed: () {
            // Navigate to the Tracking Page when "Track" is clicked
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OdTrackingPage()),
            );
          },
          child: Text(
            'Track',
            style: TextStyle(color: Colors.white), // Change text color to white
          ),
        ),
        TextButton(
          onPressed: () {
            // Navigate to the OD Form Page when "Apply OD" is clicked
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OdFormPage()),
            );
          },
          child: Text(
            'Apply OD',
            style: TextStyle(color: Colors.white), // Change text color to white
          ),
        ),
         TextButton(
          onPressed: () {
            // Navigate to the OD Form Page when "Apply OD" is clicked
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileForm()),
            );
          },
          child: Text(
            'Profile',
            style: TextStyle(color: Colors.white), // Change text color to white
          ),
        ),
        TextButton(
          onPressed: () {
            // Navigate to LoginPage when "Login" is clicked
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
