import 'package:flutter/material.dart';
import 'package:vedanta_yoga/shared/custom_suffix_icon.dart';
import 'package:vedanta_yoga/shared/default_button.dart';
import 'package:vedanta_yoga/shared/dialog_with_text.dart';
import 'package:vedanta_yoga/shared/form_errors.dart';
import 'package:vedanta_yoga/shared/no_account_widget.dart';
import 'package:vedanta_yoga/size_config.dart';

import '../../../constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          SizedBox(height: SizeConfig.screenHeight * 0.04),
          Text(
            'Forgot Password',
            style: TextStyle(
                fontSize: getProportionateScreenWidth(28),
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          Text(
            'Please enter your email and we will \n send you a link to reset your password',
            textAlign: TextAlign.center,
          ),
          ForgotPasswordForm()
        ],
      ),
    );
  }
}

class ForgotPasswordForm extends StatefulWidget {
  @override
  _ForgotPasswordFormState createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  String email;
  List<String> errors = [];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(height: SizeConfig.screenHeight * 0.04),
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
                } else if (!emailValidatorRegExp.hasMatch(value) &&
                    !errors.contains(kInvalidEmailError)) {
                  setState(() {
                    errors.add(kInvalidEmailError);
                  });
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
            FormError(errors: errors),
            SizedBox(height: SizeConfig.screenHeight * 0.1),
            DefaultButton(
                text: 'Continue',
                press: () {
                  if (_formKey.currentState.validate() && errors.length == 0) {
                    //logic for actually resetting password
                    //TBD
                    showDialog(
                        context: context,
                        builder: (context) {
                          return TextDialogWithoutButtons(
                            text:
                                'We are yet to build this feature \n stay tuned to get this feature ',
                          );
                        });
                  }
                }),
            SizedBox(height: SizeConfig.screenHeight * 0.1),
            NoAccountWidget()
          ],
        ),
      ),
    );
  }
}
