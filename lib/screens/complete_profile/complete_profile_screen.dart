import 'package:flutter/material.dart';
import 'package:vedanta_yoga/screens/complete_profile/components/body.dart';

class CompleteProfileScreen extends StatelessWidget {
  static String pathName = '/complete_profile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Complete Your Information'),
      ),
      body: Body(),
    );
  }
}
