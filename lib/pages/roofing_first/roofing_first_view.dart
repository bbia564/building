
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../main.dart';
import 'roofing_first_logic.dart';

class RoofingFirstPage extends GetView<RoofingFirstLogic> {
  final colors = const [
    Color(0xffff6a6d),
    Color(0xff8177fe),
    Color(0xfff46aff),
    Color(0xff4fd626)
  ];

  Widget _item(int index) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: <Widget>[
        Container(
          width: 12,
          height: 12,
        ).decorated(
            color: colors[index], borderRadius: BorderRadius.circular(6)),
        const SizedBox(
          width: 10,
        ),
        Expanded(
            child: Text(titles[index],
                style: const TextStyle(
                    fontSize: 14, fontWeight: FontWeight.bold))),
        const SizedBox(
          width: 10,
        ),
        const Icon(
          Icons.keyboard_arrow_right,
          size: 25,
        )
      ].toRow(),
    )
        .decorated(color: Colors.white, borderRadius: BorderRadius.circular(10))
        .marginOnly(bottom: 15)
        .gestures(onTap: () {
      switch (index) {
        case 0:
          Get.toNamed('/module_one');
          break;
        case 1:
          Get.toNamed('/module_two');
          break;
        case 2:
          Get.toNamed('/module_three');
          break;
        case 3:
          Get.toNamed('/module_four');
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: <Widget>[
            const Text(
              'Construction Roofing',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            _item(0),
            _item(1),
            _item(2),
            _item(3),
          ].toColumn(),
        ).marginAll(15)),
      ),
    );
  }
}
