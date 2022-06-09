import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stay_sunnah/app/global/controllers/app_controller.dart';

import 'app/global/bindings/app_binding.dart';
import 'app/global/theme/my_theme.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appC = Get.put(AppController());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      darkTheme: Themes.dark,
      theme: Themes.light,
      initialBinding: AppBinding(),
      themeMode: appC.theme,
    );
  }
}
