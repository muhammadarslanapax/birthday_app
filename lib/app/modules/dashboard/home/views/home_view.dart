// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:birthday_app/consts/app_color.dart';
import 'package:birthday_app/utils/style.dart';
import 'package:birthday_app/widget/cText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final double height = MediaQuery.sizeOf(context).height;
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<HomeController>(
            init: HomeController(),
            builder: (obj) {
              return PageView(
                controller: obj.pageController,
                onPageChanged: (value) {
                  obj.currentIndex = value;
                  obj.update();
                },
                children: [
                  event(context, width, height, obj.upcomingReminders,
                      obj.currentIndex),
                  event(context, width, height, obj.upcomingReminders,
                      obj.currentIndex),
                  event(context, width, height, obj.upcomingReminders,
                      obj.currentIndex),
                  event(context, width, height, obj.upcomingReminders,
                      obj.currentIndex),
                  event(context, width, height, obj.upcomingReminders,
                      obj.currentIndex),
                ],
              );
            }),
      ),
    );
  }

  Widget event(BuildContext context, double width, double height, List list,
      int currentIndex) {
    return SizedBox(
        width: width,
        height: height,
        child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppStyle.defaultPadding(context),
            ),
            child: Column(
              children: [
                DropdownButtonHideUnderline(
                    child: DropdownButton(
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          size: width * 0.08,
                        ),
                        items: [
                          DropdownMenuItem(
                            child: CText(
                              text: 'Kyle',
                              fontsize: AppStyle.subheadingsize(context) + 1,
                            ),
                          )
                        ],
                        onChanged: (value) {})),
                Container(
                  height: height * 0.3,
                  width: height * 0.3,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: AppColor.peel, shape: BoxShape.circle),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CText(
                        text: '1 Year',
                        fontsize: AppStyle.headingsize(context) + 10,
                      ),
                      CText(
                        text: '6 Month',
                        fontsize: AppStyle.headingsize(context) + 6,
                      ),
                      CText(
                        text: '5 Days',
                        fontsize: AppStyle.headingsize(context) + 2,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: height * 0.1,
                  alignment: Alignment.center,
                  child: CText(
                    text: 'Upcoming Milestones',
                    fontsize: AppStyle.headingsize(context),
                  ),
                ),
                Container(
                  width: width,
                  padding:
                      EdgeInsetsDirectional.symmetric(vertical: height * 0.01),
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(AppStyle.size(context, 12)),
                      color: AppColor.secondary),
                  child: CText(
                    text: 'Feb 15 2024',
                    fontsize: AppStyle.subheadingsize(context),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Container(
                  height: height * 0.23,
                  width: width,
                  padding: EdgeInsetsDirectional.symmetric(
                      horizontal: width * 0.08, vertical: height * 0.03),
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(AppStyle.size(context, 12)),
                      color: AppColor.secondary),
                  child: Column(
                    children: [
                      CText(
                        text: 'Food',
                        fontsize: AppStyle.subheadingsize(context) + 1,
                        fontWeight: bold,
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      CText(
                        text:
                            'Kyle is almost ready to start eating solids at the 6 month mark. Ensure to Plan...',
                        fontsize: AppStyle.bodysize(context) + 1,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Center(
                  child: Wrap(
                    children: list.asMap().entries.map((e) {
                      int index = e.key;
                      return Container(
                        height: width * 0.02,
                        width: width * 0.04,
                        decoration: BoxDecoration(
                            color: index == currentIndex
                                ? AppColor.black
                                : AppColor.grey,
                            shape: BoxShape.circle),
                      );
                    }).toList(),
                  ),
                )
              ],
            )));
  }
}
