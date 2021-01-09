import 'package:flutter/widgets.dart';
import 'package:vedanta_yoga/screens/complete_profile/complete_profile_screen.dart';
import 'package:vedanta_yoga/screens/forgot_password/forgot_password.dart';
import 'package:vedanta_yoga/screens/home/home_screen.dart';
import 'package:vedanta_yoga/screens/login_success/login_success_screen.dart';
import 'package:vedanta_yoga/screens/otp/otp_screen.dart';
import 'package:vedanta_yoga/screens/sign_in/sign_in.dart';
import 'package:vedanta_yoga/screens/sign_up/sign_up_screen.dart';
import 'package:vedanta_yoga/screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => new SplashScreen(),
  SignIn.routeName: (context) => new SignIn(),
  ForgotPasswordScreen.pathName: (context) => new ForgotPasswordScreen(),
  LoginSuccessScreen.pathName: (context) => new LoginSuccessScreen(),
  SignUpScreen.pathName: (context) => new SignUpScreen(),
  CompleteProfileScreen.pathName: (context) => new CompleteProfileScreen(),
  OTPScreen.pathName: (context) => new OTPScreen(),
  HomeScreen.pathName: (context) => new HomeScreen()
};
