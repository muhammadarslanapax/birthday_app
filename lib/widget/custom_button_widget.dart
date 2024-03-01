import 'package:birthday_app/consts/app_color.dart';
import 'package:birthday_app/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CButton extends StatelessWidget {
  final String text;
  final Function()? ontab;
  final double? btnwidth;
  final double? btnheight;
  final Color? txtcolor;
  final Color? bgcolor;
  final double? fontsize;
  final double? borderradius;
  final bool shadow;
  final Gradient? gradient;
  final FontWeight? fontWeight;

  const CButton(
      {super.key,
      required this.text,
      this.btnwidth,
      this.btnheight,
      this.txtcolor,
      this.bgcolor,
      this.fontsize,
      this.ontab,
      this.borderradius,
      this.shadow = false,
      this.fontWeight,
      this.gradient});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
          gradient: gradient,
          boxShadow: [
            if (shadow)
              BoxShadow(
                  blurRadius: 3,
                  // ..color: Colors.grey.withOpacity(0.25),
                  color: AppColor.secondary.withOpacity(0.3),
                  spreadRadius: 1,
                  offset: const Offset(0, 2))

            // change background color
          ],
          color: bgcolor ?? AppColor.primary,
          borderRadius: BorderRadius.circular(
              borderradius ?? AppStyle.defaultRadius(context))),
      width: btnwidth ?? width,
      height: btnheight ?? height * 0.07,
      child: InkWell(
        onTap: ontab,
        child: Center(
          child: Text(
            text,

            // change text color
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                  fontWeight: fontWeight ?? bold4,
                  color: txtcolor ?? AppColor.white,
                  fontSize: fontsize ?? AppStyle.smallsize(context)),
            ),
          ),
        ),
      ),
    );
  }
}
