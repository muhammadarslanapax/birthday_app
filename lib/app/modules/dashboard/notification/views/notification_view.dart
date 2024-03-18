import 'package:birthday_app/consts/app_color.dart';
import 'package:birthday_app/utils/style.dart';
import 'package:birthday_app/widget/cText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final double height = MediaQuery.sizeOf(context).height;
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<NotificationController>(
            init: NotificationController(),
            builder: (obj) {
              return SizedBox(
                  width: width,
                  height: height,
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppStyle.defaultPadding(context),
                      ),
                      child: Column(children: [
                        DropdownButtonHideUnderline(
                            child: DropdownButton(
                                icon: Icon(
                                  Icons.keyboard_arrow_down,
                                  size: AppStyle.size(context, 29),
                                ),
                                items: [
                                  DropdownMenuItem(
                                    child: CText(
                                      text: 'Kyle',
                                      fontsize: AppStyle.size(context, 19),
                                    ),
                                  ),
                                ],
                                onChanged: (value) {})),
                        Container(
                          height: height * 0.12,
                          alignment: Alignment.center,
                          child: CText(
                            text: 'Notifications',
                            fontsize: AppStyle.size(context, 26),
                          ),
                        ),
                        Container(
                          width: width,
                          padding: EdgeInsetsDirectional.symmetric(
                            horizontal: width * 0.04,
                            vertical: height * 0.015,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  AppStyle.size(context, 12)),
                              color: AppColor.secondary),
                          child: CText(
                            text:
                                'Ensure notifications are turned on so you can provactively plan for your child’s ever changing developmental needs',
                            fontsize: AppStyle.smallsize(context),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        Container(
                          height: height * 0.4,
                          width: width,
                          padding: EdgeInsetsDirectional.symmetric(
                            horizontal: width * 0.05,
                            vertical: height * 0.02,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  AppStyle.size(context, 12)),
                              color: AppColor.secondary),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      obj.showDialog(context, width, 'Heads Up',
                                          obj.dialogList);
                                    },
                                    child: Icon(
                                      Icons.info,
                                      color: AppColor.grey,
                                      size: AppStyle.bodysize(context),
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * 0.02,
                                  ),
                                  CText(
                                    text: 'Heads up (In days)',
                                    fontsize: AppStyle.size(context, 15),
                                  ),
                                  const Spacer(),
                                  Container(
                                    width: width * 0.1,
                                    height: height * 0.04,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: AppColor.white,
                                        borderRadius: BorderRadius.circular(
                                            width * 0.012),
                                        border: Border.all(
                                            color: AppColor.grey, width: 1)),
                                    child: CText(
                                      text: '7',
                                      fontWeight: bold,
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * 0.02,
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      obj.showDialog(context, width, 'Food',
                                          obj.dialogList);
                                    },
                                    child: Icon(
                                      Icons.info,
                                      color: AppColor.grey,
                                      size: AppStyle.bodysize(context),
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * 0.02,
                                  ),
                                  CText(
                                    text: 'Food',
                                    fontsize: AppStyle.size(context, 15),
                                  ),
                                  const Spacer(),
                                  FlutterSwitch(
                                    onToggle: (value) {
                                      obj.food = value;
                                      obj.update();
                                    },
                                    height: height * 0.035,
                                    width: width * 0.14,
                                    padding: width * 0.008,
                                    value: obj.food,
                                    activeColor: AppColor.primary,
                                    inactiveColor:
                                        AppColor.grey.withOpacity(0.5),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      obj.showDialog(context, width, 'Milk',
                                          obj.dialogList);
                                    },
                                    child: Icon(
                                      Icons.info,
                                      color: AppColor.grey,
                                      size: AppStyle.bodysize(context),
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * 0.02,
                                  ),
                                  CText(
                                    text: 'Milk',
                                    fontsize: AppStyle.size(context, 15),
                                  ),
                                  const Spacer(),
                                  FlutterSwitch(
                                    onToggle: (value) {
                                      obj.milk = value;
                                      obj.update();
                                    },
                                    height: height * 0.035,
                                    width: width * 0.14,
                                    padding: width * 0.008,
                                    value: obj.milk,
                                    activeColor: AppColor.primary,
                                    inactiveColor:
                                        AppColor.grey.withOpacity(0.5),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      obj.showDialog(context, width, 'Sleep',
                                          obj.dialogList);
                                    },
                                    child: Icon(
                                      Icons.info,
                                      color: AppColor.grey,
                                      size: AppStyle.bodysize(context),
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * 0.02,
                                  ),
                                  CText(
                                    text: 'Sleep',
                                    fontsize: AppStyle.size(context, 15),
                                  ),
                                  const Spacer(),
                                  FlutterSwitch(
                                    onToggle: (value) {
                                      obj.sleep = value;
                                      obj.update();
                                    },
                                    height: height * 0.035,
                                    width: width * 0.14,
                                    padding: width * 0.008,
                                    value: obj.sleep,
                                    activeColor: AppColor.primary,
                                    inactiveColor:
                                        AppColor.grey.withOpacity(0.5),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      obj.showDialog(context, width,
                                          'Doctor Checkup', obj.dialogList);
                                    },
                                    child: Icon(
                                      Icons.info,
                                      color: AppColor.grey,
                                      size: AppStyle.bodysize(context),
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * 0.02,
                                  ),
                                  CText(
                                    text: 'Doctor Checkups',
                                    fontsize: AppStyle.size(context, 15),
                                  ),
                                  const Spacer(),
                                  FlutterSwitch(
                                    onToggle: (value) {
                                      obj.doctorCheckup = value;
                                      obj.update();
                                    },
                                    height: height * 0.035,
                                    width: width * 0.14,
                                    padding: width * 0.008,
                                    value: obj.doctorCheckup,
                                    activeColor: AppColor.primary,
                                    inactiveColor:
                                        AppColor.grey.withOpacity(0.5),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      obj.showDialog(context, width, 'Play',
                                          obj.dialogList);
                                    },
                                    child: Icon(
                                      Icons.info,
                                      color: AppColor.grey,
                                      size: AppStyle.bodysize(context),
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * 0.02,
                                  ),
                                  CText(
                                    text: 'Play',
                                    fontsize: AppStyle.size(context, 15),
                                  ),
                                  const Spacer(),
                                  FlutterSwitch(
                                    onToggle: (value) {
                                      obj.play = value;
                                      obj.update();
                                    },
                                    height: height * 0.035,
                                    width: width * 0.14,
                                    padding: width * 0.008,
                                    value: obj.play,
                                    activeColor: AppColor.primary,
                                    inactiveColor:
                                        AppColor.grey.withOpacity(0.5),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      obj.showDialog(context, width, 'Vaccines',
                                          obj.dialogList);
                                    },
                                    child: Icon(
                                      Icons.info,
                                      color: AppColor.grey,
                                      size: AppStyle.bodysize(context),
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * 0.02,
                                  ),
                                  CText(
                                    text: 'Vaccines',
                                    fontsize: AppStyle.size(context, 15),
                                  ),
                                  const Spacer(),
                                  FlutterSwitch(
                                    onToggle: (value) {
                                      obj.vaccine = value;
                                      obj.update();
                                    },
                                    height: height * 0.035,
                                    width: width * 0.14,
                                    padding: width * 0.008,
                                    value: obj.vaccine,
                                    activeColor: AppColor.primary,
                                    inactiveColor:
                                        AppColor.grey.withOpacity(0.5),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ])));
            }),
      ),
    );
  }

  AlertDialog adptiveAlertDialog(
    BuildContext context,
    double width,
    String title,
    List list,
  ) {
    return AlertDialog.adaptive(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      title: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.topRight,
            child: InkWell(
              child: Icon(
                Icons.close,
                size: AppStyle.smallsize(context),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          Center(
            child: CText(
              text: title,
              fontsize: AppStyle.headingsize(context),
            ),
          ),
          const CText(
            text: 'Get notifications on when to:',
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: width * 0.03, vertical: 5),
            child: Column(
                children: list.map((e) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: width * 0.016),
                    child: Container(
                      height: width * 0.02,
                      width: width * 0.02,
                      decoration: const BoxDecoration(
                          color: AppColor.black, shape: BoxShape.circle),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  SizedBox(
                      width: width * 0.54,
                      child: CText(
                        text: e,
                        textAlign: TextAlign.start,
                      )),
                ],
              );
            }).toList()),
          ),
          const CText(
            text: 'And much more',
          ),
        ],
      ),
    );
  }
}
