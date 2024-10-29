import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hackathon_x_project/backend/user_info.dart';
import 'package:hackathon_x_project/navbar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  XFile? image;
  final UserInfo userInfo = UserInfo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
              
          },
          icon: const Icon(LineAwesomeIcons.angle_left_solid, color: Colors.black),
        ),
        title: const Text(
          "Edit Profile",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // -- Profile Image 
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: CircleAvatar(
                        radius: 50.0,
                        backgroundColor: Colors.white,
                        backgroundImage: image != null
                        ? FileImage(File(image!.path))
                        : null,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: imagePickerMethod,
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          color: Colors.purple[300],
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: const Icon(
                          LineAwesomeIcons.camera_solid,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // -- Form Fields
              Form(
                child: Column(
                  children: [
                    _buildTextField(
                      label: 'Full Name',
                      icon: LineAwesomeIcons.user,
                      onChanged: (value) => userInfo.name = value,
                    ),
                    const SizedBox(height: 16),
                    _buildTextField(
                      label: 'E-Mail',
                      icon: LineAwesomeIcons.envelope,
                      onChanged: (value) => userInfo.name = value,
                    ),
                    const SizedBox(height: 16),
                    _buildTextField(
                      label: 'Phone No',
                      icon: LineAwesomeIcons.phone_solid,
                      onChanged: (value) => userInfo.name = value,
                    ),
                    const SizedBox(height: 16),
                    _buildTextField(
                      label: 'Password',
                      icon: LineAwesomeIcons.fingerprint_solid,
                      obscureText: true,
                      onChanged: (value) => userInfo.name = value,
                    ),
                    const SizedBox(height: 30),

                    // -- Profile Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Frame()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple[300],
                          shape: const StadiumBorder(),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const Text(
                          'Create Account',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),

                    // -- Joined Date Display
                    Text.rich(
                      TextSpan(
                        text: 'Joined ',
                        style: const TextStyle(fontSize: 12),
                        children: [
                          TextSpan(
                            text: '${DateTime.now().day} ${DateFormat.MMMM().format(DateTime.now())} ${DateTime.now().year}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Text fields
  Widget _buildTextField({
    required String label,
    required IconData icon,
    bool obscureText = false,
    required Function(String) onChanged,
  }) {
    return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      ),
      onChanged: onChanged,
    );
  }

  Future<void> imagePickerMethod() async {
    final picker = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (picker != null) {
      setState(() {
        image = picker;
      });
    }
  }
}