import 'package:flutter/material.dart';
import 'header.dart'; // Import your CommonHeader here

class OdTrackingPage extends StatefulWidget {
  @override
  _OdTrackingPageState createState() => _OdTrackingPageState();
}

class _OdTrackingPageState extends State<OdTrackingPage> {
  int _currentStep = 0; // Tracks the current status (0: Reached, 1: Processing, 2: Approved, 3: Teacher Has Not Approved)

  // List of statuses to show steps
  final List<String> statuses = [
    "Reached Teacher",
    "Processing",
    "Approved",
    "Teacher Has Not Approved",
  ];

  // Icons to represent each step
  final List<IconData> stepIcons = [
    Icons.check_circle_outline, // Reached Teacher
    Icons.build_outlined, // Processing
    Icons.thumb_up_alt_outlined, // Approved
    Icons.cancel_outlined, // Teacher Has Not Approved
  ];

  // List of colors for each status
  final List<Color> stepColors = [
    Colors.blueAccent,
    Colors.orangeAccent, // For "Processing"
    Colors.green,
    Colors.redAccent, // For "Teacher has not approved"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonHeader(), // Use the CommonHeader here
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
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Title with larger font size
                  Text(
                    "Track Your OD",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 40),
                  
                  // Progress Bar to show current progress
                  LinearProgressIndicator(
                    value: (_currentStep + 1) / statuses.length,
                    backgroundColor: Colors.white.withOpacity(0.3),
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
                    minHeight: 8,
                  ),
                  SizedBox(height: 20),
                  
                  // Steps are now inside cards with icons
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        // Step 1: Reached Teacher
                        _buildStep(
                          stepIcons[0],
                          statuses[0],
                          "Your OD has reached the teacher.",
                          _currentStep >= 0,
                          stepColors[0],
                        ),
                        // Step 2: Processing
                        _buildStep(
                          stepIcons[1],
                          statuses[1],
                          "Your OD is currently being processed.",
                          _currentStep >= 1,
                          stepColors[1],
                        ),
                        // Step 3: Approved
                        _buildStep(
                          stepIcons[2],
                          statuses[2],
                          "The teacher has approved your OD.",
                          _currentStep >= 2,
                          stepColors[2],
                        ),
                        // Step 4: Teacher Has Not Approved
                        _buildStep(
                          stepIcons[3],
                          statuses[3],
                          "Your teacher has not yet approved your OD.",
                          _currentStep >= 3,
                          stepColors[3],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Helper method to create a step with icon and description
  Widget _buildStep(
      IconData icon, String title, String description, bool isActive, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Card(
        color: isActive ? color.withOpacity(0.8) : Colors.grey.withOpacity(0.3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          leading: Icon(
            icon,
            size: 40,
            color: Colors.white,
          ),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          subtitle: Text(
            description,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white.withOpacity(0.7),
            ),
          ),
//         //   onTap: () {
//         //     if (title == "Reached Teacher") {
//         //       ScaffoldMessenger.of(context).showSnackBar(
//         //         SnackBar(
//         //           content: Text("The teacher will notice the OD soon!"),
//         //           backgroundColor: Colors.green,
//         //           ),
//         //           );
//         //         }
//         // },
//         onTap: () {
//           if (title == "Reached Teacher") {
//             showDialog(
//               context: context,
//               builder: (BuildContext context) {
//               return AlertDialog(
//               title: Text("Good News!"),
//               content: Text("The teacher will notice the OD soon."),
//               actions: [
//                 TextButton(
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                     },
//                     child: Text("OK"),
//             ),
//           ],
//         );
//       },
//     );
//   }
// },


        ),
      ),
    );
  }
}

