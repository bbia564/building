import 'package:get/get.dart';

import 'roofing_second_logic.dart';

class RoofingSecondBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RoofingSecondLogic());
  }
}
