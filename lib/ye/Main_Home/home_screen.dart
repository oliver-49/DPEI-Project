import 'package:fixit/firebase/get_all_provider_users.dart';
import 'package:fixit/gitHub/booking_services/cubit/booking_cubit.dart';
import 'package:fixit/gitHub/booking_services/view/providerprofile.dart';
import 'package:fixit/userModel/service_provider_model.dart';
import 'package:fixit/ye/Main_Home/popular_services.dart';
import 'package:fixit/ye/Main_Home/providers_services.dart';
import 'package:fixit/ye/utalities/home_appbar.dart';
import 'package:fixit/ye/utalities/Dimensions.dart';
import 'package:fixit/ye/utalities/colors.dart';
import 'package:fixit/ye/utalities/providers_card.dart';
import 'package:fixit/ye/utalities/Services/services_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  final ServiceProviderModel? provider;
  HomeScreen({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    List<Map<String, List<Map<String, dynamic>>>> servicesCard = [
      {
        lang.popular_services: [
          {"img": "assets/images/Plumber.png", "job": lang.plumbing},
          {"img": "assets/images/Multimeter.png", "job": lang.electric_work},
          {"img": "assets/images/Solar Energy.png", "job": lang.solar},
          {"img": "assets/images/Air Conditenior.png", "job": lang.air_condition},
        ]
      },
    ];

    List<Map<String, List<Map<String, String>>>> personalCard = [
      {
        lang.services_providers: [
          {
            "img": "assets/images/Frame 1000003323 (21).png",
            "name": lang.maskot_kota,
            "job": lang.plumber,
            "rate": "4.8"
          },
          {
            "img": "assets/images/Frame 1000003323 (22).png",
            "name": lang.shams_jan,
            "job": lang.electrician,
            "rate": "4.8"
          }
        ]
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Padding(
        padding: EdgeInsets.only(
            top: Dimensions(context).height10 * 5,
            left: 25,
            right: 25,
            bottom: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              HomeAppbar(),
              SizedBox(height: Dimensions(context).height10 * 2),
              Container(
                height: Dimensions(context).height10 * 20,
                width: double.infinity,
                child: Stack(
                  children: [
                    Positioned(
                      top: 20,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  AppColors.gradient1Color,
                                  AppColors.gradient2Color,
                                ])),
                        child: Padding(
                          padding:
                          EdgeInsets.all(Dimensions(context).height10 * 2),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                lang.get_30_off,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: Dimensions(context).height10),
                              Text(
                                lang.booking_home_services,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: Dimensions(context).height10 * 2,
                      top: 0,
                      child: Image.asset(
                        "assets/images/image 87.png",
                        height: Dimensions(context).height10 * 18,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: Dimensions(context).height10 * 6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: AppColors.greyColor!,
                                spreadRadius: 2),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(13.0),
                          child: Row(
                            children: [
                              Icon(Icons.search),
                              SizedBox(width: 15),
                              Text(lang.search_here),
                              Expanded(child: SizedBox()),
                              Icon(Icons.tune)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: Dimensions(context).height10 * 2),
              ServicesCard(
                Data: servicesCard,
                ontap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PopularServices()));
                },
              ),
              SizedBox(height: Dimensions(context).height10 * 2),
              ProvidersCard(
                Data: personalCard,
                ontap: () async {
                  ProviderService providerService = ProviderService();
                  List<ServiceProviderModel> providers =
                  await providerService.getAllServiceProviders();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProvidersServices(
                          provider: provider, providers: providers)));
                },
                ontapView: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => BlocProvider(
                        create: (context) => BookingCubit(),
                        child: ProviderProfile(imagePath: ""),
                      )));
                },
              ),
              SizedBox(height: Dimensions(context).height10 * 1.5),
            ],
          ),
        ),
      ),
    );
  }
}
