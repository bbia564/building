import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../db_roofing/db_roofing.dart';
import '../../../db_roofing/roofing_entity.dart';

class ModuleThreeLogic extends GetxController {

  DBRoofing dbRoofing = Get.find<DBRoofing>();

  String text0 = '';
  String text1 = '';
  String result = '-';

  void count(BuildContext context) async {
    if (text0.isEmpty ||
        text1.isEmpty ) {
      Fluttertoast.showToast(msg: 'Please complete');
      return;
    }
    num text0Num = num.tryParse(text0) ?? 0;
    num text1Num = num.tryParse(text1) ?? 0;
    if (text0Num == 0 ||
        text1Num == 0 ) {
      Fluttertoast.showToast(msg: 'Please fill in correctly');
      return;
    }
    text0 = text0Num.toString();
    text1 = text1Num.toString();
    update();
    int trussCount = (text0Num / text1Num).ceil().toInt();
    var resultStr =
        'Roof length：$text0 m\nCenter distance：$text1 m\nNumber of truss：$trussCount';
    result = resultStr;
    update();
    await dbRoofing.insertRoofing(RoofingEntity(
      id: 0,
      createTime: DateTime.now(),
      type: 2,
      result: resultStr,
    ));
    Fluttertoast.showToast(msg: 'Calculate successfully');
  }

}
