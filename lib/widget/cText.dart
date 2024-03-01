// custom_text
import 'package:birthday_app/utils/style.dart';
import 'package:flutter/material.dart';

class CText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontsize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextStyle? textStyle;

  const CText(
      {super.key,
      required this.text,
      this.color,
      this.fontsize,
      this.fontWeight,
      this.textStyle, // Added this line

      this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      //  overflow: TextOverflow.ellipsis,
      style: textStyle ??
          TextStyle(
              color: color,
              fontSize: fontsize ?? AppStyle.smallsize(context),
              fontWeight: fontWeight ?? bold4),
      textAlign: textAlign ?? TextAlign.center,
    );
  }
}
