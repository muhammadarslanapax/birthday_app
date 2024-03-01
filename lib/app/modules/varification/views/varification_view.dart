import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/varification_controller.dart';

class VarificationView extends GetView<VarificationController> {
  const VarificationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VarificationView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'VarificationView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
