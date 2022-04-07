import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:stay_sunnah/app/routes/app_pages.dart';

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
        return Column(
          children: [
            _addTaskBar(),
            _addDateBar(context, controller),
            Flexible(
              // height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                itemCount: state?.length,
                itemBuilder: (context, index) => Card(
                  color: Colors.orange[200],
                  margin: const EdgeInsets.all(15),
                  child: ListTile(
                      title: Text(state![index]['title']),
                      subtitle: Text(
                          '${state[index]['note']} ${state[index]['date']}'),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () => () {},
                              // onPressed: () => _showForm(controller.listTask[index]['id']),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              // onPressed: () {},
                              onPressed: () => controller
                                  .deleteItem(controller.listTask[index]['id']),
                            ),
                          ],
                        ),
                      )),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}

_addTaskBar() {
  return Container(
    margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
    child: Row(
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
    ),
  );
}

_addDateBar(BuildContext context, SunnahController controller) {
  return Container(
    margin: const EdgeInsets.only(top: 20, left: 20),
    child: DatePicker(
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
    ),
  );
}
