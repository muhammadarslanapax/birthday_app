import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/recommed_tofriend_controller.dart';

class RecommedTofriendView extends GetView<RecommedTofriendController> {
  const RecommedTofriendView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RecommedTofriendView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'RecommedTofriendView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
