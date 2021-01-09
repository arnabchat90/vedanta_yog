import 'package:flutter/material.dart';
import 'package:vedanta_yoga/screens/splash/components/body.dart';
import 'package:vedanta_yoga/size_config.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = '/splash';
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
