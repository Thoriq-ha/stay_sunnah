// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:stay_sunnah/app/data/local/db_helper.dart';
import 'package:stay_sunnah/app/global/services/notification_services.dart';
import 'package:intl/intl.dart';
import 'package:stay_sunnah/app/routes/app_pages.dart';

import '../../../data/local/task_schema.dart';

class SunnahController extends GetxController
    with StateMixin<List<Map<String, dynamic>>> {
  List<Map<String, dynamic>> listTask = [];
  final TextEditingController titleController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  final Rx<DateTime> selectedDate = DateTime.now().obs;
  final RxString selectedRepeat = "None".obs;
  final RxInt selectedColor = 0.obs;
  final RxString endTime = "9:30 PM".obs;
  final RxString startTime =
      DateFormat('hh:mm a').format(DateTime.now()).toString().obs;
  final RxInt selectedRemind = 5.obs;
  final List<int> remindList = [5, 10, 15, 20].obs;
  List<String> repeatList = [
    "Ngaji",
    "Sholat Tahajud",
    "Sholat Dhuha",
    "Sedekah",
  ];

  int currentId = -1.obs;

  NotifyHelper notifyHelper = NotifyHelper();
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin(); //

  Future<int> addTask(Task task) async {
    return await DBHelper.createItem(task).then((value) {
      setNotification(task.repeat);
      return value;
    });
  }

  Future<int> editTask(Task task, int id) async {
    return await DBHelper.updateItem(id, task);
  }

  @override
  void onReady() {
    refreshSunnah();
    super.onReady();
  }

  @override
  void onInit() {
    super.onInit();
    refreshSunnah();
    NotifyHelper().initializeNotification();
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    noteController.dispose();
  }

  void refreshSunnah() async {
    final data = await DBHelper.getItems();
    listTask = data;
    change(listTask, status: RxStatus.success());
    showForm({});
    currentId = -1;
  }

  void deleteItem(int id) async {
    await DBHelper.deleteItem(id);
    refreshSunnah();
  }

  void setNotification(String? task) {
    print(_getTimeScheduled());
    NotifyHelper().scheduledNotification(_getTimeScheduled(), task!);
  }

  DateTime _getTimeScheduled() {
    int hour;
    if (startTime.split(" ")[1] == "am") {
      hour = int.parse(startTime.split(":")[0]);
    } else {
      hour = int.parse(startTime.split(":")[0]) + 12;
    }
    int minute = int.parse(startTime.split(":")[1].split(" ")[0]);

    print(DateTime(selectedDate.value.year, selectedDate.value.month,
        selectedDate.value.day, hour, minute));
    return DateTime(selectedDate.value.year, selectedDate.value.month,
        selectedDate.value.day, hour, minute);
  }

  void showForm(Map<String, dynamic> currentTask) {
    if (currentTask.isEmpty) {
      titleController.text = '';
      noteController.text = '';
      selectedDate.value = DateTime.now();
      selectedRepeat.value = "None";
      selectedColor.value = 0;
      endTime.value = "9:30 PM";
      startTime.value = DateFormat('hh:mm a').format(DateTime.now()).toString();
      selectedRemind.value = 5;
    } else {
      currentId = currentTask['id'];
      titleController.text = currentTask['title'];
      noteController.text = currentTask['note'];
      selectedRemind.value = currentTask['remind'];
      selectedDate.value = DateTime(
        int.parse(currentTask['date'].split("/")[2]),
        int.parse(currentTask['date'].split("/")[1]),
        int.parse(currentTask['date'].split("/")[0]),
      );
      selectedRepeat.value = currentTask['repeat'];
      selectedColor.value = currentTask['color'];
      endTime.value = currentTask['endTime'];
      startTime.value = currentTask['startTime'];
      Get.toNamed(Routes.ADD);
    }
  }
}
