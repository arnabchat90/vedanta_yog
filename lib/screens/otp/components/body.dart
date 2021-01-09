import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:vedanta_yoga/constants.dart';
import 'package:vedanta_yoga/shared/heading_text.dart';
import 'package:vedanta_yoga/size_config.dart';

import 'otp_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: SizeConfig.screenHeight * .06,
              ),
              Text(
                'OTP verification',
                style: buildHeadingText(),
              ),
              Text('We will send your code to +919966****'),
              buildTimer(),
              SizedBox(
                height: getProportionateScreenHeight(80),
              ),
              OTPForm()
            ],
          ),
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text('This code will expire in '),
      TweenAnimationBuilder(
        tween: Tween(begin: 30.0, end: 0.0),
        duration: Duration(seconds: 30),
        builder: (context, value, child) {
          return Text(
            "00:${value.toInt()}",
            style: TextStyle(color: vPrimaryColour),
          );
        },
        onEnd: () {},
      ),
    ]);
  }
}
