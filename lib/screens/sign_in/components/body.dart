import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:vedanta_yoga/screens/sign_in/components/sign_in_form.dart';
import 'package:vedanta_yoga/shared/heading_text.dart';
import 'package:vedanta_yoga/shared/no_account_widget.dart';
import 'package:vedanta_yoga/shared/social_card.dart';
import 'package:vedanta_yoga/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(children: [
              Text(
                "Welcome Back",
                style: buildHeadingText(),
              ),
              SizedBox(height: getProportionateScreenHeight(10)),
              Text(
                "Sign in with your email and password \nor continue with your social media accounts",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: getProportionateScreenHeight(50)),
              FormBody(),
              SizedBox(height: getProportionateScreenHeight(100)),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FacebookLoginWidget(),
                    SocialCard(
                      icon: 'assets/animations/twitter.json',
                      press: () {},
                    ),
                    SocialCard(
                      icon: 'assets/animations/google.json',
                      press: () {},
                    )
                  ]),
              SizedBox(height: getProportionateScreenHeight(20)),
              NoAccountWidget()
            ]),
          ),
        ),
      ),
    );
  }
}

class FacebookLoginWidget extends StatefulWidget {
  @override
  _FacebookLoginState createState() => _FacebookLoginState();
}

class _FacebookLoginState extends State<FacebookLoginWidget> {
  static final FacebookLogin facebookSignIn = new FacebookLogin();

  Future<Null> _login() async {
    final FacebookLoginResult result = await facebookSignIn.logIn(['email']);
    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final FacebookAccessToken accessToken = result.accessToken;
        // print(accessToken.token);
        break;
      case FacebookLoginStatus.cancelledByUser:
        // print('Login cancelled by the user.');
        break;
      case FacebookLoginStatus.error:
        // print('Something went wrong with the login process.\n'
        // 'Here\'s the error Facebook gave us: ${result.errorMessage}');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SocialCard(
        icon: 'assets/animations/fb.json',
        press: () {
          _login();
        },
      ),
    );
  }
}
