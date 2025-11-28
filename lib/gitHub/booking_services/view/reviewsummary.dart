import 'package:fixit/esraa/screens/main_navigation_screen.dart';
import 'package:fixit/firebase/order.dart';
import 'package:fixit/gitHub/booking_services/cubit/booking_cubit.dart';
import 'package:fixit/gitHub/booking_services/cubit/booking_state.dart';
import 'package:fixit/gitHub/booking_services/view/providerprofile.dart';
import 'package:fixit/gitHub/booking_services/widgets/custom_button.dart';
import 'package:fixit/userModel/service_provider_model.dart';
import 'package:fixit/ye/Main_Home/navigation_page.dart';
import 'package:fixit/ye/utalities/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as Intl;

import '../../../l10n/app_localizations.dart';
import 'const.dart';

class Reviewsummary extends StatefulWidget {
  final ServiceProviderModel? customer_data;
   final ServiceProviderModel? provider_data ;
   Reviewsummary({super.key,  this.customer_data,
        this.provider_data});

  @override
  State<Reviewsummary> createState() => _ReviewsummaryState();
}

class _ReviewsummaryState extends State<Reviewsummary> {
  @override
  Widget build(BuildContext context) {
    var lang =AppLocalizations.of(context)!;

    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
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
                            SizedBox(height: screenHeight * .040),
                            Text(
                              widget.provider_data?.name??lang.emily_jani,
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
                                  child: Text(
                                    AppLocalizations.of(context)!.fullAddressFormat(
                                       cubit.fullAddress,
                                      cubit.homeNo,
                                       cubit.streetNo,
                                    ),
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
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
                      onTap: () async{
                        final summary = context.read<BookingCubit>().getAll();
                        print(summary);
                         print("////////  \n\n\n\n");
                          print(widget.customer_data?.uid);
                          print( widget.provider_data?.uid);

                        await Order().create(
                          widget.customer_data?.uid,
                          widget.provider_data?.uid,
                          summary.name,
                          summary.type,
                          summary.salary.toString(),
                          summary.fullAddress,
                          summary.homeNo,
                          summary.streetNo,
                          summary.date,
                          summary.time
                          );
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
        var lang =AppLocalizations.of(context)!;

        return BlocBuilder<BookingCubit, BookingState>(
          builder: (context, state) {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
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
                                  AppLocalizations.of(context)!.plumberArrival(
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
                                title: lang.home,
                                onTap: () {
                                  context.read<BookingCubit>().clearAll();
                                  Get.offAll(
                                    NavigationPage(provider:widget.customer_data)
                                    );
                                  
                                },
                              ),
                            ],
                          ),
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
