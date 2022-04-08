import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:stay_sunnah/app/global/theme/my_component_style.dart';
import 'package:stay_sunnah/app/routes/app_pages.dart';

import '../../../global/theme/my_color.dart';
import '../../../global/theme/my_text_style.dart';
import '../controllers/sunnah_controller.dart';
import 'widgets/button.dart';

class SunnahView extends GetView<SunnahController> {
  const SunnahView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(),
      body: controller.obx((state) {
        return Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _addTaskBar(),
              verticalSpace(16),
              _addDateBar(context, controller),
              verticalSpace(32),
              Text(
                'Task Sunnah',
                style: subHeadingStyle.copyWith(
                    color:
                        Theme.of(context).colorScheme.secondary.withOpacity(1)),
              ),
              verticalSpace(8),
              Flexible(
                child: ListView.builder(
                  itemCount: state?.length,
                  itemBuilder: (context, index) => Card(
                    margin: EdgeInsets.symmetric(vertical: 16),
                    color: state![index]['color'] == 0
                        ? primaryClr.withOpacity(0.7)
                        : state[index]['color'] == 1
                            ? pinkClr.withOpacity(0.7)
                            : Colors.green.withOpacity(0.7),
                    child: ListTile(
                        title: Text(
                          state[index]['title'],
                          style: titleStyle.copyWith(color: Colors.white),
                        ),
                        subtitle: Text(
                            '${state[index]['note']} ${state[index]['date']}'),
                        trailing: SizedBox(
                          width: 100,
                          child: Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () => controller
                                    .showForm(controller.listTask[index]),
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () => controller.deleteItem(
                                    controller.listTask[index]['id']),
                              ),
                            ],
                          ),
                        )),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

_addTaskBar() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            DateFormat.yMMMd().format(DateTime.now()),
            style: subHeadingStyle,
          ),
          Text(
            "Today",
            style: headingStyle,
          )
        ],
      ),
      MyButton(label: "+ Add Task", onTap: () => Get.toNamed(Routes.ADD))
    ],
  );
}

_addDateBar(BuildContext context, SunnahController controller) {
  return DatePicker(
    DateTime.now(),
    height: 100,
    width: 80,
    initialSelectedDate: DateTime.now(),
    selectionColor: Theme.of(context).primaryColor,
    selectedTextColor: Colors.white,
    dateTextStyle: GoogleFonts.lato(
      textStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.grey,
      ),
    ),
    dayTextStyle: GoogleFonts.lato(
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.grey,
      ),
    ),
    monthTextStyle: GoogleFonts.lato(
      textStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Colors.grey,
      ),
    ),
    onDateChange: (date) {
      controller.selectedDate.value = date;
    },
  );
}
