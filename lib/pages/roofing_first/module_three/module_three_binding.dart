import 'package:get/get.dart';

import 'module_three_logic.dart';

class ModuleThreeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ModuleThreeLogic());
  }
}
