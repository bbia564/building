import 'dart:math';

import 'package:construction_roofing/db_roofing/db_roofing.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../db_roofing/roofing_entity.dart';

class ModuleOneLogic extends GetxController {
  DBRoofing dbRoofing = Get.find<DBRoofing>();

  String text0 = '';
  String text1 = '';
  String text2 = '';
  String text3 = '';
  String text4 = '';
  String result = '-';

  void count(BuildContext context) async {
    if (text0.isEmpty ||
        text1.isEmpty ||
        text2.isEmpty ||
        text3.isEmpty ||
        text4.isEmpty) {
      Fluttertoast.showToast(msg: 'Please complete');
      return;
    }
    num text0Num = num.tryParse(text0) ?? 0;
    num text1Num = num.tryParse(text1) ?? 0;
    num text2Num = num.tryParse(text2) ?? 0;
    num text3Num = num.tryParse(text3) ?? 0;
    num text4Num = num.tryParse(text4) ?? 0;
    if (text0Num == 0 ||
        text1Num == 0 ||
        text2Num == 0 ||
        text3Num == 0 ||
        text4Num == 0) {
      Fluttertoast.showToast(msg: 'Please fill in correctly');
      return;
    }
    text0 = text0Num.toString();
    text1 = text1Num.toString();
    text2 = text2Num.toString();
    text3 = text3Num.toString();
    text4 = text4Num.toString();
    update();
    num ridgeBoardThickness = text1Num;
    num roofSlopeAngle = text2Num;
    num seatCutLength = text3Num;
    num overhangDistance = text4Num;

    num cutWidth = ridgeBoardThickness + 10.0;
    num cutDepth = tan(roofSlopeAngle * (pi / 180)) * (seatCutLength / 2);
    final cutWidthStr = cutWidth.toStringAsFixed(2);
    final cutDepthStr = cutDepth.toStringAsFixed(2);

    var resultStr =
        'Slope of roof：$text0\nThickness of ridge board：$text1 mm\nAngle of roof pitch：$text2\nSeat cut length：$text3 mm\nOverhang distance：$text4 mm\nCutting width：$cutWidthStr mm\nCutting depth：$cutDepthStr mm';
    result = resultStr;
    update();
    await dbRoofing.insertRoofing(RoofingEntity(
      id: 0,
      createTime: DateTime.now(),
      type: 0,
      result: resultStr,
    ));
    Fluttertoast.showToast(msg: 'Calculate successfully');
  }
}
