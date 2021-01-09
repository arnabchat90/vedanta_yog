import 'package:flutter/material.dart';
import 'package:vedanta_yoga/screens/login_success/components/body.dart';

class LoginSuccessScreen extends StatelessWidget {
  static String pathName = '/login_success';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Success'),
      ),
      body: Body(),
    );
  }
}
