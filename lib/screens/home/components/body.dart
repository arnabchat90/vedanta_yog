import 'package:flutter/material.dart';
import 'package:vedanta_yoga/screens/home/components/section_title.dart';

import '../../../size_config.dart';
import 'categories.dart';
import 'discount_banner.dart';
import 'home_header.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            HomeHeader(),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            DiscountBanner(
              primaryText: 'A Winter Surprise',
              secondartText: 'Cashback 20%',
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            Categories(),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            SectionTitle(
              sectionName: 'Special offer for you',
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}
