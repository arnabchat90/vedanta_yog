import 'package:flutter/material.dart';
import 'package:vedanta_yoga/shared/heading_text.dart';
import 'package:vedanta_yoga/size_config.dart';
import 'complete_profile_form.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text('Complete Profile', style: buildHeadingText()),
            SizedBox(
              height: getProportionateScreenHeight(5),
            ),
            Text(
              'Complete your details below \n or continue with social media',
              textAlign: TextAlign.center,
            ),
            CompleteProfileForm()
          ],
        ),
      ),
    );
  }
}
