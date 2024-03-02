import 'package:birthday_app/app/routes/app_pages.dart';
import 'package:birthday_app/utils/style.dart';
import 'package:birthday_app/utils/validation.dart';
import 'package:birthday_app/widget/cText.dart';
import 'package:birthday_app/widget/custom_button_widget.dart';
import 'package:birthday_app/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.offNamed(Routes.LOGIN_EMAIL);
            },
            icon: const Icon(Icons.keyboard_arrow_left)),
      ),
      body: GetBuilder<ForgotPasswordController>(
          init: ForgotPasswordController(),
          builder: (obj) {
            return SizedBox(
              width: width,
              height: height,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.065, vertical: height * 0.06),
                child: Column(
                  children: [
                    CText(
                      text: 'Forgot Password',
                      fontsize: AppStyle.headingsize(context),
                    ),
                    SizedBox(
                      height: height * 0.07,
                    ),
                    SizedBox(
                      height: height * 0.08,
                      child: CText(
                        text: 'Enter Email Adress',
                        fontsize: AppStyle.bodysize(context),
                      ),
                    ),
                    Form(
                      key: obj.formKey,
                      child: RectangularTextFormField(
                        controller: obj.emailController,
                        hint: 'Email or Username',
                        hintcolor: Colors.grey,
                        prefixIcon: Transform.scale(
                          scale: 0.4,
                          child: SvgPicture.asset(
                            'assets/icons/person_icon.svg',
                          ),
                        ),
                        validation: (value) {
                          return GetValidation.emaiValidation(
                              obj.emailController);
                        },
                      ),
                    ),
                    SizedBox(
                      height: height * 0.15,
                      child: TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: CText(
                            text: 'Back to sign in',
                            color: Colors.grey[600],
                          )),
                    ),
                    CButton(
                      ontab: () {
                        obj.sendOtp();
                      },
                      text: 'Send',
                    ),
                  ],
                ),
              ),
            );
          }),
    ));
  }
}
