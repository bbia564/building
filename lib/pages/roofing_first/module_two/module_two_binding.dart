import 'package:get/get.dart';

import 'module_two_logic.dart';

class ModuleTwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ModuleTwoLogic());
  }
}
