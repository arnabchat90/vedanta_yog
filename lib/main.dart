import 'package:flutter/material.dart';
import 'package:vedanta_yoga/routes.dart';
import 'package:vedanta_yoga/screens/splash/splash_screen.dart';
import 'package:vedanta_yoga/theme.dart';

void main() {
  runApp(VedantaYogaApp());
}

class VedantaYogaApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vedanta Yoga',
      theme: theme(),
      // home: SplashScreen(),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
