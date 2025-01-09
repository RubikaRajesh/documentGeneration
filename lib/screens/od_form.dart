import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';  // Add this for file picker
import 'header.dart';

class OdFormPage extends StatefulWidget {
  @override
  _OdFormPageState createState() => _OdFormPageState();
}

class _OdFormPageState extends State<OdFormPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController placeController = TextEditingController();
  final TextEditingController institutionController = TextEditingController();
  final TextEditingController competitionController = TextEditingController();

  String? selectedNumberOfDays;
  String? proofFilePath;
  bool isSubmitting = false;

  final List<String> numberOfDays = [
    "1 day",
    "2 days",
    "3 days",
    "4 days",
    "5 days",
    "6 days",
    "7 days",
    "1 month",
    "2 months",
    "6 months"
  ];

  // Function to handle form submission
  void submitForm() {
    setState(() {
      isSubmitting = true;
    });

    final name = nameController.text;
    final place = placeController.text;
    final institution = institutionController.text;
    final competition = competitionController.text;
    final noOfDays = selectedNumberOfDays;

    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isSubmitting = false;
      });

      if (name.isNotEmpty &&
          place.isNotEmpty &&
          institution.isNotEmpty &&
          competition.isNotEmpty &&
          noOfDays != null &&
          proofFilePath != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('OD Form Submitted Successfully',
                style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Please fill in all fields and add proof',
                style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.red,
          ),
        );
      }
    });
  }

  // Function to select proof file
  Future<void> selectProofFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png'],
    );

    if (result != null) {
      setState(() {
        proofFilePath = result.files.single.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonHeader(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 21, 54, 90),
              const Color.fromARGB(255, 11, 87, 173)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'OD Form',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.5,
                  ),
                ),
                SizedBox(height: 30),
                buildTextField('Name', 'Enter your name', nameController),
                SizedBox(height: 20),
                buildDropdownField(
                  'No of Days',
                  numberOfDays,
                  selectedNumberOfDays,
                  (newValue) {
                    setState(() {
                      selectedNumberOfDays = newValue;
                    });
                  },
                ),
                SizedBox(height: 20),
                buildTextField('Place', 'Enter place', placeController),
                SizedBox(height: 20),
                buildTextField('Name of the Institution', 'Enter institution name', institutionController),
                SizedBox(height: 20),
                buildTextField('Name of the Competition', 'Enter competition name', competitionController),
                SizedBox(height: 20),

                // Add Proof Section
                Text(
                  'Add Proof (PDF, JPG, PNG)',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                ElevatedButton(
                  onPressed: selectProofFile,
                  child: Text(
                    proofFilePath == null
                        ? 'Choose Proof'
                        : 'Proof Selected: ${proofFilePath!.split('/').last}',
                    style: TextStyle(fontSize: 16),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 238, 234, 9),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 5,
                  ),
                ),
                SizedBox(height: 30),

                Center(
                  child: isSubmitting
                      ? CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: submitForm,
                          child: Text(
                            'Submit',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 1, 19, 50),
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            elevation: 5,
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Function to create styled TextFields
  Widget buildTextField(String label, String hint, TextEditingController controller,
      {TextInputType keyboardType = TextInputType.text}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 8),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 5,
          child: TextField(
            controller: controller,
            keyboardType: keyboardType,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: Colors.grey[600]),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            ),
          ),
        ),
      ],
    );
  }

  // Function to create Dropdown menus for "No of Days"
  Widget buildDropdownField(String label, List<String> items, String? selectedValue,
      ValueChanged<String?> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 8),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 5,
          child: DropdownButtonFormField<String>(
            value: selectedValue,
            onChanged: onChanged,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            ),
            items: items.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value, style: TextStyle(color: Colors.black)),
              );
            }).toList(),
            hint: Text('Select $label', style: TextStyle(color: Colors.grey)),
          ),
        ),
      ],
    );
  }
}
