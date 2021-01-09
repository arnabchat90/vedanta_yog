import 'package:flutter/material.dart';
import 'package:vedanta_yoga/screens/forgot_password/forgot_password.dart';
import 'package:vedanta_yoga/screens/login_success/login_success_screen.dart';
import 'package:vedanta_yoga/shared/custom_suffix_icon.dart';
import 'package:vedanta_yoga/shared/default_button.dart';
import 'package:vedanta_yoga/shared/form_errors.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class FormBody extends StatefulWidget {
  @override
  _FormBodyState createState() => _FormBodyState();
}

class _FormBodyState extends State<FormBody> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  bool remember = false;
  final List<String> errors = [];
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
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
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            TextFormField(
              obscureText: true,
              onSaved: (value) => password = value,
              onChanged: (value) {
                if (value.isNotEmpty && errors.contains(kPassNullError)) {
                  setState(() {
                    errors.remove(kPassNullError);
                  });
                  return "";
                } else if (value.length >= 8 &&
                    errors.contains(kShortPassError)) {
                  setState(() {
                    errors.remove(kShortPassError);
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
                } else if (value.length < 8 &&
                    !errors.contains(kShortPassError)) {
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
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            FormError(errors: errors),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            Row(children: <Widget>[
              Checkbox(
                  value: remember,
                  activeColor: vPrimaryColour,
                  onChanged: (val) {
                    setState(() {
                      remember = val;
                    });
                  }),
              Text('Remember Me'),
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.popAndPushNamed(
                    context, ForgotPasswordScreen.pathName),
                child: Text(
                  'Forgot Password',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ]),
            DefaultButton(
                text: 'Continue',
                press: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    //if valid login redirect to login success or throw error
                    Navigator.pushNamed(context, LoginSuccessScreen.pathName);
                  }
                })
          ],
        ));
  }
}
