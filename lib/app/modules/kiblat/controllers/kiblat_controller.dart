import 'package:get/get.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:permission_handler/permission_handler.dart';

class KiblatController extends GetxController {
  RxBool hasPermissions = false.obs;
  CompassEvent? lastRead;
  DateTime? lastReadAt;

  RxString lastRed = "".obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    fetchPermissionStatus();
  }

  void increment() => count.value++;

  void fetchPermissionStatus() {
    Permission.locationWhenInUse.status.then((status) {
      // if (mounted) {
      hasPermissions.value = status == PermissionStatus.granted;
      // }
    });
  }

  void readValue(CompassEvent lastRead, DateTime lastReadAt) {
    lastRed.value = lastRead.toString();
    this.lastReadAt = lastReadAt;
  }
}
