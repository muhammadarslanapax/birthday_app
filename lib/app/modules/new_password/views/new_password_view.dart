import 'package:birthday_app/app/modules/new_password/controllers/new_password_controller.dart';
import 'package:birthday_app/app/routes/app_pages.dart';
import 'package:birthday_app/consts/app_color.dart';
import 'package:birthday_app/utils/style.dart';
import 'package:birthday_app/utils/validation.dart';
import 'package:birthday_app/widget/cText.dart';
import 'package:birthday_app/widget/custom_button_widget.dart';
import 'package:birthday_app/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class NewPasswordView extends GetView<NewPasswordController> {
  const NewPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: GetBuilder<NewPasswordController>(
          init: NewPasswordController(),
          builder: (obj) {
            return Scaffold(
                resizeToAvoidBottomInset: false,
                appBar: obj.startLoading
                    ? null
                    : AppBar(
                        leading: IconButton(
                            onPressed: () {
                              Get.offNamed(Routes.FORGOT_PASSWORD);
                            },
                            icon: const Icon(Icons.keyboard_arrow_left)),
                      ),
                body: SizedBox(
                  width: width,
                  height: height,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.065, vertical: height * 0.06),
                    child: obj.startLoading
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: width * 0.3,
                                height: width * 0.3,
                                child: CircularProgressIndicator(
                                  backgroundColor:
                                      AppColor.loadingGreen.withOpacity(0.3),
                                  color: AppColor.loadingGreen,
                                  strokeWidth: width * 0.035,
                                  strokeCap: StrokeCap.round,
                                ),
                              ),
                              SizedBox(
                                height: height * 0.05,
                              ),
                              CText(
                                text: 'Just a moment',
                                fontsize: AppStyle.headingsize(context),
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              CText(
                                text: 'New Password',
                                fontsize: AppStyle.headingsize(context),
                              ),
                              SizedBox(
                                height: height * 0.12,
                              ),
                              Form(
                                key: obj.formKey,
                                child: Column(
                                  children: [
                                    RectangularTextFormField(
                                      controller: obj.passwordController,
                                      hint: 'Enter New Password',
                                      hintcolor: Colors.grey,
                                      obscureText: obj.showPassword,
                                      prefixIcon: Transform.scale(
                                        scale: 0.4,
                                        child: SvgPicture.asset(
                                          'assets/images/lock_icon.svg',
                                        ),
                                      ),
                                      suffixIcon: Transform.scale(
                                        scale: 0.4,
                                        child: InkWell(
                                          onTap: () {
                                            obj.visibility();
                                          },
                                          child: SvgPicture.asset(
                                            'assets/images/visibility_icon.svg',
                                          ),
                                        ),
                                      ),
                                      validation: (value) {
                                        return GetValidation.psdValidation(
                                            value!);
                                      },
                                    ),
                                    SizedBox(
                                      height: height * 0.03,
                                    ),
                                    RectangularTextFormField(
                                      controller: obj.confPasswordController,
                                      hint: 'Confirm Password',
                                      hintcolor: Colors.grey,
                                      obscureText: obj.showPassword,
                                      prefixIcon: Transform.scale(
                                        scale: 0.4,
                                        child: SvgPicture.asset(
                                          'assets/images/lock_icon.svg',
                                        ),
                                      ),
                                      suffixIcon: Transform.scale(
                                        scale: 0.4,
                                        child: InkWell(
                                          onTap: () {
                                            obj.visibility();
                                          },
                                          child: SvgPicture.asset(
                                            'assets/images/visibility_icon.svg',
                                          ),
                                        ),
                                      ),
                                      validation: (value) {
                                        return obj.passwordController.text ==
                                                obj.confPasswordController.text
                                            ? GetValidation.psdValidation(
                                                value!)
                                            : 'Passwords do not match';
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: height * 0.12,
                              ),
                              CButton(
                                ontab: () {
                                  obj.showLoading();
                                },
                                text: 'Sign in',
                              ),
                            ],
                          ),
                  ),
                ));
          }),
    );
  }
}
