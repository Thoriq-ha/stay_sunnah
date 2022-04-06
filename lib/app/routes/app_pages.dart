import 'package:get/get.dart';
import 'package:stay_sunnah/app/modules/sunnah/bindings/sunnah_binding.dart';
import 'package:stay_sunnah/app/modules/sunnah/views/sunnah_view.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.SUNNAH,
      page: () => const SunnahView(),
      binding: SunnahBinding(),
    ),
  ];
}
