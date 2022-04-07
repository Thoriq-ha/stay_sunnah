import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/local/db_helper.dart';
import '../../../data/local/task.dart';

class AddController extends GetxController {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  final Rx<DateTime> selectedDate = DateTime.now().obs;

  final RxString selectedRepeat = "None".obs;
  final RxInt selectedColor = 0.obs;

  Future<int> addTask({Task? task}) async {
    return await DBHelper.insert(task);
  }
}
