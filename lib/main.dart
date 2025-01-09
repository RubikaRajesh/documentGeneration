// import 'package:flutter/material.dart';
// import 'screens/login.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'SJCE-IT Portal',
//       theme: ThemeData(
//         primarySwatch: Colors.deepPurple,
//       ),
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Row(
//           children: [
//             Image.asset(
//               'assets/logo.png', // Ensure this is configured properly in pubspec.yaml
//               height: 40,
//               width: 40,
//             ),
//             SizedBox(width: 10),
//             Text(
//               'SJCE-IT',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//           ],
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {},
//             child: Text(
//               'Home',
//               style: TextStyle(
//                   color: const Color.fromARGB(255, 13, 9, 9), fontSize: 16),
//             ),
//           ),
//           TextButton(
//             onPressed: () {},
//             child: Text(
//               'Track',
//               style: TextStyle(
//                   color: const Color.fromARGB(255, 4, 3, 3), fontSize: 16),
//             ),
//           ),
//           TextButton(
//             onPressed: () {},
//             child: Text(
//               'Apply OD',
//               style: TextStyle(
//                   color: const Color.fromARGB(255, 0, 0, 0), fontSize: 16),
//             ),
//           ),
//           TextButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => LoginPage()),
//               );
//             },
//             child: Text(
//               'Login',
//               style: TextStyle(
//                   color: const Color.fromARGB(255, 0, 0, 0), fontSize: 16),
//             ),
//           ),
//         ],
//       ),
//       body: Center(
//         child: Padding(
//           padding: EdgeInsets.all(16.0),
//           child: Text(
//             'Welcome to SJCE-IT Portal',
//             style: TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//               color: Colors.deepPurple,
//             ),
//             textAlign: TextAlign.center,
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'screens/home.dart'; // Import the HomePage

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'SJCE-IT Portal',
//       theme: ThemeData(
//         primarySwatch: Colors.deepPurple,
//       ),
//       home: HomePage(), // This ensures the app starts at HomePage
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'screens/home.dart'; // Import the HomePage
// import 'screens/login.dart'; // Import the LoginPage
// import 'screens/signup.dart'; // Import the SignupPage

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'SJCE-IT Portal',
//       theme: ThemeData(
//         primarySwatch: Colors.deepPurple,
//       ),
//       initialRoute: '/home', // Set initial route to HomePage
//       routes: {
//         '/home': (context) => HomePage(), // HomePage route
//         '/': (context) => LoginPage(), // LoginPage route
//         '/signup': (context) => SignupPage(), // SignupPage route
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'screens/home.dart'; // Import the HomePage
import 'screens/login.dart'; // Import the LoginPage
import 'screens/signup.dart'; // Import the SignupPage
import 'screens/od_form.dart'; // Import the OD Form widget
import 'screens/track.dart';
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
      initialRoute: '/home', // Set initial route to HomePage
      routes: {
        '/home': (context) => HomePage(), // HomePage route
        '/': (context) => LoginPage(), // LoginPage route
        '/signup': (context) => SignupPage(), // SignupPage route
        '/od_form': (context) => OdFormPage(), // OD Form route
        '/track': (context) => OdTrackingPage()// Tracking page route
      },
    );
  }
}
