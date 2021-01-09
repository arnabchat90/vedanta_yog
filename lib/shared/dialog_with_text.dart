import 'package:flutter/material.dart';

import '../size_config.dart';

class TextDialogWithoutButtons extends StatelessWidget {
  const TextDialogWithoutButtons({
    Key key,
    this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 16,
      child: Container(
        height: SizeConfig.screenHeight * .4,
        child: Padding(
          padding: EdgeInsets.all(getProportionateScreenWidth(20)),
          child: Column(children: [
            Spacer(),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: getProportionateScreenHeight(16),
                  fontWeight: FontWeight.bold,
                  color: Colors.red),
            ),
            Spacer(),
          ]),
        ),
      ),
    );
  }
}
