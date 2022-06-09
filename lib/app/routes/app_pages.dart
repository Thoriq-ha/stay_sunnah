import 'package:get/get.dart';

import '../modules/MyCamera/bindings/my_camera_binding.dart';
import '../modules/MyCamera/views/my_camera_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/kiblat/bindings/kiblat_binding.dart';
import '../modules/kiblat/views/kiblat_view.dart';
import '../modules/sunnah/bindings/sunnah_binding.dart';
import '../modules/sunnah/views/add_view.dart';
import '../modules/sunnah/views/sunnah_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SUNNAH,
      page: () => const SunnahView(),
      binding: SunnahBinding(),
    ),
    GetPage(
      name: _Paths.ADD,
      page: () => const AddView(),
      binding: SunnahBinding(),
    ),
    GetPage(
      name: _Paths.KIBLAT,
      page: () => const KiblatView(),
      binding: KiblatBinding(),
    ),
    GetPage(
      name: _Paths.MY_CAMERA,
      page: () => const MyCameraView(),
      binding: MyCameraBinding(),
    ),
  ];
}
