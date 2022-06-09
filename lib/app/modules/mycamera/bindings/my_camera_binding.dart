import 'package:get/get.dart';

import '../controllers/my_camera_controller.dart';

class MyCameraBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyCameraController>(
      () => MyCameraController(),
    );
  }
}
