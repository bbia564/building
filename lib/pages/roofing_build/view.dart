import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class RoofPage extends GetView<PageLogic> {
  const RoofPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => controller.wolf.value
              ? const CircularProgressIndicator(color: Colors.deepPurpleAccent,)
              : buildError(),
        ),
      ),
    );
  }

  Widget buildError() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              controller.ruonwq();
            },
            icon: const Icon(
              Icons.restart_alt,
              size: 50,
            ),
          ),
        ],
      ),
    );
  }
}
