import 'package:birthday_app/utils/style.dart';
import 'package:birthday_app/widget/cText.dart';
import 'package:birthday_app/widget/custom_button_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/language_selection_controller.dart';

class LanguageSelectionView extends GetView<LanguageSelectionController> {
  const LanguageSelectionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: GetBuilder<LanguageSelectionController>(
          init: LanguageSelectionController(),
          builder: (obj) {
            return SizedBox(
              width: width,
              height: height,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.07, vertical: height * 0.1),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/applogo.png',
                      width: width * 0.45,
                    ),
                    CText(
                      text: 'ChirpChime',
                      fontsize: AppStyle.headingsize(context),
                      fontWeight: bold5,
                    ),
                    SizedBox(
                      height: height * 0.3,
                      width: width * 0.25,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              obj.selectededLanguage('English');
                            },
                            child: Row(
                              children: [
                                Container(
                                  height: height * 0.04,
                                  width: width * 0.038,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey, width: 2.5),
                                      color: obj.language == 'English'
                                          ? Colors.black
                                          : Colors.white,
                                      shape: BoxShape.circle),
                                ),
                                SizedBox(
                                  width: width * 0.03,
                                ),
                                const CText(
                                  text: 'English',
                                )
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              obj.selectededLanguage('Español');
                            },
                            child: Row(
                              children: [
                                Container(
                                  height: height * 0.04,
                                  width: width * 0.038,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey, width: 2.5),
                                      color: obj.language == 'Español'
                                          ? Colors.black
                                          : Colors.white,
                                      shape: BoxShape.circle),
                                ),
                                SizedBox(
                                  width: width * 0.03,
                                ),
                                const CText(
                                  text: 'Español',
                                )
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              obj.selectededLanguage('中文');
                            },
                            child: Row(
                              children: [
                                Container(
                                  height: height * 0.04,
                                  width: width * 0.038,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey, width: 2.5),
                                      color: obj.language == '中文'
                                          ? Colors.black
                                          : Colors.white,
                                      shape: BoxShape.circle),
                                ),
                                SizedBox(
                                  width: width * 0.03,
                                ),
                                const CText(
                                  text: '中文',
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    CButton(
                        ontab: () {
                          obj.goToLogin();
                        },
                        text: 'Confirm')
                  ],
                ),
              ),
            );
          }),
    );
  }
}
