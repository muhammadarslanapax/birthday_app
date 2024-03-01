import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/language_selection_controller.dart';

class LanguageSelectionView extends GetView<LanguageSelectionController> {
  const LanguageSelectionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LanguageSelectionView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'LanguageSelectionView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
