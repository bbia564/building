import 'package:get/get.dart';

import '../roofing_first/roofing_first_logic.dart';
import '../roofing_second/roofing_second_logic.dart';
import 'roofing_tab_logic.dart';

class RoofingTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RoofingTabLogic());
    Get.lazyPut(() => RoofingFirstLogic());
    Get.lazyPut(() => RoofingSecondLogic());
  }
}
