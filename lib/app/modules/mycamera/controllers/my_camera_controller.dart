// ignore_for_file: avoid_print

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyCameraController extends GetxController {
  RxList<CameraDescription> cameras = RxList();

  final count = 0.obs;
  @override
  Future<void> onInit() async {
    super.onInit();
    try {
      WidgetsFlutterBinding.ensureInitialized();
      cameras.value = await availableCameras();
    } on CameraException catch (e) {
      print('Error in fetching the cameras: $e');
    }
  }

  void increment() => count.value++;
}
