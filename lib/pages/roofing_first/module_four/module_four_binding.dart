import 'package:get/get.dart';

import 'module_four_logic.dart';

class ModuleFourBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ModuleFourLogic());
  }
}
