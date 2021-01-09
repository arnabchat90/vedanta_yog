import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../size_config.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    Key key,
    this.primaryText,
    this.secondartText,
  }) : super(key: key);
  final String primaryText;
  final String secondartText;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            height: 90,
            width: double.infinity,
            margin: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: Lottie.asset('assets/animations/snow3.json',
                repeat: true, fit: BoxFit.contain)),
        Container(
            margin: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            height: 90,
            width: double.infinity,
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
                vertical: getProportionateScreenHeight(15)),
            decoration: BoxDecoration(
                color: Color(0xFF4A3298).withOpacity(0.1),
                borderRadius: BorderRadius.circular(20)),
            child: Text.rich(
              TextSpan(
                  text: '$primaryText\n',
                  style: TextStyle(color: Colors.deepPurple),
                  children: [
                    TextSpan(
                        text: secondartText,
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                  ]),
            )),
      ],
    );
  }
}
