import 'package:flutter/material.dart';
import 'package:vedanta_yoga/screens/home/home_screen.dart';
import 'package:vedanta_yoga/shared/default_button.dart';
import 'package:vedanta_yoga/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: SizeConfig.screenHeight * 0.04,
      ),
      Image.asset(
        'assets/images/success.png',
        height: SizeConfig.screenHeight * .4,
      ),
      SizedBox(
        height: SizeConfig.screenHeight * 0.04,
      ),
      Text(
        'Login Success',
        style: TextStyle(
            fontSize: getProportionateScreenWidth(30),
            fontWeight: FontWeight.bold,
            color: Colors.black),
      ),
      SizedBox(
        height: SizeConfig.screenHeight * 0.04,
      ),
      SizedBox(
          width: SizeConfig.screenWidth * .6,
          child: DefaultButton(
              text: 'Back To Home',
              press: () {
                // showDialog(
                //     context: context,
                //     builder: (context) {
                //       return TextDialogWithoutButtons(
                //         text:
                //             'We cant log you in yet, \n wait till we finish our brand new app',
                //       );
                //     });
                Navigator.pushNamed(context, HomeScreen.pathName);
              })),
    ]);
  }
}
