import 'package:birthday_app/app/routes/app_pages.dart';
import 'package:birthday_app/consts/app_color.dart';
import 'package:birthday_app/utils/style.dart';
import 'package:birthday_app/widget/cText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return SafeArea(
        child: Scaffold(
      body: GetBuilder<LoginController>(
          init: LoginController(),
          builder: (obj) {
            return SizedBox(
              width: width,
              height: height,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.065, vertical: height * 0.04),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/images/applogo.png',
                      width: width * 0.45,
                    ),
                    CText(
                      text: 'ChirpChime',
                      fontsize: AppStyle.headingsize(context),
                      fontWeight: FontWeight.w500,
                    ),
                    Container(
                      padding: EdgeInsets.all(width * 0.035),
                      decoration: BoxDecoration(
                          color: AppColor.secondary,
                          borderRadius: BorderRadius.circular(width * 0.03)),
                      child: CText(
                        text:
                            'Say Goodbye to the stress of remembering and planning for ever changing baby needs. Our app provides timely reminders and next steps for key changes in feeding, napping, and play, allowing you to fully enjoy the precious early years without worry.',
                        fontsize: AppStyle.smallsize(context),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.025,
                    ),
                    CustomButton(
                      onTap: () {},
                      imagePath: 'assets/images/fb_logo.svg',
                      text: 'Sign in with Facebook',
                      bgcolor: AppColor.btnblue,
                    ),
                    CustomButton(
                      onTap: () {},
                      imagePath: 'assets/images/google_logo.svg',
                      text: 'Sign in with Google',
                      textColor: AppColor.btngrey,
                      bgcolor: AppColor.btnwhite,
                      hasShadow: true,
                    ),
                    CustomButton(
                      onTap: () {},
                      imagePath: 'assets/images/apple_logo.svg',
                      text: 'Sign in with Apple',
                      bgcolor: AppColor.btngrey,
                    ),
                    TextButton(
                        onPressed: () {
                          Get.toNamed(Routes.LOGIN_EMAIL);
                        },
                        child: CText(
                          text: 'Sign in with Email',
                          color: Colors.grey[600],
                        ))
                  ],
                ),
              ),
            );
          }),
    ));
  }
}

class CustomButton extends StatelessWidget {
  final Function() onTap;
  final String text;
  final String imagePath;
  final Alignment? alignment;
  final Color? bgcolor;
  final Color? textColor;
  final bool hasShadow;
  final double? borderradius;

  const CustomButton(
      {super.key,
      required this.onTap,
      required this.text,
      required this.imagePath,
      this.alignment,
      this.bgcolor,
      this.textColor,
      this.hasShadow = false,
      this.borderradius});

  @override
  Widget build(BuildContext context) {
    final width1 = MediaQuery.of(context).size.width;
    final height1 = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: onTap,
      child: Container(
        width: width1 * 0.75,
        height: height1 * 0.065,
        decoration: BoxDecoration(boxShadow: [
          hasShadow
              ? BoxShadow(
                  offset: const Offset(0, 2),
                  blurRadius: 1,
                  spreadRadius: 1,
                  color: Colors.grey.withOpacity(0.5))
              : const BoxShadow()
        ], borderRadius: BorderRadius.circular(9), color: bgcolor),
        child: Center(
          child: Container(
            width: width1 * 0.55,
            alignment: Alignment.center,
            child: Row(
              children: [
                SvgPicture.asset(
                  imagePath,
                  width: width1 * 0.052,
                ),
                SizedBox(
                  width: width1 * 0.025,
                ),
                CText(
                  text: text,
                  color: textColor ?? Colors.white,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
