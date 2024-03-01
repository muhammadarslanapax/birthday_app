import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/about_child_controller.dart';

class AboutChildView extends GetView<AboutChildController> {
  const AboutChildView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AboutChildView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AboutChildView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
