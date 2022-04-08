import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:stay_sunnah/app/global/services/notification_services.dart';
import 'package:stay_sunnah/app/modules/sunnah/controllers/sunnah_controller.dart';

import '../../../data/local/task_schema.dart';
import '../../../global/theme/my_color.dart';
import '../../../global/theme/my_text_style.dart';
import '../../sunnah/views/widgets/button.dart';
import '../../sunnah/views/widgets/input_field.dart';

class AddView extends GetView<SunnahController> {
  // String _endTime = "9:30 PM";
  // String _startTime = DateFormat('hh:mm a').format(DateTime.now()).toString();
  int _selectedRemind = 5;
  List<int> remindList = [5, 10, 15, 20];

  List<String> repeatList = [
    "Ngaji",
    "Sholat Tahajud",
    "Sholat Dhuha",
    "Sedekah",
  ];

  AddView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Obx(() {
          return SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "Stay Sunnah Task",
                  style: headingStyle,
                ),
                MyInputField(
                  title: "Title",
                  hint: "Enter your title",
                  controller: controller.titleController,
                ),
                MyInputField(
                  title: "Amalan",
                  hint: "${controller.selectedRepeat}",
                  widget: DropdownButton(
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey,
                      ),
                      iconSize: 32,
                      elevation: 4,
                      style: subTitleStyle,
                      underline: Container(
                        height: 0,
                      ),
                      onChanged: (String? newValue) {
                        controller.selectedRepeat.value = newValue!;
                      },
                      items: repeatList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        );
                      }).toList()),
                ),
                MyInputField(
                  title: "Note",
                  hint: "Enter your note",
                  controller: controller.noteController,
                ),
                MyInputField(
                  title: "Date",
                  hint: DateFormat.yMd().format(controller.selectedDate.value),
                  widget: IconButton(
                      icon: const Icon(
                        Icons.calendar_today_outlined,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        _getDateFromUser(context);
                      }),
                ),
                Row(
                  children: [
                    Expanded(
                      child: MyInputField(
                        title: "Start Time",
                        hint: controller.startTime.value,
                        widget: IconButton(
                          onPressed: () {
                            _getTimeFromUser(
                                isStartTime: true, context: context);
                          },
                          icon: const Icon(
                            Icons.access_time_rounded,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: MyInputField(
                        title: "End Time",
                        hint: controller.endTime.value,
                        widget: IconButton(
                          onPressed: () {
                            _getTimeFromUser(
                                isStartTime: false, context: context);
                          },
                          icon: const Icon(
                            Icons.access_time_rounded,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                MyInputField(
                  title: "Remind",
                  hint: "$_selectedRemind minutes early",
                  widget: DropdownButton(
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey,
                      ),
                      iconSize: 32,
                      elevation: 4,
                      style: subTitleStyle,
                      underline: Container(
                        height: 0,
                      ),
                      onChanged: (String? newValue) {
                        _selectedRemind = int.parse(newValue!);
                      },
                      items:
                          remindList.map<DropdownMenuItem<String>>((int value) {
                        return DropdownMenuItem<String>(
                          value: value.toString(),
                          child: Text(
                            value.toString(),
                          ),
                        );
                      }).toList()),
                ),
                const SizedBox(
                  height: 38,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _colorPallete(),
                    MyButton(
                        label: "Create Task",
                        onTap: () {
                          _validateDate();
                        }),
                  ],
                ),
                const SizedBox(
                  height: 38,
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  _validateDate() {
    if (controller.titleController.text.isNotEmpty &&
        controller.noteController.text.isNotEmpty) {
      // add to database
      _addTaskToDB();
      controller.setNotification();
      controller.refreshSunnah();
      Get.back();
    } else if (controller.titleController.text.isEmpty ||
        controller.noteController.text.isEmpty) {
      Get.snackbar(
        "Require",
        "All fields are required !",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white,
        colorText: pinkClr,
        icon: const Icon(
          Icons.warning_amber_rounded,
          color: Colors.red,
        ),
      );
    }
  }

  _addTaskToDB() async {
    int value = await controller.addTask(
        task: Task(
      note: controller.noteController.text,
      title: controller.titleController.text,
      date: DateFormat.yMd().format(controller.selectedDate.value),
      startTime: controller.startTime.value,
      endTime: controller.endTime.value,
      remind: _selectedRemind,
      repeat: controller.selectedRepeat.value,
      color: controller.selectedColor.value,
      isCompleted: 0,
    ));
    print("check id : $value");
  }

  _colorPallete() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        "Color",
        style: titleStyle,
      ),
      const SizedBox(
        height: 8.0,
      ),
      Obx(() {
        return Wrap(
          children: List<Widget>.generate(3, (int index) {
            return GestureDetector(
              onTap: () {
                controller.selectedColor.value = index;
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: CircleAvatar(
                  radius: 14,
                  backgroundColor: index == 0
                      ? primaryClr
                      : index == 1
                          ? pinkClr
                          : Colors.green,
                  child: controller.selectedColor.value == index
                      ? const Icon(
                          Icons.done,
                          color: Colors.white,
                          size: 16,
                        )
                      : Container(),
                ),
              ),
            );
          }),
        );
      })
    ]);
  }

  _getDateFromUser(BuildContext context) async {
    DateTime? _pickerDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2121),
    );

    if (_pickerDate != null) {
      controller.selectedDate.value = _pickerDate;
    } else {
      print("it's null or something is wrong");
    }
  }

  _getTimeFromUser(
      {required bool isStartTime, required BuildContext context}) async {
    var pickedTime = await _showTimePicker(context);
    String _formatedTime = pickedTime.format(context);
    if (pickedTime == null) {
      print("Time canceled");
    } else if (isStartTime == true) {
      controller.startTime.value = _formatedTime;
    } else if (isStartTime == false) {
      controller.endTime.value = _formatedTime;
    }
  }

  _showTimePicker(BuildContext context) {
    return showTimePicker(
      initialEntryMode: TimePickerEntryMode.input,
      context: context,
      initialTime: TimeOfDay(
        // controller.startTime --> 10:30 AM
        hour: int.parse(controller.startTime.split(":")[0]),
        minute: int.parse(controller.startTime.split(":")[1].split(" ")[0]),
      ),
    );
  }
}
