import 'package:flutter/material.dart';
import 'package:vedanta_yoga/screens/sign_in/components/body.dart';

class SignIn extends StatelessWidget {
  static String routeName = '/sign_in';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text('Sign In'),
    );
  }
}
