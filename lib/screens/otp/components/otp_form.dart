import 'package:flutter/material.dart';
import 'package:vedanta_yoga/shared/default_button.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class OTPForm extends StatefulWidget {
  @override
  _OTPFormState createState() => _OTPFormState();
}

class _OTPFormState extends State<OTPForm> {
  FocusNode pin2FocusNode;
  FocusNode pin3FocusNode;
  FocusNode pin4FocusNode;

  @override
  void initState() {
    super.initState();
    pin2FocusNode = new FocusNode();
    pin3FocusNode = new FocusNode();
    pin4FocusNode = new FocusNode();
  }

  @override
  void dispose() {
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
    super.dispose();
  }

  void nextField({String value, FocusNode focusNode}) {
    if (value.length == 1) {
      focusNode.nextFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            OtpTextBox(
              autoFocus: true,
              nextField: nextField,
              focusNode: null,
              nextFocusNode: pin2FocusNode,
            ),
            OtpTextBox(
              autoFocus: false,
              nextField: nextField,
              focusNode: pin2FocusNode,
              nextFocusNode: pin3FocusNode,
            ),
            OtpTextBox(
              autoFocus: false,
              nextField: nextField,
              focusNode: pin3FocusNode,
              nextFocusNode: pin4FocusNode,
            ),
            OtpTextBox(
              autoFocus: false,
              nextField: nextField,
              focusNode: pin4FocusNode,
              nextFocusNode: null,
            )
          ]),
          SizedBox(
            height: SizeConfig.screenHeight * .15,
          ),
          DefaultButton(
            text: 'Continue',
            press: () {},
          ),
          SizedBox(
            height: SizeConfig.screenHeight * .04,
          ),
          GestureDetector(
            onTap: () {
              //write logic to resend otp and start timer again
            },
            child: Text('Resend OTP',
                style: TextStyle(decoration: TextDecoration.underline)),
          )
        ],
      ),
    );
  }
}

class OtpTextBox extends StatelessWidget {
  const OtpTextBox({
    Key key,
    this.autoFocus,
    this.nextField,
    this.focusNode,
    this.nextFocusNode,
  }) : super(key: key);
  final bool autoFocus;
  final Function({String value, FocusNode focusNode}) nextField;
  final FocusNode focusNode;
  final FocusNode nextFocusNode;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: getProportionateScreenWidth(60),
        child: TextFormField(
          autofocus: autoFocus,
          obscureText: true,
          focusNode: focusNode,
          keyboardType: TextInputType.number,
          style: TextStyle(fontSize: 24),
          decoration: otpInputDecoration,
          textAlign: TextAlign.center,
          onChanged: (value) {
            if (nextFocusNode == null) {
              focusNode.unfocus();
            }
            nextField(value: value, focusNode: nextFocusNode);
          },
        ));
  }
}
