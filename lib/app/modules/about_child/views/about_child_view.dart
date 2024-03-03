import 'package:birthday_app/consts/app_color.dart';
import 'package:birthday_app/utils/style.dart';
import 'package:birthday_app/utils/validation.dart';
import 'package:birthday_app/widget/cText.dart';
import 'package:birthday_app/widget/custom_button_widget.dart';
import 'package:birthday_app/widget/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../controllers/about_child_controller.dart';

class AboutChildView extends GetView<AboutChildController> {
  const AboutChildView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final double height = MediaQuery.sizeOf(context).height;
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: GetBuilder<AboutChildController>(
              init: AboutChildController(),
              builder: (obj) {
                return SizedBox(
                  width: width,
                  height: height,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.055, vertical: height * 0.04),
                    child: obj.startLoading
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: width * 0.3,
                                height: width * 0.3,
                                child: CircularProgressIndicator(
                                  backgroundColor:
                                      AppColor.primary.withOpacity(0.3),
                                  color: AppColor.primary,
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CText(
                                text: obj.title ?? 'Tell us about your child',
                                fontsize: AppStyle.headingsize(context),
                              ),
                              Container(
                                padding: EdgeInsets.all(width * 0.035),
                                decoration: BoxDecoration(
                                    color: AppColor.secondary,
                                    borderRadius:
                                        BorderRadius.circular(width * 0.03)),
                                child: CText(
                                  text:
                                      'This will allow us to accurately customize reminders for your baby',
                                  fontsize: AppStyle.smallsize(context),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                height: height * 0.6,
                                padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.04),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        CText(
                                          text: 'Is the Baby born yet?',
                                          fontsize:
                                              AppStyle.smallsize(context) - 0.5,
                                          textAlign: TextAlign.center,
                                        ),
                                        Expanded(
                                            child: SizedBox(
                                          width: width * 0.01,
                                        )),
                                        InkWell(
                                            onTap: () {
                                              obj.isBorn = true;
                                              obj.update();
                                            },
                                            child: Container(
                                                width: width * 0.18,
                                                height: height * 0.03,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    color: obj.isBorn == true
                                                        ? AppColor.primary
                                                        : AppColor.secondary,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            width * 0.02)),
                                                child: CText(
                                                  text: 'Yes',
                                                  fontsize: AppStyle.smallsize(
                                                          context) -
                                                      1,
                                                ))),
                                        SizedBox(
                                          width: width * 0.025,
                                        ),
                                        InkWell(
                                            onTap: () {
                                              obj.isBorn = false;
                                              obj.update();
                                            },
                                            child: Container(
                                                width: width * 0.18,
                                                height: height * 0.03,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    color: obj.isBorn == false
                                                        ? AppColor.primary
                                                        : AppColor.secondary,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            width * 0.02)),
                                                child: CText(
                                                  text: 'No',
                                                  fontsize: AppStyle.smallsize(
                                                          context) -
                                                      1,
                                                ))),
                                      ],
                                    ),
                                    obj.isBorn == null
                                        ? Expanded(
                                            child: SizedBox(
                                            width: width * 0.01,
                                          ))
                                        : SizedBox(
                                            height: height * 0.55,
                                            child: Form(
                                              key: obj.formKey,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Row(
                                                    children: [
                                                      CText(
                                                        text:
                                                            'Gender (if known)',
                                                        fontsize:
                                                            AppStyle.smallsize(
                                                                    context) -
                                                                0.5,
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                      Expanded(
                                                          child: SizedBox(
                                                        width: width * 0.01,
                                                      )),
                                                      InkWell(
                                                          onTap: () {
                                                            obj.isBoy = true;
                                                            obj.update();
                                                          },
                                                          child: Container(
                                                              width:
                                                                  width * 0.18,
                                                              height:
                                                                  height * 0.03,
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              decoration: BoxDecoration(
                                                                  color: obj.isBoy ==
                                                                          true
                                                                      ? AppColor
                                                                          .primary
                                                                      : AppColor
                                                                          .secondary,
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                          width *
                                                                              0.02)),
                                                              child: CText(
                                                                text: 'Boy',
                                                                fontsize: AppStyle
                                                                        .smallsize(
                                                                            context) -
                                                                    1,
                                                              ))),
                                                      SizedBox(
                                                        width: width * 0.025,
                                                      ),
                                                      InkWell(
                                                          onTap: () {
                                                            obj.isBoy = false;
                                                            obj.update();
                                                          },
                                                          child: Container(
                                                              width:
                                                                  width * 0.18,
                                                              height:
                                                                  height * 0.03,
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              decoration: BoxDecoration(
                                                                  color: obj
                                                                              .isBoy ==
                                                                          false
                                                                      ? AppColor
                                                                          .primary
                                                                      : AppColor
                                                                          .secondary,
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                          width *
                                                                              0.02)),
                                                              child: CText(
                                                                text: 'Girl',
                                                                fontsize: AppStyle
                                                                        .smallsize(
                                                                            context) -
                                                                    1,
                                                              ))),
                                                    ],
                                                  ),
                                                  RectangularTextFormField(
                                                    controller:
                                                        obj.nameController,
                                                    hint: 'Name',
                                                    hintcolor: Colors.grey,
                                                    prefixIcon: Transform.scale(
                                                      scale: 0.4,
                                                      child: SvgPicture.asset(
                                                        'assets/icons/person_icon.svg',
                                                      ),
                                                    ),
                                                    validation: (value) {
                                                      return GetValidation
                                                          .validate(
                                                              value!, 'Name');
                                                    },
                                                  ),
                                                  RectangularTextFormField(
                                                    controller: obj
                                                        .dateOfBirthController,
                                                    onTap: () {
                                                      obj.selectDate(context,
                                                          obj.dateOfBirthController);
                                                    },
                                                    hint: obj.isBorn == true
                                                        ? 'Date of Birth'
                                                        : 'Expected Date of Birth',
                                                    hintcolor: Colors.grey,
                                                    prefixIcon: Transform.scale(
                                                      scale: 0.4,
                                                      child: SvgPicture.asset(
                                                        'assets/icons/person_icon.svg',
                                                      ),
                                                    ),
                                                    validation: (value) {
                                                      return GetValidation
                                                          .validate(value!,
                                                              'Date of Birth');
                                                    },
                                                  ),
                                                  obj.isBorn == true
                                                      ? Row(children: [
                                                          const CText(
                                                            text:
                                                                'Is the baby a Premie?',
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                          Expanded(
                                                              child: SizedBox(
                                                            width: width * 0.01,
                                                          )),
                                                          Transform.scale(
                                                            scale: 0.7,
                                                            child:
                                                                CupertinoSwitch(
                                                              onChanged:
                                                                  (value) {
                                                                obj.isPremie =
                                                                    value;
                                                                obj.update();
                                                              },
                                                              value:
                                                                  obj.isPremie,
                                                              activeColor:
                                                                  AppColor
                                                                      .primary,
                                                            ),
                                                          )
                                                        ])
                                                      : SizedBox(
                                                          height: height * 0.06,
                                                        ),
                                                  obj.isBorn == true &&
                                                          obj.isPremie
                                                      ? RectangularTextFormField(
                                                          controller: obj
                                                              .expectedDeliveryDateController,
                                                          onTap: () {
                                                            obj.selectDate(
                                                                context,
                                                                obj.expectedDeliveryDateController);
                                                          },
                                                          hint:
                                                              'What was the Expected Delivery Date',
                                                          hintcolor:
                                                              Colors.grey,
                                                          hintSize: AppStyle
                                                                  .smallsize(
                                                                      context) -
                                                              1,
                                                          prefixIcon:
                                                              Transform.scale(
                                                            scale: 0.4,
                                                            child: SvgPicture
                                                                .asset(
                                                              'assets/icons/person_icon.svg',
                                                            ),
                                                          ),
                                                        )
                                                      : SizedBox(
                                                          height:
                                                              height * 0.075,
                                                        ),
                                                  CButton(
                                                      ontab: () {
                                                        obj.addChild();
                                                      },
                                                      text: 'Confirm'),
                                                ],
                                              ),
                                            ),
                                          ),
                                  ],
                                ),
                              )
                            ],
                          ),
                  ),
                );
              })),
    );
  }
}
