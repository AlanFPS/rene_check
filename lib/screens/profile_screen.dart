import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../models/user.dart';
import '../utils/mock_data.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final User user = mockUser; // Using mock data for now
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker(); // Instantiate ImagePicker

  Future<void> _pickImage() async {
    var status = await Permission.storage.status; // Use storage for Android
    if (!status.isGranted) {
      status = await Permission.storage.request();
    }

    if (status.isGranted) {
      final XFile? pickedFile =
          await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          user.profilePictureUrl = pickedFile.path;
        });
      }
    } else {
      print('Gallery permission is denied.');
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Gallery permission is denied.')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: GestureDetector(
                  onTap: _pickImage,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: user.profilePictureUrl.isNotEmpty
                        ? FileImage(File(user.profilePictureUrl))
                            as ImageProvider
                        : null,
                    backgroundColor: Colors.grey[200],
                    child: user.profilePictureUrl.isEmpty
                        ? Icon(Icons.camera_alt,
                            size: 30,
                            color: const Color.fromARGB(255, 61, 61, 61))
                        : null,
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                initialValue: user.name,
                decoration: InputDecoration(
                  labelText: 'Name',
                  icon: Icon(Icons.person),
                  hintText: 'Enter your full name',
                ),
                onSaved: (value) {
                  setState(() {
                    user.name = value ?? user.name;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              TextFormField(
                initialValue: user.email,
                decoration: InputDecoration(
                  labelText: 'Email',
                  icon: Icon(Icons.email),
                  hintText: 'Enter your email address',
                ),
                onSaved: (value) {
                  setState(() {
                    user.email = value ?? user.email;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty || !value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Profile Updated')));
                  }
                },
                child: Text('Save Changes'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
