import 'package:birthday_app/utils/style.dart';
import 'package:birthday_app/widget/cText.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/privacy_policy_controller.dart';

class PrivacyPolicyView extends GetView<PrivacyPolicyController> {
  const PrivacyPolicyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.adaptive.arrow_back)),
        ),
        body: SizedBox(
          width: width,
          height: height,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.1, vertical: height * 0.06),
            child: Column(
              children: [
                CText(
                  text: 'Privacy Policy',
                  fontsize: AppStyle.headingsize(context),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                const CText(
                  text:
                      '“Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam hendrerit nisi sed sollicitudin pellentesque. Nunc posuere purus rhoncus pulvinar aliquam. Ut aliquet tristique nisl vitae volutpat. Nulla aliquet porttitor venenatis. Donec a dui et dui fringilla consectetur id nec massa. Aliquam erat volutpat. Sed ut dui ut lacus dictum fermentum vel tincidunt neque. Sed sed lacinia lectus. Duis sit amet sodales felis. Duis nunc eros, mattis at dui ac, convallis semper risus. In adipiscing ultrices tellus, in suscipit massa vehicula eu.”',
                ),
              ],
            ),
          ),
        ));
  }
}
