import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';
import '../size_config.dart';

class IconWithNotification extends StatelessWidget {
  const IconWithNotification({
    Key key,
    this.press,
    this.noOfItems,
    this.iconPath,
  }) : super(key: key);
  final GestureTapCallback press;
  final int noOfItems;
  final String iconPath;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      borderRadius: BorderRadius.circular(50),
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(12)),
            width: getProportionateScreenWidth(46),
            height: getProportionateScreenHeight(46),
            decoration: BoxDecoration(
              color: vSecondaryColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(iconPath),
          ),
          if (noOfItems != 0)
            Positioned(
              right: 0,
              top: -3,
              child: Container(
                width: getProportionateScreenWidth(14),
                height: getProportionateScreenHeight(14),
                decoration:
                    BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                child: Center(
                  child: Text(
                    noOfItems.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        height: 1,
                        fontSize: getProportionateScreenHeight(10)),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
