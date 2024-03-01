import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_email_controller.dart';

class LoginEmailView extends GetView<LoginEmailController> {
  const LoginEmailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginEmailView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'LoginEmailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
