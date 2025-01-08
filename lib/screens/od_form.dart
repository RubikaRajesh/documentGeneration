// // import 'package:flutter/material.dart';

// // class OutDutyForm extends StatefulWidget {
// //   const OutDutyForm({Key? key}) : super(key: key);

// //   @override
// //   State<OutDutyForm> createState() => _OutDutyFormState();
// // }

// // class _OutDutyFormState extends State<OutDutyForm> {
// //   final _formKey = GlobalKey<FormState>();

// //   final _nameController = TextEditingController();
// //   final _reasonController = TextEditingController();
// //   final _daysController = TextEditingController();
// //   final _placeController = TextEditingController();
// //   final _competitionNameController = TextEditingController();
// //   final _institutionNameController = TextEditingController();

// //   void _submitForm() {
// //     if (_formKey.currentState!.validate()) {
// //       print("Name: ${_nameController.text}");
// //       print("Reason: ${_reasonController.text}");
// //       print("Number of Days: ${_daysController.text}");
// //       print("Place: ${_placeController.text}");
// //       print("Competition Name: ${_competitionNameController.text}");
// //       print("Institution Name: ${_institutionNameController.text}");

// //       ScaffoldMessenger.of(context).showSnackBar(
// //         const SnackBar(content: Text('Form Submitted Successfully!')),
// //       );

// //       _nameController.clear();
// //       _reasonController.clear();
// //       _daysController.clear();
// //       _placeController.clear();
// //       _competitionNameController.clear();
// //       _institutionNameController.clear();
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Padding(
// //       padding: const EdgeInsets.all(16.0),
// //       child: Form(
// //         key: _formKey,
// //         child: ListView(
// //           children: [
// //             TextFormField(
// //               controller: _nameController,
// //               decoration: const InputDecoration(labelText: 'Name'),
// //               validator: (value) {
// //                 if (value == null || value.isEmpty) {
// //                   return 'Please enter your name';
// //                 }
// //                 return null;
// //               },
// //             ),
// //             TextFormField(
// //               controller: _reasonController,
// //               decoration: const InputDecoration(labelText: 'Reason'),
// //               validator: (value) {
// //                 if (value == null || value.isEmpty) {
// //                   return 'Please enter the reason';
// //                 }
// //                 return null;
// //               },
// //             ),
// //             TextFormField(
// //               controller: _daysController,
// //               decoration: const InputDecoration(labelText: 'Number of Days'),
// //               keyboardType: TextInputType.number,
// //               validator: (value) {
// //                 if (value == null || value.isEmpty) {
// //                   return 'Please enter the number of days';
// //                 }
// //                 if (int.tryParse(value) == null) {
// //                   return 'Please enter a valid number';
// //                 }
// //                 return null;
// //               },
// //             ),
// //             TextFormField(
// //               controller: _placeController,
// //               decoration: const InputDecoration(labelText: 'Place'),
// //               validator: (value) {
// //                 if (value == null || value.isEmpty) {
// //                   return 'Please enter the place';
// //                 }
// //                 return null;
// //               },
// //             ),
// //             TextFormField(
// //               controller: _competitionNameController,
// //               decoration: const InputDecoration(labelText: 'Name of the Competition'),
// //               validator: (value) {
// //                 if (value == null || value.isEmpty) {
// //                   return 'Please enter the competition name';
// //                 }
// //                 return null;
// //               },
// //             ),
// //             TextFormField(
// //               controller: _institutionNameController,
// //               decoration: const InputDecoration(labelText: 'Name of the Institution'),
// //               validator: (value) {
// //                 if (value == null || value.isEmpty) {
// //                   return 'Please enter the institution name';
// //                 }
// //                 return null;
// //               },
// //             ),
// //             const SizedBox(height: 20),
// //             ElevatedButton(
// //               onPressed: _submitForm,
// //               child: const Text('Submit'),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   @override
// //   void dispose() {
// //     _nameController.dispose();
// //     _reasonController.dispose();
// //     _daysController.dispose();
// //     _placeController.dispose();
// //     _competitionNameController.dispose();
// //     _institutionNameController.dispose();
// //     super.dispose();
// //   }
// // }

// import 'package:flutter/material.dart';

// class OdFormPage extends StatefulWidget {
//   @override
//   _OdFormPageState createState() => _OdFormPageState();
// }

// class _OdFormPageState extends State<OdFormPage> {
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController departmentController = TextEditingController();
//   final TextEditingController reasonController = TextEditingController();
//   final TextEditingController fromDateController = TextEditingController();
//   final TextEditingController toDateController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('OD Form'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Text(
//                 'OD Form',
//                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 20),
              
//               // Full Name Field
//               TextField(
//                 controller: nameController,
//                 decoration: InputDecoration(
//                   labelText: 'Full Name',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 20),

//               // Department Field
//               TextField(
//                 controller: departmentController,
//                 decoration: InputDecoration(
//                   labelText: 'Department',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 20),

//               // From Date Field
//               TextField(
//                 controller: fromDateController,
//                 decoration: InputDecoration(
//                   labelText: 'From Date (YYYY-MM-DD)',
//                   border: OutlineInputBorder(),
//                 ),
//                 keyboardType: TextInputType.datetime,
//               ),
//               SizedBox(height: 20),

//               // To Date Field
//               TextField(
//                 controller: toDateController,
//                 decoration: InputDecoration(
//                   labelText: 'To Date (YYYY-MM-DD)',
//                   border: OutlineInputBorder(),
//                 ),
//                 keyboardType: TextInputType.datetime,
//               ),
//               SizedBox(height: 20),

//               // Reason Field
//               TextField(
//                 controller: reasonController,
//                 decoration: InputDecoration(
//                   labelText: 'Reason for OD',
//                   border: OutlineInputBorder(),
//                 ),
//                 maxLines: 4,
//               ),
//               SizedBox(height: 20),

//               // Submit Button
//               ElevatedButton(
//                 onPressed: () {
//                   // You can add code here to handle form submission
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(content: Text('OD Form Submitted')),
//                   );
//                 },
//                 child: Text('Submit'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class OdFormPage extends StatefulWidget {
  @override
  _OdFormPageState createState() => _OdFormPageState();
}

class _OdFormPageState extends State<OdFormPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController noOfDaysController = TextEditingController();
  final TextEditingController placeController = TextEditingController();
  final TextEditingController institutionController = TextEditingController();
  final TextEditingController competitionController = TextEditingController();

  // Function to handle form submission
  void submitForm() {
    // Here you can add logic to save the data or send it to a database
    final name = nameController.text;
    final noOfDays = noOfDaysController.text;
    final place = placeController.text;
    final institution = institutionController.text;
    final competition = competitionController.text;

    if (name.isNotEmpty &&
        noOfDays.isNotEmpty &&
        place.isNotEmpty &&
        institution.isNotEmpty &&
        competition.isNotEmpty) {
      // Show confirmation
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('OD Form Submitted Successfully')),
      );
    } else {
      // Show error if any field is empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in all fields')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OD Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: 'Enter your name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              Text('No of Days', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              TextField(
                controller: noOfDaysController,
                decoration: InputDecoration(
                  hintText: 'Enter number of days',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              Text('Place', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              TextField(
                controller: placeController,
                decoration: InputDecoration(
                  hintText: 'Enter place',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              Text('Name of the Institution', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              TextField(
                controller: institutionController,
                decoration: InputDecoration(
                  hintText: 'Enter institution name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              Text('Name of the Competition', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              TextField(
                controller: competitionController,
                decoration: InputDecoration(
                  hintText: 'Enter competition name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: submitForm,
                child: Text('Submit'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
