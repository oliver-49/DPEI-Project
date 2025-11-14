import 'package:fixit/gitHub/booking_services/cubit/booking_cubit.dart';
import 'package:fixit/gitHub/booking_services/cubit/booking_state.dart';
import 'package:fixit/gitHub/booking_services/view/call.dart';
import 'package:fixit/gitHub/booking_services/view/gallery.dart';
import 'package:fixit/gitHub/booking_services/widgets/custom_button.dart';
import 'package:fixit/gitHub/booking_services/widgets/custom_rateandorders.dart';
import 'package:fixit/gitHub/booking_services/widgets/custom_review.dart';
import 'package:fixit/gitHub/booking_services/widgets/custom_skills.dart';
import 'package:fixit/ye/utalities/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../../l10n/app_localizations.dart';
import 'const.dart';
import 'location.dart';

class ProviderProfile extends StatelessWidget {
  ProviderProfile({super.key});
  bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var lang=AppLocalizations.of(context)!;
    String name = lang.name;

    String type = lang.type;
    var shadow=Shadow(color: Colors.grey, offset: Offset(0, 3), blurRadius: 10);
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: screenHeight * .350,
                    width: screenWidth,
                    decoration: BoxDecoration(
                      color: Color(0xffe0e9f1),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(32),
                        bottomRight: Radius.circular(32),
                      ),
                    ),
                    child: Image.asset(imagepath + "craftsman.png"),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                    child: Positioned(
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.7),
                            shape: BoxShape.circle,
                          ),
                          padding: EdgeInsets.all(6),
                          child: Icon(
                            Icons.arrow_back,
                            color: Color(0xff2B54A4),
                            size: 26,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: screenHeight * .024),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: BlocBuilder<BookingCubit, BookingState>(
                  builder: (context, state) {
                    final cubit = context.read<BookingCubit>();
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  name,
                                  style: TextStyle(
                                    shadows: [
                                      shadow
                                    ],
                                    fontSize: 24,
                                    color: Color(0xff565656),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: screenHeight * .012),
                                Text(
                                  type,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xff565656),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                Get.to(Call());
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0, 8),
                                      blurRadius: 4,
                                      color: Color.fromARGB(
                                        255,
                                        216,
                                        214,
                                        214,
                                      ),
                                    ),
                                  ],
                                ),
                                child: CircleAvatar(
                                  radius: screenHeight * .030,
                                  backgroundColor: Color(0xffEAEFF4),
                                  child: Icon(
                                    Icons.call,
                                    color: Color(0xff0054A5),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: screenWidth * .048),
                            BlocBuilder<BookingCubit, BookingState>(
                              builder: (context, state) {
                                bool isFav = true;
                                if (state is FavoritChange) {
                                  isFav = state.favorit;
                                }
                                return Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(0, 8),
                                        blurRadius: 4,
                                        color: Color.fromARGB(
                                          255,
                                          216,
                                          214,
                                          214,
                                        ),
                                      ),
                                    ],
                                  ),
                                  child: CircleAvatar(
                                    radius: screenHeight * .030,
                                    backgroundColor: Color(0xffEAEFF4),
                                    child: InkWell(
                                      onTap: () {
                                        context
                                            .read<BookingCubit>()
                                            .toggleFavorit();
                                      },
                                      child: Icon(
                                        isFav
                                            ? Icons.favorite_border_outlined
                                            : Icons.favorite,
                                        color: isFav
                                            ? Color(0xff0054A5)
                                            : Color(0xff0054A5),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight * .024),
                        RatingANDOrders(screenHeight: screenHeight),
                        SizedBox(height: screenHeight * .024),
                        Text(
                          lang.skills,
                          style: TextStyle(
                            shadows: [
                              shadow
                            ],
                            fontSize: 24,
                            color: Color(0xff565656),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: screenHeight * .024),
                        Wrap(
                          spacing: 20,
                          runSpacing: 10,
                          alignment: WrapAlignment.center,
                          children: skills(context).map((time) {
                            return customSkill(txt: time);
                          }).toList(),
                        ),
                        SizedBox(height: screenHeight * .032),
                        customButton(
                          title: lang.book,
                          onTap: () {
                            cubit.setName(name);
                            cubit.setType(type);
                            Get.to(Location());
                          },
                        ),
                        SizedBox(height: screenHeight * .028),
                        Text(
                          lang.bio,
                          style: TextStyle(
                            shadows: [
                            shadow
                            ],
                            fontSize: 24,
                            color: Color(0xff565656),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: screenHeight * .012),
                        Text(
                          lang.bioDescription,
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(height: screenHeight * .024),
                        Row(
                          children: [
                            Text(
                              lang.gallary,
                              style: TextStyle(
                                shadows: [
                                  shadow
                                ],
                                fontSize: 24,
                                color: Color(0xff565656),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                            InkWell(
                              onTap: () {
                                Get.to(Gallery());
                              },
                              child: Text(
                                lang.viewAll,
                                style: TextStyle(
                                  shadows: [
                                    shadow
                                  ],
                                  fontSize: 20,
                                  color: Color(0xff0054A5),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            for (var i in gall)
                              Container(
                                width: screenWidth * .20,
                                height: screenHeight * .20,
                                child: Image.asset(imagepath + i),
                              ),
                          ],
                        ),
                        Text(
                          lang.review,
                          style: TextStyle(
                            shadows: [
                              shadow
                            ],
                            fontSize: 24,
                            color: Color(0xff565656),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: screenHeight * .011),
                        Wrap(
                          spacing: 30,
                          runSpacing: 10,
                          alignment: WrapAlignment.center,
                          children: reviews(context).map((rev) {
                            return CustomReview(
                              date: "8/10/2025",
                              icon: Icons.star,
                              image: imagepath + "craftsman3.png",
                              name: "yousef",
                              text: rev,
                            );
                          }).toList(),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
