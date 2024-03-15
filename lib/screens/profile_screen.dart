import 'package:flutter/material.dart';
import '../models/user.dart';
import '../utils/mock_data.dart';

class ProfileScreen extends StatelessWidget {
  final User user = mockUser; // Using mock data

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name), // Display mock user's name
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Email: ${user.email}'),
            Text('Phone Verified: ${user.isPhoneVerified ? "Yes" : "No"}'),
            // More attrb below
          ],
        ),
      ),
    );
  }
}
