import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../db_roofing/db_roofing.dart';
import '../../../db_roofing/roofing_entity.dart';

class ModuleFourLogic extends GetxController {

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

    num roofLength = text0Num;
    num roofWidth = text1Num;
    num roofSlope = text2Num;

    num bundleCoverageArea = text3Num;
    num tilesPerBundle = text4Num;
    num roofArea = roofLength * roofWidth * (1 + roofSlope);

    num requiredTiles = (roofArea / bundleCoverageArea).ceil() * tilesPerBundle;

    var resultStr =
        'Roof length：$text0 m\nRoof width：$text1 m\nSlope of roof：$text2\nA bundle of roof covers the area：$text3 m²\nBale size：$text4\nNumber of tiles：$requiredTiles';
    result = resultStr;
    update();
    await dbRoofing.insertRoofing(RoofingEntity(
      id: 0,
      createTime: DateTime.now(),
      type: 3,
      result: resultStr,
    ));
    Fluttertoast.showToast(msg: 'Calculate successfully');
  }

}
