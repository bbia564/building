import 'package:construction_roofing/db_roofing/db_roofing.dart';
import 'package:get/get.dart';

import '../../../db_roofing/roofing_entity.dart';

class ResultListLogic extends GetxController {

  DBRoofing dbRoofing = Get.find<DBRoofing>();

  int type = Get.arguments;

  var list = <RoofingEntity>[].obs;

  void getData() async {
    final result = await dbRoofing.getAllData();
    list.value = result.where((element) => element.type == type).toList();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }

}
