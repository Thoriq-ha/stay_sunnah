import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:stay_sunnah/app/modules/mycamera/views/screen/camera_screen.dart';

import '../controllers/my_camera_controller.dart';

class MyCameraView extends GetView<MyCameraController> {
  const MyCameraView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        // appBar: AppBar(
        //   title: Obx(() {
        //     return Text('${controller.count}MyCameraView');
        //   }),
        //   centerTitle: true,
        // ),
        body: CameraScreen());
  }
}
