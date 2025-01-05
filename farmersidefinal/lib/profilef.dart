import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.grey[200], // Set a pleasant background color
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  bool _isProfileSubmitted = false;
  late final String _name;
  late final String _location;
  late final String _aadhar;
  late final String _farmSize;
  late final String _cropType;
  late final String _experience;
  late final String _contact;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Page'),
        backgroundColor: const Color.fromARGB(255, 19, 107, 22),
      ),
      body: Center(
        child: SizedBox(
          width: 250,
          height: 100, // Increased height for better appearance
          child: ElevatedButton(
            onPressed: () {
              if (_isProfileSubmitted) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileSummaryPage(
                      name: _name,
                      location: _location,
                      aadhar: _aadhar,
                      farmSize: _farmSize,
                      cropType: _cropType,
                      experience: _experience,
                      contact: _contact,
                    ),
                  ),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FarmerProfilePage(
                      onSubmit: (name, location, aadhar, farmSize, cropType, experience, contact) {
                        setState(() {
                          _name = name;
                          _location = location;
                          _aadhar = aadhar;
                          _farmSize = farmSize;
                          _cropType = cropType;
                          _experience = experience;
                          _contact = contact;
                          _isProfileSubmitted = true;
                        });
                      },
                    ),
                  ),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 19, 107, 22), // Button background color
              foregroundColor: Colors.white, // Text color
              textStyle: const TextStyle(fontSize: 18), // Adjusted text size
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0), // Rounded corners
              ),
              elevation: 5, // Shadow effect
              padding: const EdgeInsets.all(16.0), // Padding inside the button
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  _isProfileSubmitted ? Icons.check_box : Icons.check_box_outline_blank,
                  size: 24.0,
                ),
                const SizedBox(width: 10), // Spacing between icon and text
                Text(
                  _isProfileSubmitted ? 'View Profile Summary' : 'Farmer Profile',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FarmerProfilePage extends StatefulWidget {
  final void Function(String name, String location, String aadhar, String farmSize, String cropType, String experience, String contact) onSubmit;

  const FarmerProfilePage({required this.onSubmit, super.key});

  @override
  FarmerProfilePageState createState() => FarmerProfilePageState();
}

class FarmerProfilePageState extends State<FarmerProfilePage> {
  final _formKey = GlobalKey<FormState>();

  // Text controllers for all fields
  TextEditingController nameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController aadharController = TextEditingController();
  TextEditingController farmSizeController = TextEditingController();
  TextEditingController cropTypeController = TextEditingController();
  TextEditingController experienceController = TextEditingController();
  TextEditingController contactController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    locationController.dispose();
    aadharController.dispose();
    farmSizeController.dispose();
    cropTypeController.dispose();
    experienceController.dispose();
    contactController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Farmer Profile'),
        backgroundColor: const Color.fromARGB(255, 19, 107, 22),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              // Full Name
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Full Name',
                  labelStyle: TextStyle(color: Colors.black),
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your full name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),

              // Location
              TextFormField(
                controller: locationController,
                decoration: const InputDecoration(
                  labelText: 'Location',
                  labelStyle: TextStyle(color: Colors.black),
                  prefixIcon: Icon(Icons.location_on),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your location';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),

              // Aadhar Card Number
              TextFormField(
                controller: aadharController,
                decoration: const InputDecoration(
                  labelText: 'Aadhar Card Number',
                  labelStyle: TextStyle(color: Colors.black),
                  prefixIcon: Icon(Icons.assignment_ind),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Aadhar card number';
                  }
                  if (!RegExp(r'^\d+$').hasMatch(value)) {
                    return 'Please enter a valid Aadhar number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),

              // Farm Size
              TextFormField(
                controller: farmSizeController,
                decoration: const InputDecoration(
                  labelText: 'Farm Size (in acres)',
                  labelStyle: TextStyle(color: Colors.black),
                  prefixIcon: Icon(Icons.landscape),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your farm size';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),

              // Crop Type
              TextFormField(
                controller: cropTypeController,
                decoration: const InputDecoration(
                  labelText: 'Main Crop Type',
                  labelStyle: TextStyle(color: Colors.black),
                  prefixIcon: Icon(Icons.grain),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your main crop type';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),

              // Years of Experience
              TextFormField(
                controller: experienceController,
                decoration: const InputDecoration(
                  labelText: 'Years of Experience',
                  labelStyle: TextStyle(color: Colors.black),
                  prefixIcon: Icon(Icons.history),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your years of farming experience';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),

              // Contact Number
              TextFormField(
                controller: contactController,
                decoration: const InputDecoration(
                  labelText: 'Contact Number',
                  labelStyle: TextStyle(color: Colors.black),
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your contact number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),

              // Submit Button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    widget.onSubmit(
                      nameController.text,
                      locationController.text,
                      aadharController.text,
                      farmSizeController.text,
                      cropTypeController.text,
                      experienceController.text,
                      contactController.text,
                    );
                    Navigator.pop(context); // Return to MainPage
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 19, 107, 22),
                  foregroundColor: Colors.white,
                ),
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileSummaryPage extends StatelessWidget {
  final String name;
  final String location;
  final String aadhar;
  final String farmSize;
  final String cropType;
  final String experience;
  final String contact;

  const ProfileSummaryPage({
    required this.name,
    required this.location,
    required this.aadhar,
    required this.farmSize,
    required this.cropType,
    required this.experience,
    required this.contact,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Summary'),
        backgroundColor: const Color.fromARGB(255, 19, 107, 22),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            // Display Full Name
            ProfileInfoTile(
              label: 'Full Name',
              value: name,
              icon: Icons.person,
            ),
            const SizedBox(height: 16.0),

            // Display Location
            ProfileInfoTile(
              label: 'Location',
              value: location,
              icon: Icons.location_on,
            ),
            const SizedBox(height: 16.0),

            // Display Aadhar Card Number
            ProfileInfoTile(
              label: 'Aadhar Card Number',
              value: aadhar,
              icon: Icons.assignment_ind,
            ),
            const SizedBox(height: 16.0),

            // Display Farm Size
            ProfileInfoTile(
              label: 'Farm Size (in acres)',
              value: farmSize,
              icon: Icons.landscape,
            ),
            const SizedBox(height: 16.0),

            // Display Crop Type
            ProfileInfoTile(
              label: 'Main Crop Type',
              value: cropType,
              icon: Icons.grain,
            ),
            const SizedBox(height: 16.0),

            // Display Years of Experience
            ProfileInfoTile(
              label: 'Years of Experience',
              value: experience,
              icon: Icons.history,
            ),
            const SizedBox(height: 16.0),

            // Display Contact Number
            ProfileInfoTile(
              label: 'Contact Number',
              value: contact,
              icon: Icons.phone,
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileInfoTile extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const ProfileInfoTile({
    required this.label,
    required this.value,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Icon(icon, color: const Color.fromARGB(255, 19, 107, 22)),
          const SizedBox(width: 16.0),
          Expanded(
            child: Text(
              '$label: $value',
              style: const TextStyle(fontSize: 18.0),
            ),
          ),
        ],
      ),
    );
  }
}
