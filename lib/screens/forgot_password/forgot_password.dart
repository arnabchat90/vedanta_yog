import 'package:flutter/material.dart';
import 'package:vedanta_yoga/screens/forgot_password/components/body.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static String pathName = '/forgot_password';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
      ),
      body: Body(),
    );
  }
}
