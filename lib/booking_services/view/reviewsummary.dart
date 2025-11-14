import 'package:fixit/booking_services/cubit/booking_cubit.dart';
import 'package:fixit/booking_services/cubit/booking_state.dart';
import 'package:fixit/booking_services/view/providerprofile.dart';
import 'package:fixit/booking_services/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as Intl;

import '../../../l10n/app_localizations.dart';
import 'const.dart';

class Reviewsummary extends StatefulWidget {
  const Reviewsummary({super.key});

  @override
  State<Reviewsummary> createState() => _ReviewsummaryState();
}

class _ReviewsummaryState extends State<Reviewsummary> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
<<<<<<< Updated upstream:lib/booking_services/view/reviewsummary.dart
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SingleChildScrollView(
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
=======
    var lang=AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
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
>>>>>>> Stashed changes:lib/gitHub/booking_services/view/reviewsummary.dart
                          ),
                        ),
                        SizedBox(width: screenWidth * .020),
                         Text(
                          lang.bookPlumber,
                          style: TextStyle(
                            color: Color(0xff2B54A4),
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * .030),
                     Text(
                     lang.reviewSummary,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: screenHeight * .010),
                    Container(
                      decoration: BoxDecoration(
                        color:  Color(0xffFFFFFF),
                        borderRadius: BorderRadius.circular(5),
                        boxShadow:  [
                          BoxShadow(
                            offset: Offset(0, 5),
                            blurRadius: 4,
                            color: Color.fromARGB(255, 216, 214, 214),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 17),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: screenHeight * .040),
                            Text(
                              cubit.name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: screenHeight * .040),
                            Divider(),
                            SizedBox(height: screenHeight * .020),
                            Row(
                              children: [
                                Text(
                                  lang.craftsmanType,
                                  style: TextStyle(
                                    color: Color(0xff919191),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  cubit.type,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: screenHeight * .010),
                            Row(
                              children: [
                                Text(
                                  lang.salary,
                                  style: TextStyle(
                                    color: Color(0xff919191),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  cubit.salary.toString(),
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: screenHeight * .010),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * .020),
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
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 17),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: screenHeight * .020),
                            Row(
                              children: [
                                Text(
                                  lang.address,
                                  style: TextStyle(
                                    color: Color(0xff919191),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Spacer(),
                                Expanded(
                                   child:
                                   Text(
                                     AppLocalizations.of(context)!.fullAddressFormat(
                                        cubit.fullAddress,
                                       cubit.homeNo,
                                        cubit.streetNo,
                                     ),
                                     style: TextStyle(
                                       fontSize: 13,
                                       fontWeight: FontWeight.bold,
                                     ),
                                   )
                                ),
                              ],
                            ),
                            SizedBox(height: screenHeight * .010),
                            Row(
                              children: [
                                Text(
                                  lang.bookingDate,
                                  style: TextStyle(
                                    color: Color(0xff919191),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  Intl.DateFormat.yMMMEd().format(
                                    cubit.date as DateTime,
                                  ),
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: screenHeight * .010),
                            Row(
                              children: [
                                Text(
                                  lang.bookingHour,
                                  style: TextStyle(
                                    color: Color(0xff919191),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  cubit.time,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: screenHeight * .010),
                            Divider(),
                            Row(
                              children: [
                                Text(
                                  lang.total,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  cubit.salary.toString(),
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: screenHeight * .010),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * .099),
                    customButton(
                      title: lang.confirm,
                      onTap: () {
                        Dialog(context, screenHeight);
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> Dialog(BuildContext context, double screenHeight) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        var lang=AppLocalizations.of(context)!;

        return BlocBuilder<BookingCubit, BookingState>(
          builder: (context, state) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Material(
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffFFFFFF),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 30,
                        horizontal: 10,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: screenHeight * .080,
                              child: Image.asset(imagepath + "confirm.png"),
                            ),
                            SizedBox(height: screenHeight * .020),
                            Text(
                              lang.orderRecive,
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: screenHeight * .010),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 30,
                              ),
                              child: Text(
                                textAlign: TextAlign.center,
                                  lang.plumberArrival(
                                     context.read<BookingCubit>().time,
                                  ),
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(height: screenHeight * .040),
                            customButton(
                              title:lang.home,
                              onTap: () {
                                context.read<BookingCubit>().clearAll();
                                Get.offAll(ProviderProfile());

                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
