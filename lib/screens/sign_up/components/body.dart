import 'package:flutter/material.dart';
import 'package:vedanta_yoga/screens/sign_up/components/sign_up_form.dart';
import 'package:vedanta_yoga/shared/heading_text.dart';
import 'package:vedanta_yoga/shared/social_card.dart';
import 'package:vedanta_yoga/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text(
                'Register Account',
                style: buildHeadingText(),
              ),
              SizedBox(height: getProportionateScreenHeight(10)),
              Text(
                'Complete your registration or \n continue with your social media account',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * .06),
              SignUpForm(),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SocialCard(
                      icon: 'assets/animations/fb.json',
                      press: () {},
                    ),
                    SocialCard(
                      icon: 'assets/animations/twitter.json',
                      press: () {},
                    ),
                    SocialCard(
                      icon: 'assets/animations/google.json',
                      press: () {},
                    )
                  ]),
              SizedBox(height: getProportionateScreenHeight(10)),
              Text(
                'By continuing you confirm that you agree \n with our terms and conditions',
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
