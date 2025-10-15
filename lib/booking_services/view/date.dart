import 'package:fixit/booking_services/cubit/booking_cubit.dart';
import 'package:fixit/booking_services/cubit/booking_state.dart';
import 'package:fixit/booking_services/view/const.dart';
import 'package:fixit/booking_services/view/reviewsummary.dart';
import 'package:fixit/booking_services/widgets/custom_button.dart';
import 'package:fixit/booking_services/widgets/custom_skills.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart' as Intl;

class Date extends StatelessWidget {
  Date({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocListener<BookingCubit, BookingState>(
        listener: (context, state) {
          if (state is TimeSuccessState) {
            Get.snackbar(
              "نجاح",
              "تم اضافه  التاريخ بنجاح ",
              backgroundColor: Colors.green,
            );
            Get.to(Reviewsummary());
          }
          if (state is TimeErrorState) {
            Get.snackbar(
              "خطا",
              "من فضلك اختر الوقت ",
              backgroundColor: Colors.red,
            );
          }
        },
            child: Scaffold(
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: BlocBuilder<BookingCubit, BookingState>(
                      builder: (context, state) {
                        final cubit = context.read<BookingCubit>();
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: screenHeight * .040),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: const Icon(
                                    Icons.arrow_back,
                                    color: Color(0xff2B54A4),
                                  ),
                                ),
                                SizedBox(width: screenWidth * .020),
                                const Text(
                                  "حجز سباك",
                                  style: TextStyle(
                                    color: Color(0xff2B54A4),
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: screenHeight * .030),
                            Row(
                              children: [
                                Text(
                                  "حدد التاريخ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(width: screenWidth * .010),
                                Text(
                                  Intl.DateFormat.yMMMEd().format(
                                    cubit.selectedDay!,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: screenHeight * .010),
                            Container(
                              decoration: BoxDecoration(
                                color: const Color(0xffFFFFFF),
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: const [
                                  BoxShadow(
                                    offset: Offset(0, 5),
                                    blurRadius: 4,
                                    color: Color.fromARGB(255, 216, 214, 214),
                                  ),
                                ],
                              ),
                              child: TableCalendar(
                                focusedDay: cubit.focusedDay,
                                firstDay: DateTime.utc(2025, 9, 1),
                                lastDay: DateTime.utc(2026, 12, 31),
                                selectedDayPredicate: (day) =>
                                    isSameDay(cubit.selectedDay, day),
                                onDaySelected: cubit.dateChange,
                              ),
                            ),

                            SizedBox(height: screenHeight * .020),
                            Text(
                              "حدد الساعة",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: screenHeight * .010),
                            Text("AM"),
                            SizedBox(height: screenHeight * .010),
                            Wrap(
                              spacing: 30,
                              runSpacing: 10,
                              alignment: WrapAlignment.center,
                              children: timesAM.map((time) {
                                return customSkill(
                                  onTap: () => cubit.timeChange(time),
                                  txt: time,
                                  color: cubit.isChanged(time)
                                      ? Colors.red
                                      : Color(0xff0054A5),
                                );
                              }).toList(),
                            ),
                            SizedBox(height: screenHeight * .010),
                            Text("PM"),
                            SizedBox(height: screenHeight * .010),
                            Wrap(
                              spacing: 30,
                              runSpacing: 10,
                              alignment: WrapAlignment.center,
                              children: timesPM.map((time) {
                                return customSkill(
                                  onTap: () => cubit.timeChange(time),
                                  txt: time,
                                  color: cubit.isChanged(time)
                                      ? const Color.fromARGB(255, 176, 9, 9)
                                      : Color(0xff0054A5),
                                );
                              }).toList(),
                            ),

                            SizedBox(height: screenHeight * .040),
                            customButton(
                              title: "التالي",
                              onTap: () {
                                cubit.setDate();
                                cubit.setTime();
                                
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
          ),
      ),
    );
  }
}
