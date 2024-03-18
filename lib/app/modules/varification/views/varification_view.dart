import 'package:birthday_app/app/routes/app_pages.dart';
import 'package:birthday_app/consts/app_color.dart';
import 'package:birthday_app/utils/style.dart';
import 'package:birthday_app/widget/cText.dart';
import 'package:birthday_app/widget/custom_button_widget.dart';
import 'package:birthday_app/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/varification_controller.dart';

class VarificationView extends GetView<VarificationController> {
  const VarificationView({Key? key}) : super(key: key);
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
              Get.offNamed(Routes.FORGOT_PASSWORD);
            },
            icon: const Icon(Icons.keyboard_arrow_left)),
      ),
      body: GetBuilder<VarificationController>(
          init: VarificationController(),
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
                      text: 'Verification',
                      fontsize: AppStyle.headingsize(context),
                    ),
                    SizedBox(
                      height: height * 0.07,
                    ),
                    SizedBox(
                      height: height * 0.08,
                      child: CText(
                        text: 'Enter Verification Code',
                        fontsize: AppStyle.bodysize(context),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.7,
                      child: Row(
                        children: [
                          Expanded(
                            child: RectangularTextFormField(
                              controller: obj.controllers[0],
                              focusNode: obj.focusNodes[0],
                              maxLength: 1,
                              borderradius: width * 0.2,
                              horizontalPadding: width * 0.048,
                              keyboardtype: TextInputType.number,
                              onChanged: (value) {
                                obj.onChanged(context, 0);
                              },
                            ),
                          ),
                          SizedBox(
                            width: width * 0.065,
                          ),
                          Expanded(
                            child: RectangularTextFormField(
                              controller: obj.controllers[1],
                              focusNode: obj.focusNodes[1],
                              maxLength: 1,
                              borderradius: width * 0.2,
                              horizontalPadding: width * 0.048,
                              keyboardtype: TextInputType.number,
                              onChanged: (value) {
                                obj.onChanged(context, 1);
                              },
                            ),
                          ),
                          SizedBox(
                            width: width * 0.065,
                          ),
                          Expanded(
                            child: RectangularTextFormField(
                              controller: obj.controllers[2],
                              focusNode: obj.focusNodes[2],
                              maxLength: 1,
                              borderradius: width * 0.2,
                              horizontalPadding: width * 0.048,
                              keyboardtype: TextInputType.number,
                              onChanged: (value) {
                                obj.onChanged(context, 2);
                              },
                            ),
                          ),
                          SizedBox(
                            width: width * 0.065,
                          ),
                          Expanded(
                            child: RectangularTextFormField(
                              controller: obj.controllers[3],
                              focusNode: obj.focusNodes[3],
                              maxLength: 1,
                              borderradius: width * 0.2,
                              horizontalPadding: width * 0.048,
                              keyboardtype: TextInputType.number,
                              onChanged: (value) {
                                obj.onChanged(context, 3);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    // VerificationCode(
                    //   onCompleted: (value) {},
                    //   onEditing: (value) {},
                    //   digitsOnly: true,
                    //   fullBorder: true,
                    //   itemSize: width * 0.08,
                    //   keyboardType: TextInputType.number,
                    //   length: 4,
                    //   underlineColor: AppColor.primary,
                    //   cursorColor: AppColor.primary,
                    // ),
                    SizedBox(
                      height: height * 0.15,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CText(
                            text: 'If you didn’t receive a code, ',
                            color: Colors.grey[600],
                          ),
                          InkWell(
                              onTap: () {},
                              child: const CText(
                                text: 'Resend',
                                color: AppColor.red,
                              )),
                        ],
                      ),
                    ),
                    CButton(
                      ontab: () {
                        obj.verifyCode();
                      },
                      text: 'Confirm',
                    ),
                  ],
                ),
              ),
            );
          }),
    ));
  }
}
