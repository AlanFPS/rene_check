import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../models/user.dart';
import '../utils/mock_data.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final User user = mockUser; // Using mock data for now
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker(); // Instantiate ImagePicker

  Future<void> _pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        // Update user's profile picture URL with new image
        // In real app I'd update the user's profile picture URL with server
        user.profilePictureUrl = pickedFile.path;
      });
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
                        ? NetworkImage(user.profilePictureUrl)
                        : null, // Display the user's profile picture
                    backgroundColor: Colors.grey[200], // Placeholder color
                    child: user.profilePictureUrl.isEmpty
                        ? Icon(Icons.camera_alt, size: 40)
                        : null, // Show camera icon if no profile picture
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
