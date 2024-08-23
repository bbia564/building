import 'package:get/get.dart';

import 'roofing_first_logic.dart';

class RoofingFirstBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RoofingFirstLogic());
  }
}
