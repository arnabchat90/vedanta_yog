import 'package:flutter/material.dart';
import 'package:vedanta_yoga/screens/otp/components/body.dart';

class OTPScreen extends StatelessWidget {
  static String pathName = '/otp_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP Verification'),
      ),
      body: Body(),
    );
  }
}
