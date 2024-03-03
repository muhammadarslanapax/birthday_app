import 'package:birthday_app/consts/app_color.dart';
import 'package:birthday_app/utils/style.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RectangularTextFormField extends StatelessWidget {
  final int? maxline;
  final double? height;
  final double? hintSize;
  final double? borderradius;
  final double? borderwidth;
  final double? focusborderwidth;
  final String? hint;
  final String? label;
  final bool? showlabel;
  final bool? obscureText;
  final bool? filled;
  final bool? isCollapsed;
  final bool? isDense;
  final bool? isEnabled;
  final bool? readOnly;
  final Color? fillColor;
  final Color? hintcolor;
  final Color? labelcolor;
  final Color? inputcolor;
  final Color? bordercolor;
  final Color? focusbordercolor;
  final Color? cursorcolor;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType? keyboardtype;
  final TextInputAction? inputaction;
  final AutovalidateMode? autoValidateMode;
  void Function()? onTap;
  void Function(String)? onChanged;
  final TextEditingController? controller;
  final String? Function(String?)? validation;

  RectangularTextFormField({
    super.key,
    this.maxline,
    this.height,
    this.hintSize,
    this.borderradius,
    this.borderwidth,
    this.focusborderwidth,
    this.hint,
    this.label,
    this.showlabel,
    this.obscureText,
    this.filled,
    this.isCollapsed,
    this.isDense,
    this.isEnabled,
    this.readOnly,
    this.fillColor,
    this.hintcolor,
    this.labelcolor,
    this.inputcolor,
    this.bordercolor,
    this.focusbordercolor,
    this.cursorcolor,
    this.suffixIcon,
    this.prefixIcon,
    this.keyboardtype,
    this.inputaction,
    this.autoValidateMode,
    this.onTap,
    this.onChanged,
    this.controller,
    this.validation,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return TextFormField(
      controller: controller,
      onTap: onTap,
      obscureText: obscureText ?? false,
      cursorColor: cursorcolor ?? Colors.black,
      maxLines: /*obscureText == true ? 1 :*/ maxline ?? 1,
      textInputAction: inputaction,
      style: TextStyle(
        fontWeight: FontWeight.normal,
        color: inputcolor ?? Colors.black,
      ),
      autofocus: false,
      keyboardType: keyboardtype,
      onChanged: onChanged,
      autovalidateMode: autoValidateMode ?? AutovalidateMode.disabled,
      readOnly: readOnly ?? false,
      enabled: isEnabled ?? true,
      decoration: InputDecoration(
        hintText: showlabel ?? false ? null : hint,
        label: showlabel ?? false
            ? Text(
                label!,
                style: TextStyle(
                  color: labelcolor,
                ),
              )
            : null,
        hintStyle: TextStyle(
            color: hintcolor,
            fontSize: hintSize ?? AppStyle.smallsize(context)),

        filled: true,
        fillColor: isEnabled == false ? Colors.grey : Colors.white,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10, 20.0, 10),
        errorMaxLines: 2,
        isCollapsed: isCollapsed ?? false,
        isDense: isDense,

        // Border States
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: bordercolor ?? Colors.grey, width: borderwidth ?? 1),
            borderRadius: BorderRadius.circular(borderradius ?? width * 0.035)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: focusbordercolor ?? AppColor.primary,
              width: focusborderwidth ?? 2,
            ),
            borderRadius: BorderRadius.circular(borderradius ?? width * 0.035)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: focusborderwidth ?? 2,
            ),
            borderRadius: BorderRadius.circular(borderradius ?? width * 0.035)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: focusborderwidth ?? 2,
            ),
            borderRadius: BorderRadius.circular(borderradius ?? width * 0.035)),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
              width: focusborderwidth ?? 2,
            ),
            borderRadius: BorderRadius.circular(borderradius ?? width * 0.035)),
      ),
      validator: validation,
    );
  }
}
