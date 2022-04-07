import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stay_sunnah/app/data/local/db_helper.dart';

import '../../../data/local/task_schema.dart';

class SunnahController extends GetxController
    with StateMixin<List<Map<String, dynamic>>> {
  // var selectedDate = DateTime.now().obs;
  List<Map<String, dynamic>> listTask = [];

  final TextEditingController titleController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  final Rx<DateTime> selectedDate = DateTime.now().obs;

  final RxString selectedRepeat = "None".obs;
  final RxInt selectedColor = 0.obs;

  Future<int> addTask({Task? task}) async {
    return await DBHelper.createItem(task!);
  }

  @override
  void onInit() {
    super.onInit();
    refreshSunnah();
  }

  @override
  void onClose() {
    print("Onclose");
    super.onClose();
  }

  @override
  // TODO: implement onStart
  InternalFinalCallback<void> get onStart {
    print("OnStart");
    return super.onStart;
  }

  @override
  void onReady() {
    print('On Ready');
    super.onReady();
  }

  void refreshSunnah() async {
    final data = await DBHelper.getItems();
    listTask = data;
    change(listTask, status: RxStatus.success());
  }

  void deleteItem(int id) async {
    await DBHelper.deleteItem(id);
    refreshSunnah();
  }
}
