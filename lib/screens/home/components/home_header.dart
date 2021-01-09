import 'package:flutter/material.dart';
import 'package:vedanta_yoga/shared/icon_with_notificcation.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
          width: SizeConfig.screenWidth * .6,
          // height: 50,
          decoration: BoxDecoration(
            color: vSecondaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextField(
            onChanged: (value) {},
            decoration: InputDecoration(
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: 'Search Services',
              prefixIcon: Icon(Icons.search),
              contentPadding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20),
                  vertical: getProportionateScreenHeight(11)),
            ),
          ),
        ),
        IconWithNotification(
          iconPath: 'assets/icons/Cart Icon.svg',
          press: () {},
          noOfItems: 0,
        ),
        IconWithNotification(
          iconPath: 'assets/icons/Bell.svg',
          press: () {},
          noOfItems: 3,
        ),
      ]),
    );
  }
}
