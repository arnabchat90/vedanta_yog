import 'package:flutter/material.dart';
import 'package:vedanta_yoga/screens/sign_up/sign_up_screen.dart';

import '../constants.dart';
import '../size_config.dart';

class NoAccountWidget extends StatelessWidget {
  const NoAccountWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Text(
        'Don\'t have an account?',
        style: TextStyle(fontSize: getProportionateScreenWidth(16)),
      ),
      GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, SignUpScreen.pathName);
        },
        child: Text(
          ' Sign Up',
          style: TextStyle(
              fontSize: getProportionateScreenWidth(16), color: vPrimaryColour),
        ),
      )
    ]);
  }
}
