import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edit_child_info_controller.dart';

class EditChildInfoView extends GetView<EditChildInfoController> {
  const EditChildInfoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EditChildInfoView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'EditChildInfoView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
