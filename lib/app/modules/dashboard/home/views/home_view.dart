// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:birthday_app/app/models/child_model.dart';
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
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<HomeController>(
            init: HomeController(),
            builder: (obj) {
              obj.changeselected(
                  obj.childlist.isNotEmpty ? obj.childlist[0] : null);
              return SizedBox(
                width: width,
                height: height,
                child: Column(
                  children: [
                    DropdownButtonHideUnderline(
                      child: DropdownButton<ChildDataModel>(
                        alignment: Alignment.bottomCenter,
                        value: obj.selected,
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          size: width * 0.08,
                        ),
                        items: obj.childlist.map((ChildDataModel childData) {
                          return DropdownMenuItem<ChildDataModel>(
                            value: childData,
                            child: CText(
                              text: childData.name ?? "",
                              fontsize: AppStyle.subheadingsize(context) + 1,
                            ),
                          );
                        }).toList(),
                        onChanged: (ChildDataModel? selectedValue) {
                          // Handle the selected value
                          print("Selected Child: ${selectedValue?.name}");
                          obj.changeselected(selectedValue!);
                        },
                      ),
                    ),
                    Expanded(
                      child: PageView.builder(
                        itemCount: 5,
                        controller: obj.pageController,
                        onPageChanged: (value) {
                          obj.changePage(value);
                        },
                        itemBuilder: (context, index) {
                          return Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: AppStyle.defaultPadding(context),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    height: height * 0.3,
                                    width: height * 0.3,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: AppColor.peel,
                                        shape: BoxShape.circle),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CText(
                                          text: '${obj.timeDifferences[index]}',
                                          fontsize:
                                              AppStyle.headingsize(context) +
                                                  10,
                                        ),
                                        // CText(
                                        //   text: '6 Month',
                                        //   fontsize:
                                        //       AppStyle.headingsize(context) + 6,
                                        // ),
                                        // CText(
                                        //   text: '5 Days',
                                        //   fontsize:
                                        //       AppStyle.headingsize(context) + 2,
                                        // ),
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
                                    padding: EdgeInsetsDirectional.symmetric(
                                        vertical: height * 0.01),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            AppStyle.size(context, 12)),
                                        color: AppColor.secondary),
                                    child: CText(
                                      text: 'Feb 15 2024',
                                      fontsize:
                                          AppStyle.subheadingsize(context),
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.02,
                                  ),
                                  Container(
                                    height: height * 0.23,
                                    width: width,
                                    padding: EdgeInsetsDirectional.symmetric(
                                        horizontal: width * 0.08,
                                        vertical: height * 0.03),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            AppStyle.size(context, 12)),
                                        color: AppColor.secondary),
                                    child: Column(
                                      children: [
                                        CText(
                                          text: 'Food',
                                          fontsize:
                                              AppStyle.subheadingsize(context) +
                                                  1,
                                          fontWeight: bold,
                                        ),
                                        SizedBox(
                                          height: height * 0.02,
                                        ),
                                        CText(
                                          text:
                                              'Kyle is almost ready to start eating solids at the 6 month mark. Ensure to Plan...',
                                          fontsize:
                                              AppStyle.bodysize(context) + 1,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ));
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(5, (index) {
                          return Container(
                            height: width * 0.02,
                            width: width * 0.04,
                            decoration: BoxDecoration(
                                color: index == obj.currentPage
                                    ? AppColor.black
                                    : AppColor.grey,
                                shape: BoxShape.circle),
                          );
                        }),
                      ),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }

  Widget event(BuildContext context, double width, double height, List list,
      int currentIndex) {
    controller.selected =
        controller.childlist.isNotEmpty ? controller.childlist[0] : null;
    return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppStyle.defaultPadding(context),
        ),
        child: Column(
          children: [
            Container(
              height: height * 0.3,
              width: height * 0.3,
              alignment: Alignment.center,
              decoration:
                  BoxDecoration(color: AppColor.peel, shape: BoxShape.circle),
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
              padding: EdgeInsetsDirectional.symmetric(vertical: height * 0.01),
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
        ));
  }
}
