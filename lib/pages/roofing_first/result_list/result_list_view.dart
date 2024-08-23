import 'dart:ffi';

import 'package:construction_roofing/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'result_list_logic.dart';

class ResultListPage extends GetView<ResultListLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result List'),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Obx(() {
          return controller.list.value.isEmpty
              ? const Center(
                  child: Text('No data'),
                )
              : ListView.builder(
                  padding:const EdgeInsets.all(15),
                  itemCount: controller.list.value.length,
                  itemBuilder: (_, index) {
                    final entity = controller.list.value[index];
                    return Container(
                      padding: const EdgeInsets.all(12),
                      child: <Widget>[
                        <Widget>[
                          Expanded(
                              child: Text(
                            titles[entity.type],
                            style: const TextStyle(fontSize: 14),
                          )),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            entity.createTimeStr,
                            style: const TextStyle(fontSize: 12,color: Colors.grey),
                          ),
                        ].toRow(),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            entity.result,
                            style: const TextStyle(
                                color: Colors.black54, fontSize: 13),
                          ),
                        ).decorated(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(12))
                      ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
                    ).decorated(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)).marginOnly(bottom: 10);
                  },
                );
        }),
      ),
    );
  }
}
