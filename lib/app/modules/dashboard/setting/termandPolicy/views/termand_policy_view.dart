import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/termand_policy_controller.dart';

class TermandPolicyView extends GetView<TermandPolicyController> {
  const TermandPolicyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TermandPolicyView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TermandPolicyView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
