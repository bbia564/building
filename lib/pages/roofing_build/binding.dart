import 'package:get/get.dart';

import 'logic.dart';

class RoofBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PageLogic(),
      permanent: true,
    );
  }
}
