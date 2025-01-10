// import 'package:flutter/material.dart';
// import 'header.dart';
// import 'home.dart';

// void main() {
//   runApp(const MaterialApp(
//     home: ProfileForm(),
//   ));
// }

// class ProfileForm extends StatefulWidget {
//   const ProfileForm({Key? key}) : super(key: key);

//   @override
//   State<ProfileForm> createState() => _ProfileFormState();
// }

// class _ProfileFormState extends State<ProfileForm> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _yearController = TextEditingController();
//   final TextEditingController _classController = TextEditingController();
//   final TextEditingController _sectionController = TextEditingController();
//   String? _selectedGender;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CommonHeader(),
      
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: ListView(
//             children: [
//               // Name Field
//               TextFormField(
//                 controller: _nameController,
//                 decoration: const InputDecoration(
//                   labelText: 'Name',
//                   border: OutlineInputBorder(),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your name';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 16),

//               // Gender Field
//               DropdownButtonFormField<String>(
//                 value: _selectedGender,
//                 decoration: const InputDecoration(
//                   labelText: 'Gender',
//                   border: OutlineInputBorder(),
//                 ),
//                 items: ['Male', 'Female', 'Other']
//                     .map((gender) => DropdownMenuItem(
//                           value: gender,
//                           child: Text(gender),
//                         ))
//                     .toList(),
//                 onChanged: (value) {
//                   setState(() {
//                     _selectedGender = value;
//                   });
//                 },
//                 validator: (value) {
//                   if (value == null) {
//                     return 'Please select a gender';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 16),

//               // Year Field
//               TextFormField(
//                 controller: _yearController,
//                 keyboardType: TextInputType.number,
//                 decoration: const InputDecoration(
//                   labelText: 'Year',
//                   border: OutlineInputBorder(),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your year';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 16),

//               // Class Field
//               TextFormField(
//                 controller: _classController,
//                 decoration: const InputDecoration(
//                   labelText: 'Class',
//                   border: OutlineInputBorder(),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your class';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 16),

//               // Section Field
//               TextFormField(
//                 controller: _sectionController,
//                 decoration: const InputDecoration(
//                   labelText: 'Section',
//                   border: OutlineInputBorder(),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your section';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 24),

//               // Submit Button
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     // Process the form
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(
//                         content: Text('Profile submitted successfully!'),
//                       ),
//                     );
//                   }
//                 },
//                 child: const Text('Submit'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _yearController.dispose();
//     _classController.dispose();
//     _sectionController.dispose();
//     super.dispose();
//   }
// }
// import 'package:flutter/material.dart';
// import 'dart:io';
// import 'package:image_picker/image_picker.dart';
// import 'header.dart';


// void main() {
//   runApp(const MaterialApp(
//     home: ProfileForm(),
//     theme: ThemeData(
//       primarySwatch: Colors.blue, // Sets the app's primary theme color
//       scaffoldBackgroundColor: Colors.blueAccent, // Sets the default background color
//     ),
//   ));
// }

// class ProfileForm extends StatefulWidget {
//   const ProfileForm({Key? key}) : super(key: key);

//   @override
//   State<ProfileForm> createState() => _ProfileFormState();
// }

// class _ProfileFormState extends State<ProfileForm> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _yearController = TextEditingController();
//   final TextEditingController _classController = TextEditingController();
//   final TextEditingController _sectionController = TextEditingController();
//   String? _selectedGender;
//   File? _selectedImage;

//   // Function to pick an image
//   Future<void> _pickImage(ImageSource source) async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(source: source);

//     if (pickedFile != null) {
//       setState(() {
//         _selectedImage = File(pickedFile.path);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CommonHeader(),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: ListView(
//             children: [
//               // Photo Upload Section
//               Center(
//                 child: Stack(
//                   alignment: Alignment.bottomRight,
//                   children: [
//                     CircleAvatar(
//                       radius: 60,
//                       backgroundImage:
//                           _selectedImage != null ? FileImage(_selectedImage!) : null,
//                       child: _selectedImage == null
//                           ? const Icon(Icons.person, size: 60)
//                           : null,
//                     ),
//                     IconButton(
//                       icon: const Icon(Icons.camera_alt, color: Colors.blue),
//                       onPressed: () => _pickImage(ImageSource.gallery),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 20),

//               // Name Field
//               TextFormField(
//                 controller: _nameController,
//                 decoration: const InputDecoration(
//                   labelText: 'Name',
//                   border: OutlineInputBorder(),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your name';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 16),

//               // Gender Field
//               DropdownButtonFormField<String>(
//                 value: _selectedGender,
//                 decoration: const InputDecoration(
//                   labelText: 'Gender',
//                   border: OutlineInputBorder(),
//                 ),
//                 items: ['Male', 'Female', 'Other']
//                     .map((gender) => DropdownMenuItem(
//                           value: gender,
//                           child: Text(gender),
//                         ))
//                     .toList(),
//                 onChanged: (value) {
//                   setState(() {
//                     _selectedGender = value;
//                   });
//                 },
//                 validator: (value) {
//                   if (value == null) {
//                     return 'Please select a gender';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 16),

//               // Year Field
//               TextFormField(
//                 controller: _yearController,
//                 keyboardType: TextInputType.number,
//                 decoration: const InputDecoration(
//                   labelText: 'Year',
//                   border: OutlineInputBorder(),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your year';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 16),

//               // Class Field
//               TextFormField(
//                 controller: _classController,
//                 decoration: const InputDecoration(
//                   labelText: 'Class',
//                   border: OutlineInputBorder(),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your class';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 16),

//               // Section Field
//               TextFormField(
//                 controller: _sectionController,
//                 decoration: const InputDecoration(
//                   labelText: 'Section',
//                   border: OutlineInputBorder(),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your section';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 24),

//               // Submit Button
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(
//                         content: Text('Profile submitted successfully!'),
//                       ),
//                     );
//                   }
//                 },
//                 child: const Text('Submit'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _yearController.dispose();
//     _classController.dispose();
//     _sectionController.dispose();
//     super.dispose();
//   }
// // }
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart'; // Ensure the package is installed
// import 'dart:io';

// void main() {
//   runApp(const MaterialApp(
//     home: ProfileForm(),
   
//   ));
// }

// class ProfileForm extends StatefulWidget {
//   const ProfileForm({Key? key}) : super(key: key);

//   @override
//   State<ProfileForm> createState() => _ProfileFormState();
// }

// class _ProfileFormState extends State<ProfileForm> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _yearController = TextEditingController();
//   final TextEditingController _classController = TextEditingController();
//   final TextEditingController _sectionController = TextEditingController();
//   String? _selectedGender;
//   File? _selectedImage;

//   // Function to pick an image
//   Future<void> _pickImage(ImageSource source) async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(source: source);

//     if (pickedFile != null) {
//       setState(() {
//         _selectedImage = File(pickedFile.path);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Student Profile'),
//         backgroundColor: Colors.blue, // AppBar color
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: ListView(
//             children: [
//               // Photo Upload Section
//               Center(
//                 child: Stack(
//                   alignment: Alignment.bottomRight,
//                   children: [
//                     CircleAvatar(
//                       radius: 60,
//                       backgroundImage:
//                           _selectedImage != null ? FileImage(_selectedImage!) : null,
//                       child: _selectedImage == null
//                           ? const Icon(Icons.person, size: 60, color: Color.fromARGB(255, 62, 91, 185))
//                           : null,
//                     ),
//                     IconButton(
//                       icon: const Icon(Icons.camera_alt, color: Colors.white),
//                       onPressed: () => _pickImage(ImageSource.gallery),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 20),

//               // Name Field
//               TextFormField(
//                 controller: _nameController,
//                 decoration: InputDecoration(
//                   labelText: 'Name',
//                   border: OutlineInputBorder(),
//                   filled: true,
//                   fillColor: Colors.white, // Input field background
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your name';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 16),

//               // Gender Field
//               DropdownButtonFormField<String>(
//                 value: _selectedGender,
//                 decoration: InputDecoration(
//                   labelText: 'Gender',
//                   border: OutlineInputBorder(),
//                   filled: true,
//                   fillColor: Colors.white, // Input field background
//                 ),
//                 items: ['Male', 'Female', 'Other']
//                     .map((gender) => DropdownMenuItem(
//                           value: gender,
//                           child: Text(gender),
//                         ))
//                     .toList(),
//                 onChanged: (value) {
//                   setState(() {
//                     _selectedGender = value;
//                   });
//                 },
//                 validator: (value) {
//                   if (value == null) {
//                     return 'Please select a gender';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 16),

//               // Year Field
//               TextFormField(
//                 controller: _yearController,
//                 keyboardType: TextInputType.number,
//                 decoration: InputDecoration(
//                   labelText: 'Year',
//                   border: OutlineInputBorder(),
//                   filled: true,
//                   fillColor: Colors.white, // Input field background
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your year';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 16),

//               // Class Field
//               TextFormField(
//                 controller: _classController,
//                 decoration: InputDecoration(
//                   labelText: 'Class',
//                   border: OutlineInputBorder(),
//                   filled: true,
//                   fillColor: Colors.white, // Input field background
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your class';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 16),

//               // Section Field
//               TextFormField(
//                 controller: _sectionController,
//                 decoration: InputDecoration(
//                   labelText: 'Section',
//                   border: OutlineInputBorder(),
//                   filled: true,
//                   fillColor: Colors.white, // Input field background
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your section';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 24),

//               // Submit Button
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(
//                         content: Text('Profile submitted successfully!'),
//                       ),
//                     );
//                   }
//                 },
//                 child: const Text('Submit'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _yearController.dispose();
//     _classController.dispose();
//     _sectionController.dispose();
//     super.dispose();
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';
// import 'header.dart';

// void main() {
//   runApp(const MaterialApp(
//     home: ProfileForm(),
//   ));
// }

// class ProfileForm extends StatefulWidget {
//   const ProfileForm({Key? key}) : super(key: key);

//   @override
//   State<ProfileForm> createState() => _ProfileFormState();
// }

// class _ProfileFormState extends State<ProfileForm> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _yearController = TextEditingController();
//   final TextEditingController _classController = TextEditingController();
//   final TextEditingController _sectionController = TextEditingController();
//   String? _selectedGender;
//   File? _selectedImage;

//   // Function to pick an image
//   Future<void> _pickImage(ImageSource source) async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(source: source);

//     if (pickedFile != null) {
//       setState(() {
//         _selectedImage = File(pickedFile.path);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CommonHeader(),
     
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               Color.fromARGB(255, 21, 54, 90),
//               Color.fromARGB(255, 11, 87, 173),
//             ],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Form(
//             key: _formKey,
//             child: ListView(
//               children: [
//                 // Photo Upload Section
//                 Center(
//                   child: Stack(
//                     alignment: Alignment.bottomRight,
//                     children: [
//                       CircleAvatar(
//                         radius: 60,
//                         backgroundImage:
//                             _selectedImage != null ? FileImage(_selectedImage!) : null,
//                         child: _selectedImage == null
//                             ? const Icon(
//                                 Icons.person,
//                                 size: 60,
//                                 color: Color.fromARGB(255, 62, 91, 185),
//                               )
//                             : null,
//                       ),
//                       IconButton(
//                         icon: const Icon(Icons.camera_alt, color: Colors.white),
//                         onPressed: () => _pickImage(ImageSource.gallery),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 20),

//                 // Name Field
//                 TextFormField(
//                   controller: _nameController,
//                   decoration: InputDecoration(
//                     labelText: 'Name',
//                     border: OutlineInputBorder(),
//                     filled: true,
//                     fillColor: Colors.white,
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your name';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 16),

//                 // Gender Field
//                 DropdownButtonFormField<String>(
//                   value: _selectedGender,
//                   decoration: InputDecoration(
//                     labelText: 'Gender',
//                     border: OutlineInputBorder(),
//                     filled: true,
//                     fillColor: Colors.white,
//                   ),
//                   items: ['Male', 'Female', 'Other']
//                       .map((gender) => DropdownMenuItem(
//                             value: gender,
//                             child: Text(gender),
//                           ))
//                       .toList(),
//                   onChanged: (value) {
//                     setState(() {
//                       _selectedGender = value;
//                     });
//                   },
//                   validator: (value) {
//                     if (value == null) {
//                       return 'Please select a gender';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 16),

//                 // Year Field
//                 TextFormField(
//                   controller: _yearController,
//                   keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                     labelText: 'Year',
//                     border: OutlineInputBorder(),
//                     filled: true,
//                     fillColor: Colors.white,
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your year';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 16),

//                 // Class Field
//                 TextFormField(
//                   controller: _classController,
//                   decoration: InputDecoration(
//                     labelText: 'Class',
//                     border: OutlineInputBorder(),
//                     filled: true,
//                     fillColor: Colors.white,
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your class';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 16),

//                 // Section Field
//                 TextFormField(
//                   controller: _sectionController,
//                   decoration: InputDecoration(
//                     labelText: 'Section',
//                     border: OutlineInputBorder(),
//                     filled: true,
//                     fillColor: Colors.white,
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your section';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 24),

//                 // Submit Button
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     primary: const Color(0xFFFFD700), // Sun Yellow color
//                     ),
//                     onPressed: () {
//                       if (_formKey.currentState!.validate()) {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(
//                             content: Text('Profile submitted successfully!'),
//                             ),
//                           );
//                         }
//                       },
//                       child: const Text('Submit'),
//                     ),

//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _yearController.dispose();
//     _classController.dispose();
//     _sectionController.dispose();
//     super.dispose();
//   }
// }
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'header.dart';
void main() {
  runApp(const MaterialApp(
    home: ProfileForm(),
  ));
}

class ProfileForm extends StatefulWidget {
  const ProfileForm({Key? key}) : super(key: key);

  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();
  final TextEditingController _classController = TextEditingController();
  final TextEditingController _sectionController = TextEditingController();
  String? _selectedGender;
  File? _selectedImage;

  // Function to pick an image
  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonHeader(),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 21, 54, 90),
              Color.fromARGB(255, 11, 87, 173),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                // Photo Upload Section
                Center(
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundImage:
                            _selectedImage != null ? FileImage(_selectedImage!) : null,
                        child: _selectedImage == null
                            ? const Icon(
                                Icons.person,
                                size: 60,
                                color: Color.fromARGB(255, 62, 91, 185),
                              )
                            : null,
                      ),
                      IconButton(
                        icon: const Icon(Icons.camera_alt, color: Colors.white),
                        onPressed: () => _pickImage(ImageSource.gallery),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Name Field
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Gender Field
                DropdownButtonFormField<String>(
                  value: _selectedGender,
                  decoration: InputDecoration(
                    labelText: 'Gender',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  items: ['Male', 'Female', 'Other']
                      .map((gender) => DropdownMenuItem(
                            value: gender,
                            child: Text(gender),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Please select a gender';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Year Field
                TextFormField(
                  controller: _yearController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Year',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your year';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Class Field
                TextFormField(
                  controller: _classController,
                  decoration: InputDecoration(
                    labelText: 'Class',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your class';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Section Field
                TextFormField(
                  controller: _sectionController,
                  decoration: InputDecoration(
                    labelText: 'Section',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your section';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),

                // Submit Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFD700),
                    ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Profile submitted successfully!'),
                        ),
                      );
                    }
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _yearController.dispose();
    _classController.dispose();
    _sectionController.dispose();
    super.dispose();
  }
}
