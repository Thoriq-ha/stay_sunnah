import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:stay_sunnah/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stay Sunnah !'),
        leading: IconButton(
          onPressed: () => controller.appC.switchTheme(),
          icon: Icon(
            Get.isDarkMode ? Icons.wb_sunny_outlined : Icons.nightlight_round,
            size: 20,
            color: Get.isDarkMode ? Colors.white : Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 18),
        child: Obx(
          (() => controller.myItemViewBuilder(controller.indexTab.value)),
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Set Sunnah'),
              onTap: () {
                Get.toNamed(Routes.SUNNAH);
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => CurvedNavigationBar(
          items: const [
            FaIcon(
              FontAwesomeIcons.houseChimneyWindow,
              size: 26,
            ),
            FaIcon(
              FontAwesomeIcons.kaaba,
              size: 26,
            ),
            FaIcon(
              FontAwesomeIcons.handsPraying,
              size: 30,
            ),
          ],
          index: controller.indexTab.value,
          backgroundColor: Colors.transparent,
          buttonBackgroundColor: Theme.of(context).colorScheme.secondary,
          color: Theme.of(context).colorScheme.secondary,
          onTap: (index) {
            controller.updatePage(index);
          },
        ),
      ),
    );
  }
}
