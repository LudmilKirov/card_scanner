import 'package:flutter/material.dart';

const double buttonHeight = 48.0;
const double fieldCorners = 10.0;

const double extraSmall = 4.0;
const double small = 8.0;
const double medium = 16.0;
const double large = 24.0;
const double extraLarge = 32.0;

extension MarginExtensions on double {
  Widget toSpace({bool horizontally = true, bool vertically = true}) {
    assert(horizontally != false || vertically != false);
    return SizedBox(
      width: horizontally ? this : 0,
      height: vertically ? this : 0,
    );
  }
}
