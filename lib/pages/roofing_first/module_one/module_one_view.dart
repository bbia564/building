import 'package:construction_roofing/main.dart';
import 'package:construction_roofing/pages/roofing_first/input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'module_one_logic.dart';

class ModuleOnePage extends GetView<ModuleOneLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dovetail cut"),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: GetBuilder<ModuleOneLogic>(builder: (_) {
          return SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/module0.webp',
                  width: 222,
                  height: 168,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(15),
                child: <Widget>[
                  InputWidget(
                    title: 'Slope of roof',
                    content: controller.text0,
                    onChange: (value) {
                      controller.text0 = value;
                    },
                  ),
                  InputWidget(
                    title: 'Thickness of ridge board',
                    content: controller.text1,
                    unit: 'mm',
                    onChange: (value) {
                      controller.text1 = value;
                    },
                  ),
                  InputWidget(
                    title: 'Angle of roof pitch',
                    content: controller.text2,
                    onChange: (value) {
                      controller.text2 = value;
                    },
                  ),
                  InputWidget(
                    title: 'Seat cut length',
                    content: controller.text3,
                    unit: 'mm',
                    onChange: (value) {
                      controller.text3 = value;
                    },
                  ),
                  InputWidget(
                    title: 'Overhang distance',
                    content: controller.text4,
                    unit: 'mm',
                    onChange: (value) {
                      controller.text4 = value;
                    },
                  ),
                  Container(
                    height: 50,
                    alignment: Alignment.center,
                    child: const Text(
                      'Calculation result',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  )
                      .decorated(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(10))
                      .marginOnly(bottom: 10)
                      .gestures(onTap: () {
                    controller.count(context);
                  }),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(15),
                    child: <Widget>[
                      const Text(
                        'Calculation result',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        controller.result,
                        style: const TextStyle(
                            fontSize: 12, color: Colors.black54),
                      )
                    ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
                  )
                      .decorated(
                          color: bgColor,
                          borderRadius: BorderRadius.circular(10))
                      .marginOnly(bottom: 10),
                  <Widget>[
                    Expanded(
                        child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      child: const Text(
                        'Copy result',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    )
                            .decorated(
                                color: bgColor,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: Colors.grey.withOpacity(0.3)))
                            .gestures(onTap: () {
                      if (controller.result == '-') {
                        return;
                      }
                      Clipboard.setData(ClipboardData(text: controller.result));
                      Fluttertoast.showToast(msg: 'Copy success');
                    })),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      child: const Text(
                        'Records',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    )
                            .decorated(
                                color: bgColor,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: Colors.grey.withOpacity(0.3)))
                            .gestures(onTap: () {
                      Get.toNamed('/result_list', arguments: 0);
                    }))
                  ].toRow()
                ].toColumn(),
              ).decorated(
                  color: Colors.white, borderRadius: BorderRadius.circular(10))
            ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
          );
        }).marginAll(15)),
      ),
    );
  }
}
