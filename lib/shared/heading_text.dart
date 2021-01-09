import 'package:flutter/material.dart';
import '../size_config.dart';

TextStyle buildHeadingText() {
  return TextStyle(
      color: Colors.black,
      fontSize: getProportionateScreenWidth(28),
      fontWeight: FontWeight.bold);
}
