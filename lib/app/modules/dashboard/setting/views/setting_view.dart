import 'package:birthday_app/app/routes/app_pages.dart';
import 'package:birthday_app/consts/app_color.dart';
import 'package:birthday_app/utils/style.dart';
import 'package:birthday_app/widget/cText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final double height = MediaQuery.sizeOf(context).height;
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<SettingController>(
            init: SettingController(),
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
                          height: height * 0.16,
                          alignment: Alignment.center,
                          child: CText(
                            text: 'Settings',
                            fontsize: AppStyle.size(context, 26),
                          ),
                        ),
                        Container(
                            height: height * 0.4,
                            width: width,
                            padding: EdgeInsetsDirectional.symmetric(
                              horizontal: width * 0.04,
                              vertical: height * 0.01,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    AppStyle.size(context, 12)),
                                color: AppColor.secondary),
                            child: Column(
                              children: [
                                Container(
                                  height: height * 0.05,
                                  alignment: Alignment.center,
                                  child: InkWell(
                                    onTap: () {
                                      Get.toNamed(Routes.ABOUT_CHILD,
                                          arguments: 'Add New Child');
                                    },
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: width * 0.01,
                                        ),
                                        SizedBox(
                                            width: width * 0.065,
                                            child: Row(
                                              children: [
                                                SvgPicture.asset(
                                                  'assets/icons/person_icon.svg',
                                                  width: width * 0.042,
                                                  fit: BoxFit.cover,
                                                  colorFilter:
                                                      const ColorFilter.mode(
                                                          AppColor.grey,
                                                          BlendMode.srcIn),
                                                ),
                                                Icon(
                                                  Icons.add,
                                                  size:
                                                      AppStyle.size(context, 8),
                                                  color: AppColor.grey,
                                                ),
                                              ],
                                            )),
                                        const CText(
                                          text: 'Add New Child',
                                          textAlign: TextAlign.start,
                                        ),
                                        const Spacer(),
                                        SizedBox(
                                          width: width * 0.02,
                                        ),
                                        const Icon(
                                          Icons.keyboard_arrow_right,
                                          color: AppColor.grey,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  height: height * 0.05,
                                  alignment: Alignment.center,
                                  child: InkWell(
                                    onTap: () {
                                      Get.toNamed(Routes.EDIT_CHILD_INFO);
                                    },
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: width * 0.01,
                                        ),
                                        SizedBox(
                                            width: width * 0.065,
                                            child: Row(
                                              children: [
                                                SvgPicture.asset(
                                                  'assets/icons/person_icon.svg',
                                                  width: width * 0.042,
                                                  fit: BoxFit.cover,
                                                  colorFilter:
                                                      const ColorFilter.mode(
                                                          AppColor.grey,
                                                          BlendMode.srcIn),
                                                ),
                                                Icon(
                                                  Icons.edit_outlined,
                                                  size:
                                                      AppStyle.size(context, 8),
                                                  color: AppColor.grey,
                                                ),
                                              ],
                                            )),
                                        const CText(
                                          text: 'Edit child information',
                                          textAlign: TextAlign.start,
                                        ),
                                        const Spacer(),
                                        SizedBox(
                                          width: width * 0.02,
                                        ),
                                        const Icon(
                                          Icons.keyboard_arrow_right,
                                          color: AppColor.grey,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  height: height * 0.05,
                                  alignment: Alignment.center,
                                  child: InkWell(
                                    onTap: () {
                                      print(width);
                                    },
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: width * 0.06,
                                          child: SvgPicture.asset(
                                            'assets/icons/send_plane_icon.svg',
                                            height: height * 0.05,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        SizedBox(
                                          width: width * 0.02,
                                        ),
                                        const CText(
                                          text: 'Recommend to a friend',
                                          textAlign: TextAlign.start,
                                        ),
                                        const Spacer(),
                                        SizedBox(
                                          width: width * 0.02,
                                        ),
                                        const Icon(
                                          Icons.keyboard_arrow_right,
                                          color: AppColor.grey,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  height: height * 0.05,
                                  alignment: Alignment.center,
                                  child: InkWell(
                                    onTap: () {},
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: width * 0.06,
                                          child: SvgPicture.asset(
                                            'assets/icons/open_mail_icon.svg',
                                            height: height * 0.03,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        SizedBox(
                                          width: width * 0.02,
                                        ),
                                        const CText(
                                          text: 'Contact us',
                                          textAlign: TextAlign.start,
                                        ),
                                        const Spacer(),
                                        SizedBox(
                                          width: width * 0.02,
                                        ),
                                        const Icon(
                                          Icons.keyboard_arrow_right,
                                          color: AppColor.grey,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  height: height * 0.05,
                                  alignment: Alignment.center,
                                  child: InkWell(
                                    onTap: () {
                                      Get.toNamed(Routes.ABOUT_US);
                                    },
                                    child: Row(
                                      children: [
                                        SizedBox(
                                            width: width * 0.06,
                                            child: Icon(
                                              Icons.info,
                                              size: AppStyle.size(context, 21),
                                              color: AppColor.grey,
                                            )),
                                        SizedBox(
                                          width: width * 0.02,
                                        ),
                                        const CText(
                                          text: 'About us',
                                          textAlign: TextAlign.start,
                                        ),
                                        const Spacer(),
                                        SizedBox(
                                          width: width * 0.02,
                                        ),
                                        const Icon(
                                          Icons.keyboard_arrow_right,
                                          color: AppColor.grey,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  height: height * 0.05,
                                  alignment: Alignment.center,
                                  child: InkWell(
                                    onTap: () {
                                      Get.toNamed(Routes.TERMAND_POLICY);
                                    },
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: width * 0.06,
                                          child: SvgPicture.asset(
                                            'assets/icons/shield_check_icon.svg',
                                            height: height * 0.035,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        SizedBox(
                                          width: width * 0.02,
                                        ),
                                        const CText(
                                          text: 'Terms of service',
                                          textAlign: TextAlign.start,
                                        ),
                                        const Spacer(),
                                        SizedBox(
                                          width: width * 0.02,
                                        ),
                                        const Icon(
                                          Icons.keyboard_arrow_right,
                                          color: AppColor.grey,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  height: height * 0.05,
                                  alignment: Alignment.center,
                                  child: InkWell(
                                    onTap: () {
                                      Get.toNamed(Routes.PRIVACY_POLICY);
                                    },
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: width * 0.06,
                                          child: SvgPicture.asset(
                                            'assets/icons/shield_check_icon.svg',
                                            height: height * 0.035,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        SizedBox(
                                          width: width * 0.02,
                                        ),
                                        const CText(
                                          text: 'Privacy policy',
                                          textAlign: TextAlign.start,
                                        ),
                                        const Spacer(),
                                        SizedBox(
                                          width: width * 0.02,
                                        ),
                                        const Icon(
                                          Icons.keyboard_arrow_right,
                                          color: AppColor.grey,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ])));
            }),
      ),
    );
  }
}
