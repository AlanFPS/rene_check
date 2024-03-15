import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rene_check/models/verification.dart';
import '../utils/mock_data.dart';

class VerificationScreen extends StatelessWidget {
  final Verification verification = mockVerification; // Using mock data

  @override
  Widget build(BuildContext context) {
    final dateFormatter = DateFormat('dd-MM-yyyy');

    return Scaffold(
        appBar: AppBar(
          title: Text('Verification Details'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Type: ${verification.userId}'),
              Text('ID: ${verification.type}'),
              Text(
                  'Status: ${verification.status ? "Verified" : "Not Verified"}'),
              Text(
                  'Verified on: ${dateFormatter.format(verification.verifiedOnDate)}'),
              // More attrb below
            ],
          ),
        ));
  }
}
