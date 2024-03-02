import 'package:birthday_app/app/routes/app_pages.dart';
import 'package:birthday_app/utils/style.dart';
import 'package:birthday_app/utils/validation.dart';
import 'package:birthday_app/widget/cText.dart';
import 'package:birthday_app/widget/custom_button_widget.dart';
import 'package:birthday_app/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../controllers/login_email_controller.dart';

class LoginEmailView extends GetView<LoginEmailController> {
  const LoginEmailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final double height = MediaQuery.sizeOf(context).height;
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    Get.offNamed(Routes.LOGIN);
                  },
                  icon: const Icon(Icons.keyboard_arrow_left)),
            ),
            body: GetBuilder<LoginEmailController>(
                init: LoginEmailController(),
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
                            text: 'Sign In',
                            fontsize: AppStyle.headingsize(context),
                          ),
                          SizedBox(
                            height: height * 0.08,
                          ),
                          Form(
                            key: obj.formKey,
                            child: Column(
                              children: [
                                RectangularTextFormField(
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
                                SizedBox(
                                  height: height * 0.04,
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
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height * 0.1,
                            child: TextButton(
                                onPressed: () {
                                  Get.offNamed(Routes.FORGOT_PASSWORD);
                                },
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: CText(
                                    text: 'Forget Password ?',
                                    color: Colors.grey[600],
                                  ),
                                )),
                          ),
                          CButton(
                            ontab: () {
                              obj.login();
                            },
                            text: 'Sign in',
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CText(
                                  text: "Don't have an account?",
                                  color: Colors.grey[600],
                                ),
                                TextButton(
                                    onPressed: () {
                                      Get.offAllNamed(Routes.CREATE_ACCOUNT);
                                    },
                                    child: CText(
                                      text: 'Sign Up',
                                      color: Colors.grey[600],
                                    )),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                })));
  }
}
