import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:stay_sunnah/app/data/local/db_helper.dart';
import 'package:stay_sunnah/app/global/services/notification_services.dart';
import 'package:intl/intl.dart';

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
  NotifyHelper notifyHelper = NotifyHelper();
  RxString endTime = "9:30 PM".obs;
  RxString startTime =
      DateFormat('hh:mm a').format(DateTime.now()).toString().obs;

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin(); //

  Future<int> addTask({Task? task}) async {
    return await DBHelper.createItem(task!);
  }

  @override
  void onInit() {
    super.onInit();
    refreshSunnah();
    NotifyHelper().initializeNotification();
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

  void setNotification() {
    print(_getTimeScheduled());
    NotifyHelper().scheduledNotification(_getTimeScheduled());
  }

  DateTime _getTimeScheduled() {
    int hour = int.parse(startTime.split(":")[0]);
    int minute = int.parse(startTime.split(":")[1].split(" ")[0]);
    return DateTime(selectedDate.value.year, selectedDate.value.month,
        selectedDate.value.day, hour, minute);
  }
}
