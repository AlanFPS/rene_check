import 'package:flutter/material.dart';
import '../models/user.dart';
import '../utils/mock_data.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final User user = mockUser; // Using mock data for now
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name), // Mock user's name
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            TextFormField(
              initialValue: user.name,
              decoration: InputDecoration(labelText: 'Name'),
              onSaved: (value) {
                // Update user name
                setState(() {
                  user.name = value ?? user.name;
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null; // If the form is valid
              },
            ),
            TextFormField(
              initialValue: user.email,
              decoration: InputDecoration(labelText: 'Email'),
              onSaved: (value) {
                // Update user email
                setState(() {
                  user.email = value ?? user.email;
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
            // More form fields below
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('Profile Updated')));
                }
              },
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
