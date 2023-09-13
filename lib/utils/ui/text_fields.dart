import 'package:card_scanner/res/colors.dart';
import 'package:card_scanner/res/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ParentTextField extends StatelessWidget {
  final String title;
  final Widget child;

  const ParentTextField({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return buildParentTextField();
  }

  Widget buildParentTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: GoogleFonts.openSans(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: primaryColor,
          ),
        ),
        extraSmall.toSpace(),
        child,
      ],
    );
  }
}
