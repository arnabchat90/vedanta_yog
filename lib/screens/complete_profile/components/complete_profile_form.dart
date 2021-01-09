import 'package:flutter/material.dart';
import 'package:vedanta_yoga/screens/otp/otp_screen.dart';
import 'package:vedanta_yoga/shared/custom_suffix_icon.dart';
import 'package:vedanta_yoga/shared/default_button.dart';
import 'package:vedanta_yoga/shared/form_errors.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class CompleteProfileForm extends StatefulWidget {
  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String firstName;
  String lastName;
  int phoneNumber;
  String address;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Column(
          children: [
            SizedBox(
              height: SizeConfig.screenHeight * .04,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              onSaved: (value) => firstName = value,
              onChanged: (value) {
                if (value.isNotEmpty && errors.contains(kNamefNullError)) {
                  setState(() {
                    errors.remove(kNamefNullError);
                  });
                }
              },
              validator: (value) {
                if (value.isEmpty && !errors.contains(kNamefNullError)) {
                  setState(() {
                    errors.add(kNamefNullError);
                  });
                  return "";
                }
                return null;
              },
              decoration: InputDecoration(
                  hintText: 'Enter your First Name',
                  labelText: 'First Name',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  suffixIcon: CustomSuffixIcon(
                    svgIcon: 'assets/icons/User.svg',
                  )),
            ),
            SizedBox(
              height: SizeConfig.screenHeight * .02,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              onSaved: (value) => firstName = value,
              onChanged: (value) {
                if (value.isNotEmpty && errors.contains(kNamelNullError)) {
                  setState(() {
                    errors.remove(kNamelNullError);
                  });
                }
              },
              validator: (value) {
                if (value.isEmpty && !errors.contains(kNamelNullError)) {
                  setState(() {
                    errors.add(kNamelNullError);
                  });
                  return "";
                }
                return null;
              },
              decoration: InputDecoration(
                  hintText: 'Enter your Last Name',
                  labelText: 'Last Name',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  suffixIcon: CustomSuffixIcon(
                    svgIcon: 'assets/icons/User.svg',
                  )),
            ),
            SizedBox(
              height: SizeConfig.screenHeight * .04,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              onSaved: (value) => phoneNumber = int.parse(value),
              onChanged: (value) {
                if (value.isNotEmpty &&
                    errors.contains(kPhoneNumberNullError)) {
                  setState(() {
                    errors.remove(kPhoneNumberNullError);
                  });
                }
              },
              validator: (value) {
                if (value.isEmpty && !errors.contains(kPhoneNumberNullError)) {
                  setState(() {
                    errors.add(kPhoneNumberNullError);
                  });
                  return "";
                }
                return null;
              },
              decoration: InputDecoration(
                  hintText: 'Enter your Phone Number',
                  labelText: 'Phone Number',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  suffixIcon: CustomSuffixIcon(
                    svgIcon: 'assets/icons/Phone.svg',
                  )),
            ),
            SizedBox(
              height: SizeConfig.screenHeight * .04,
            ),
            TextFormField(
              keyboardType: TextInputType.multiline,
              maxLines: 5,
              onSaved: (value) => address = value,
              onChanged: (value) {
                if (value.isNotEmpty && errors.contains(kAddressNullError)) {
                  setState(() {
                    errors.remove(kAddressNullError);
                  });
                }
              },
              validator: (value) {
                if (value.isEmpty && !errors.contains(kAddressNullError)) {
                  setState(() {
                    errors.add(kAddressNullError);
                  });
                  return "";
                }
                return null;
              },
              decoration: InputDecoration(
                  hintText: 'Enter your full Address',
                  labelText: 'Address',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  suffixIcon: CustomSuffixIcon(
                    svgIcon: 'assets/icons/Location.svg',
                  )),
            ),
            FormError(errors: errors),
            SizedBox(
              height: SizeConfig.screenHeight * .02,
            ),
            DefaultButton(
              text: 'Continue',
              press: () {
                if (_formKey.currentState.validate()) {
                  //go to otp screen
                  Navigator.pushNamed(context, OTPScreen.pathName);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
