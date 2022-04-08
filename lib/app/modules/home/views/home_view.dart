import 'dart:io';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:stay_sunnah/app/global/constants/images.dart';
import 'package:stay_sunnah/app/global/theme/my_color.dart';
import 'package:stay_sunnah/app/global/theme/my_component_style.dart';
import 'package:stay_sunnah/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Staysun App'),
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(Routes.SUNNAH),
            icon: Icon(
              FontAwesomeIcons.kaaba,
              size: 20,
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
          ),
          IconButton(
            onPressed: () => controller.appC.switchTheme(),
            icon: Icon(
              Get.isDarkMode ? Icons.wb_sunny_outlined : Icons.nightlight_round,
              size: 20,
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 18),
        child: Obx(
          (() => controller.myItemViewBuilder(controller.indexTab.value)),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: primaryClr,
              ),
              child: SizedBox(
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Flexible(
                      child: CircleAvatar(
                        minRadius: 30,
                        backgroundColor: Colors.white,
                        child: Image(
                            image: AssetImage(Images.profile),
                            fit: BoxFit.cover,
                            height: 100),
                      ),
                    ),
                    verticalSpace(6),
                    const Text('Bambang Saptaji'),
                    const Text('bambang@gmail.com')
                  ],
                ),
              ),
            ),
            ListTile(
              title: const Text('Keluar'),
              onTap: () {
                exit(0);
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
              FontAwesomeIcons.book,
              size: 26,
            ),
            FaIcon(
              FontAwesomeIcons.handsPraying,
              size: 30,
            ),
          ],
          index: controller.indexTab.value,
          backgroundColor: Colors.transparent,
          buttonBackgroundColor: Colors.black87,
          color: Theme.of(context).primaryColor,
          onTap: (index) {
            controller.updatePage(index);
          },
        ),
      ),
    );
  }
}
