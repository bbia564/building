import 'package:get/get.dart';

import 'module_one_logic.dart';

class ModuleOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ModuleOneLogic());
  }
}
