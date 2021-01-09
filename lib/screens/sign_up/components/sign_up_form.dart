import 'package:flutter/material.dart';
import 'package:vedanta_yoga/screens/complete_profile/complete_profile_screen.dart';
import 'package:vedanta_yoga/shared/custom_suffix_icon.dart';
import 'package:vedanta_yoga/shared/default_button.dart';
import 'package:vedanta_yoga/shared/form_errors.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  String confirmPassword;
  final List<String> errors = [];
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(children: <Widget>[
        SizedBox(height: getProportionateScreenHeight(10)),
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          onSaved: (value) => email = value,
          onChanged: (value) {
            if (value.isNotEmpty && errors.contains(kEmailNullError)) {
              setState(() {
                errors.remove(kEmailNullError);
              });
            } else if (emailValidatorRegExp.hasMatch(value) &&
                errors.contains(kInvalidEmailError)) {
              setState(() {
                errors.remove(kInvalidEmailError);
              });
            }
          },
          validator: (value) {
            if (value.isEmpty && !errors.contains(kEmailNullError)) {
              setState(() {
                errors.add(kEmailNullError);
              });
              return "";
            } else if (!emailValidatorRegExp.hasMatch(value) &&
                !errors.contains(kInvalidEmailError)) {
              setState(() {
                errors.add(kInvalidEmailError);
              });
              return "";
            }
            return null;
          },
          decoration: InputDecoration(
              hintText: 'Enter your email',
              labelText: 'Email',
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSuffixIcon(
                svgIcon: 'assets/icons/Mail.svg',
              )),
        ),
        SizedBox(height: getProportionateScreenHeight(30)),
        TextFormField(
          obscureText: true,
          onSaved: (value) => password = value,
          onChanged: (value) {
            if (value.isNotEmpty && errors.contains(kPassNullError)) {
              setState(() {
                errors.remove(kPassNullError);
              });
              return "";
            } else if (value.length >= 8 && errors.contains(kShortPassError)) {
              setState(() {
                errors.remove(kShortPassError);
              });
              return "";
            }
            password = value;
          },
          validator: (value) {
            if (value.isEmpty && !errors.contains(kPassNullError)) {
              setState(() {
                errors.add(kPassNullError);
              });
              return "";
            } else if (value.length < 8 && !errors.contains(kShortPassError)) {
              setState(() {
                errors.add(kShortPassError);
              });
              return "";
            }
            return null;
          },
          decoration: InputDecoration(
              hintText: 'Enter your password',
              labelText: 'Password',
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSuffixIcon(
                svgIcon: 'assets/icons/Lock.svg',
              )),
        ),
        SizedBox(height: getProportionateScreenHeight(30)),
        TextFormField(
          obscureText: true,
          onSaved: (value) => confirmPassword = value,
          onChanged: (value) {
            if (value.isNotEmpty && errors.contains(kPassNullError)) {
              setState(() {
                errors.remove(kPassNullError);
              });
              return "";
            } else if (value == password && errors.contains(kMatchPassError)) {
              setState(() {
                errors.remove(kMatchPassError);
              });
              return "";
            }
          },
          validator: (value) {
            if (value.isEmpty && !errors.contains(kPassNullError)) {
              setState(() {
                errors.add(kPassNullError);
              });
              return "";
            } else if (value != password && !errors.contains(kMatchPassError)) {
              setState(() {
                errors.add(kMatchPassError);
              });
              return "";
            }
            return null;
          },
          decoration: InputDecoration(
              hintText: 'Confirm your password',
              labelText: 'Confirm Password',
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSuffixIcon(
                svgIcon: 'assets/icons/Lock.svg',
              )),
        ),
        SizedBox(height: getProportionateScreenHeight(20)),
        FormError(errors: errors),
        SizedBox(height: getProportionateScreenHeight(10)),
        DefaultButton(
          text: 'Continue',
          press: () {
            if (_formKey.currentState.validate()) {
              // if valid then register user and continue to complete profile
              Navigator.pushNamed(context, CompleteProfileScreen.pathName);
            }
          },
        ),
        SizedBox(height: getProportionateScreenHeight(20)),
      ]),
    );
  }
}
