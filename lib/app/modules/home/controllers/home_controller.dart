import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../views/tab_view/item_bacaan_sholat.dart';
import '../views/tab_view/item_doa.dart';
import '../views/tab_view/item_home.dart';
import 'tab_controllers/tab_bacaan_sholat_c.dart';
import 'tab_controllers/tab_doa_c.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final indexTab = 0.obs;
  final _tabDoa = Get.put(TabDoaController());
  final _tabBacaan = Get.put(TabBacaanSholatController());
  late Animation<double> animation;
  late AnimationController animationController;

  void initialCurve() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 360), vsync: this);
    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: animationController);
    animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);
  }

  @override
  void onInit() {
    initialCurve();
    super.onInit();
  }

  @override
  void onClose() {
    _tabBacaan.dispose();
    _tabDoa.dispose();
    animationController.dispose();
  }

  Widget myItemViewBuilder(int index) {
    switch (indexTab.value) {
      case 0:
        return const ItemHome();
      case 1:
        return _tabBacaan.obx((state) => ListView.builder(
            itemCount: state!.length,
            itemBuilder: (context, index) => ItemBacaanSholat(state[index])));
      case 2:
        return _tabDoa.obx((state) => ListView.builder(
            itemCount: state!.length,
            itemBuilder: (context, index) => ItemDoa(state[index])));
      default:
        return _tabBacaan.obx((state) => ListView.builder(
            itemCount: state!.length,
            itemBuilder: (context, index) => ItemBacaanSholat(state[index])));
    }
  }

  void updatePage(int value) {
    indexTab.value = value;
  }
}
