// ignore_for_file: avoid_print

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stay_sunnah/app/global/theme/my_component_style.dart';
import 'package:stay_sunnah/app/global/theme/my_text_style.dart';
import 'package:stay_sunnah/app/modules/home/controllers/tab_controllers/tab_home_c.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1455620611406-966ca6889d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1262&q=80',
  'https://images.unsplash.com/photo-1609599006353-e629aaabfeae?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
  'https://images.unsplash.com/photo-1586767003402-8ade266deb64?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
  'https://images.unsplash.com/photo-1628924775596-f83c0438e5e7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1512632578888-169bbbc64f33?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

List<Widget> imageSliders(double height, TabHomeController tabHomeC) {
  return imgList
      .map((item) => tabHomeC.obx((state) {
            print(state?.textId);
            return Stack(
              children: <Widget>[
                Image.network(
                  item,
                  height: height,
                  fit: BoxFit.fitHeight,
                ),
                Positioned(
                  bottom: 0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    height: height,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  ),
                ),
                Container(
                  height: height,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Todays Quote Islamic',
                        style: subHeadingStyle.copyWith(color: Colors.white),
                      ),
                      verticalSpace(18),
                      Text('${state?.textId}',
                          style: titleStyle.copyWith(color: Colors.white)),
                      verticalSpace(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '- Stay Sunnah brother',
                            style: subTitleStyle.copyWith(color: Colors.white),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            );
          }))
      .toList();
}

class ItemHome extends GetView<TabHomeController> {
  ItemHome({Key? key}) : super(key: key);
  final tabHomeC = Get.put(TabHomeController());

  @override
  Widget build(BuildContext context) {
    double carouselH = MediaQuery.of(context).size.height * 0.9;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CarouselSlider(
            options: CarouselOptions(
              onPageChanged: (index, reason) => tabHomeC.getRandomQuotes(),
              height: carouselH,
              viewportFraction: 1.0,
            ),
            items: imageSliders(carouselH, tabHomeC),
          )
        ],
      ),
    );
  }
}
