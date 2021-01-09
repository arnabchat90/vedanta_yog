import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vedanta_yoga/size_config.dart';
import 'package:vedanta_yoga/constants.dart';

class SplashContainer extends StatelessWidget {
  const SplashContainer({
    Key key,
    this.text,
    this.image,
    this.type,
  }) : super(key: key);
  final String text, image, type;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        Text(
          "VEDANTA YOGA",
          style: TextStyle(
              fontSize: getProportionateScreenWidth(36),
              color: vPrimaryColour,
              fontWeight: FontWeight.bold),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
        ),
        Spacer(
          flex: 2,
        ),
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          child: type == 'animation'
              ? Lottie.asset(image)
              : Image.asset(
                  image,
                  fit: BoxFit.fill,
                  height: getProportionateScreenHeight((285)),
                  width: getProportionateScreenWidth(265),
                ),
        ),
      ],
    );
  }
}
