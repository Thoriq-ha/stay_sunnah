import 'package:get/get.dart';

import '../controllers/sunnah_controller.dart';

class SunnahBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SunnahController>(
      () => SunnahController(),
    );
  }
}
