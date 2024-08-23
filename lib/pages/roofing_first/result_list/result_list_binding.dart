import 'package:get/get.dart';

import 'result_list_logic.dart';

class ResultListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ResultListLogic());
  }
}
