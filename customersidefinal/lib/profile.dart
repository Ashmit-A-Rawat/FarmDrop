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
        scaffoldBackgroundColor: Colors.grey[200],
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
  late final String _email;
  late final String _phone;
  late final String _address;
  late final String _dob;
  late final String _membership;

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
          height: 100,
          child: ElevatedButton(
            onPressed: () {
              if (_isProfileSubmitted) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileSummaryPage(
                      name: _name,
                      email: _email,
                      phone: _phone,
                      address: _address,
                      dob: _dob,
                      membership: _membership,
                    ),
                  ),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CustomerProfilePage(
                      onSubmit: (name, email, phone, address, dob, membership) {
                        setState(() {
                          _name = name;
                          _email = email;
                          _phone = phone;
                          _address = address;
                          _dob = dob;
                          _membership = membership;
                          _isProfileSubmitted = true;
                        });
                      },
                    ),
                  ),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 19, 107, 22),
              foregroundColor: Colors.white,
              textStyle: const TextStyle(fontSize: 18),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 5,
              padding: const EdgeInsets.all(16.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  _isProfileSubmitted ? Icons.check_box : Icons.check_box_outline_blank,
                  size: 24.0,
                ),
                const SizedBox(width: 10),
                Text(
                  _isProfileSubmitted ? 'View Profile Summary' : 'Customer Profile',
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

class CustomerProfilePage extends StatefulWidget {
  final void Function(String name, String email, String phone, String address, String dob, String membership) onSubmit;

  const CustomerProfilePage({required this.onSubmit, super.key});

  @override
  CustomerProfilePageState createState() => CustomerProfilePageState();
}

class CustomerProfilePageState extends State<CustomerProfilePage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController membershipController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    dobController.dispose();
    membershipController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer Profile'),
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

              // Email Address
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email Address',
                  labelStyle: TextStyle(color: Colors.black),
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email address';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),

              // Phone Number
              TextFormField(
                controller: phoneController,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  labelStyle: TextStyle(color: Colors.black),
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),

              // Address
              TextFormField(
                controller: addressController,
                decoration: const InputDecoration(
                  labelText: 'Address',
                  labelStyle: TextStyle(color: Colors.black),
                  prefixIcon: Icon(Icons.home),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),

              // Date of Birth
              TextFormField(
                controller: dobController,
                decoration: const InputDecoration(
                  labelText: 'Date of Birth',
                  labelStyle: TextStyle(color: Colors.black),
                  prefixIcon: Icon(Icons.calendar_today),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.datetime,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your date of birth';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),

              // Membership Type
              TextFormField(
                controller: membershipController,
                decoration: const InputDecoration(
                  labelText: 'Membership Type',
                  labelStyle: TextStyle(color: Colors.black),
                  prefixIcon: Icon(Icons.card_membership),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your membership type';
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
                      emailController.text,
                      phoneController.text,
                      addressController.text,
                      dobController.text,
                      membershipController.text,
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
  final String email;
  final String phone;
  final String address;
  final String dob;
  final String membership;

  const ProfileSummaryPage({
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.dob,
    required this.membership,
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

            // Display Email Address
            ProfileInfoTile(
              label: 'Email Address',
              value: email,
              icon: Icons.email,
            ),
            const SizedBox(height: 16.0),

            // Display Phone Number
            ProfileInfoTile(
              label: 'Phone Number',
              value: phone,
              icon: Icons.phone,
            ),
            const SizedBox(height: 16.0),

            // Display Address
            ProfileInfoTile(
              label: 'Address',
              value: address,
              icon: Icons.home,
            ),
            const SizedBox(height: 16.0),

            // Display Date of Birth
            ProfileInfoTile(
              label: 'Date of Birth',
              value: dob,
              icon: Icons.calendar_today,
            ),
            const SizedBox(height: 16.0),

            // Display Membership Type
            ProfileInfoTile(
              label: 'Membership Type',
              value: membership,
              icon: Icons.card_membership,
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
