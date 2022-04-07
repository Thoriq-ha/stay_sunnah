import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
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
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
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
                // Update the state of the app
                // ...
                // Then close the drawer
                Get.toNamed(Routes.SUNNAH);
                // Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
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
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      //Init Floating Action Bubble
      // floatingActionButton: FloatingActionBubble(
      //   // Menu items
      //   items: <Bubble>[
      //     // Floating action menu item
      //     Bubble(
      //       title: "Settings",
      //       iconColor: Theme.of(context).primaryColor,
      //       bubbleColor: Theme.of(context).colorScheme.secondary,
      //       icon: Icons.settings,
      //       titleStyle:
      //           TextStyle(fontSize: 14, color: Theme.of(context).primaryColor),
      //       onPress: () {
      //         controller.animationController.reverse();
      //       },
      //     ), //Floating action menu item
      //     Bubble(
      //       title: "Bookmark",
      //       iconColor: Theme.of(context).primaryColor,
      //       bubbleColor: Theme.of(context).colorScheme.secondary,
      //       icon: FontAwesomeIcons.bookBookmark,
      //       titleStyle:
      //           TextStyle(fontSize: 14, color: Theme.of(context).primaryColor),
      //       onPress: () {
      //         controller.animationController.reverse();
      //       },
      //     ),
      //     // Floating action menu item
      //     Bubble(
      //       title: "Atur Sunnah",
      //       iconColor: Theme.of(context).primaryColor,
      //       bubbleColor: Theme.of(context).colorScheme.secondary,
      //       icon: FontAwesomeIcons.clock,
      //       titleStyle:
      //           TextStyle(fontSize: 14, color: Theme.of(context).primaryColor),
      //       onPress: () {
      //         // controller.animationController.reverse();
      //         Get.toNamed(Routes.SUNNAH);
      //       },
      //     ),
      //   ],

      //   // animation controller
      //   animation: controller.animation,

      //   // On pressed change animation state
      //   onPress: () => controller.animationController.isCompleted
      //       ? controller.animationController.reverse()
      //       : controller.animationController.forward(),

      //   // Floating Action button Icon color
      //   iconColor: Theme.of(context).primaryColor,

      //   // Flaoting Action button Icon
      //   iconData: FontAwesomeIcons.mosque,
      //   backGroundColor: Theme.of(context).colorScheme.secondary,
      // ),
    );
  }
}
