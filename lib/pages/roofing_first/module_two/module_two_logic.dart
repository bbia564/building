import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../db_roofing/db_roofing.dart';
import '../../../db_roofing/roofing_entity.dart';

class ModuleTwoLogic extends GetxController {
  DBRoofing dbRoofing = Get.find<DBRoofing>();

  String text0 = '';
  String text1 = '';
  String text2 = '';
  String text3 = '';
  String text4 = '';
  String text5 = '';
  String result = '-';

  void count(BuildContext context) async {
    if (text0.isEmpty ||
        text1.isEmpty ||
        text2.isEmpty ||
        text3.isEmpty ||
        text4.isEmpty ||
        text5.isEmpty) {
      Fluttertoast.showToast(msg: 'Please complete');
      return;
    }
    num text0Num = num.tryParse(text0) ?? 0;
    num text1Num = num.tryParse(text1) ?? 0;
    num text2Num = num.tryParse(text2) ?? 0;
    num text3Num = num.tryParse(text3) ?? 0;
    num text4Num = num.tryParse(text4) ?? 0;
    num text5Num = num.tryParse(text5) ?? 0;
    if (text0Num == 0 ||
        text1Num == 0 ||
        text2Num == 0 ||
        text3Num == 0 ||
        text4Num == 0 ||
        text5Num == 0) {
      Fluttertoast.showToast(msg: 'Please fill in correctly');
      return;
    }
    text0 = text0Num.toString();
    text1 = text1Num.toString();
    text2 = text2Num.toString();
    text3 = text3Num.toString();
    text4 = text4Num.toString();
    update();

    num buildingLength = text0Num;
    num buildingWidth = text1Num;
    num totalRoofHeight = text2Num;
    num eavesOverhang = text3Num;
    num gableOverhang = text4Num;
    num roofSlopeAngleRadians = degreesToRadians(text5Num.toDouble());

    num lengthHorizontalProjection =
        calculateRoofHorizontalProjection(buildingLength, eavesOverhang);
    num lengthVerticalHeight = calculateRoofVerticalHeight(
        lengthHorizontalProjection, roofSlopeAngleRadians);

    num widthHorizontalProjection =
        calculateRoofHorizontalProjection(buildingWidth, eavesOverhang);
    num widthVerticalHeight = calculateRoofVerticalHeight(
        widthHorizontalProjection, roofSlopeAngleRadians);

    final singleslopeareaLength =
        (buildingLength - 2 * eavesOverhang) * lengthVerticalHeight;
    final totalRoofArea = 2 * singleslopeareaLength;
    final atticVolume = buildingLength * buildingWidth * (lengthVerticalHeight / 2).abs();

    final totalRoofAreaStr = totalRoofArea.toStringAsFixed(2);
    final atticVolumeStr = atticVolume.toStringAsFixed(2);

    var resultStr =
        'Building length：$text0 m\nBuilding width：$text1 m\nTotal roof height：$text2 m\nEave overhang width：$text3 m\nGable overhang length：$text4 m\nRoof Angle：$text5\nGross roof area：$totalRoofAreaStr m²\nApproximate attic volume：$atticVolumeStr m³';
    result = resultStr;
    update();
    await dbRoofing.insertRoofing(RoofingEntity(
      id: 0,
      createTime: DateTime.now(),
      type: 1,
      result: resultStr,
    ));

    Fluttertoast.showToast(msg: 'Calculate successfully');
  }

  num degreesToRadians(num degrees) {
    return degrees * (pi / 180.0);
  }

  num calculateRoofVerticalHeight(num horizontalProjection, num angleRadians) {
    return horizontalProjection * tan(angleRadians);
  }

  num calculateRoofHorizontalProjection(num dimension, num eavesOverhang) {
    return dimension - 2 * eavesOverhang;
  }
}
