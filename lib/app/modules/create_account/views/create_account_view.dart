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
import '../controllers/create_account_controller.dart';

class CreateAccountView extends GetView<CreateAccountController> {
  const CreateAccountView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.offNamed(Routes.LOGIN_EMAIL);
              },
              icon: Icon(Icons.adaptive.arrow_back)),
        ),
        body: GetBuilder<CreateAccountController>(
            init: CreateAccountController(),
            builder: (obj) {
              return SizedBox(
                width: width,
                height: height,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.065, vertical: height * 0.02),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CText(
                        text: 'Create an account',
                        fontsize: AppStyle.headingsize(context),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Container(
                        padding: EdgeInsets.all(width * 0.035),
                        decoration: BoxDecoration(
                            color: AppColor.secondary,
                            borderRadius: BorderRadius.circular(width * 0.03)),
                        child: CText(
                          text:
                              'This will all syncing of data across devices and restoring data if you change devices.',
                          fontsize: AppStyle.smallsize(context),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Form(
                        key: obj.formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RectangularTextFormField(
                              controller: obj.nameController,
                              hint: 'Full Name',
                              hintcolor: Colors.grey,
                              prefixIcon: Transform.scale(
                                scale: 0.4,
                                child: SvgPicture.asset(
                                  'assets/icons/person_icon.svg',
                                ),
                              ),
                              validation: (value) {
                                return GetValidation.validate(value!, 'Name');
                              },
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            RectangularTextFormField(
                              controller: obj.emailController,
                              hint: 'Email',
                              hintcolor: Colors.grey,
                              prefixIcon: Transform.scale(
                                scale: 0.4,
                                child: SvgPicture.asset(
                                  'assets/images/mail_icon.svg',
                                ),
                              ),
                              validation: (value) {
                                return GetValidation.emaiValidation(
                                    obj.emailController);
                              },
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            RectangularTextFormField(
                              controller: obj.passwordController,
                              hint: 'Password',
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
                                return GetValidation.psdValidation(value!);
                              },
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            RectangularTextFormField(
                              controller: obj.confPasswordController,
                              hint: 'Confirm Password',
                              hintcolor: Colors.grey,
                              obscureText: obj.showPasswordconf,
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
                                    obj.visibilityconfig();
                                  },
                                  child: SvgPicture.asset(
                                    'assets/images/visibility_icon.svg',
                                  ),
                                ),
                              ),
                              validation: (value) {
                                return obj.passwordController.text ==
                                        obj.confPasswordController.text
                                    ? GetValidation.psdValidation(value!)
                                    : 'Passwords do not match';
                              },
                            ),
                          ],
                        ),
                      ),
                      CButton(
                        ontab: () {
                          FocusScope.of(context).unfocus();

                          obj.signUp();
                        },
                        text: 'Confirm',
                      ),
                      SizedBox(
                        width: width * 0.5,
                        child: CText(
                          text:
                              'By clicking the button you agree to our Terms of Service & Privacy Policy',
                          color: Colors.grey[600],
                          fontsize: 9,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: width * 0.018,
                            width: width * 0.018,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: AppColor.grey),
                          ),
                          SizedBox(
                            width: width * 0.01,
                          ),
                          Container(
                            height: width * 0.018,
                            width: width * 0.018,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: AppColor.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}
