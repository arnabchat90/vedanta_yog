import 'package:flutter/material.dart';
import 'package:vedanta_yoga/screens/home/components/body.dart';

class HomeScreen extends StatelessWidget {
  static String pathName = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
