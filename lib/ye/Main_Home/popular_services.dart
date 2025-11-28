import 'package:fixit/l10n/app_localizations.dart';
import 'package:fixit/ye/utalities/Dimensions.dart';
import 'package:fixit/ye/utalities/colors.dart';
import 'package:fixit/ye/utalities/custom_appbar.dart';
import 'package:fixit/ye/utalities/Services/services_card.dart';
import 'package:flutter/material.dart';

class PopularServices extends StatelessWidget {
  PopularServices({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    List<Map<String, List<Map<String, String>>>> servicesCard = [
      {
        lang.maintenance: [
          {
            "img": "assets/images/Air Conditenior.png",
            "job": lang.air_condition,
          },
          {"img": "assets/images/Multimeter.png", "job": lang.electric},
          {"img": "assets/images/image 100.png", "job": lang.siding_repair},
          {"img": "assets/images/Car Wash.png", "job": lang.car_wash},
        ],
      },
      {
        lang.cleaning: [
          {"img": "assets/images/Spin Mop.png", "job": lang.home_flooring},
          {"img": "assets/images/image 101.png", "job": lang.gutter},
          {"img": "assets/images/Frame 1000003290.png", "job": lang.carpet},
          {"img": "assets/images/Pliers.png", "job": lang.pliers},
        ],
      },
      {
        lang.home_improvement: [
          {"img": "assets/images/image 109.png", "job": lang.drilling},
          {"img": "assets/images/image 102.png", "job": lang.lawn},
          {"img": "assets/images/image 103.png", "job": lang.weed_control},
          {"img": "assets/images/Water Tap.png", "job": lang.water_tap},
        ],
      },
      {
        lang.security: [
          {"img": "assets/images/CCTV (1).png", "job": lang.cameras},
          {"img": "assets/images/image 104 (1).png", "job": lang.burglar_alarm},
          {"img": "assets/images/image 105 (1).png", "job": lang.sturdy_lock},
          {"img": "assets/images/Cctv (2).png", "job": lang.cctv},
        ],
      },
      {
        lang.car_maintenance: [
          {"img": "assets/images/Car Waxing.png", "job": lang.car_washer},
          {"img": "assets/images/image 109 (1).png", "job": lang.oil_change},
          {"img": "assets/images/image 110.png", "job": lang.car_battery},
          {"img": "assets/images/Car Wash.png", "job": lang.car_wash},
        ],
      },
      {
        lang.handyman_services: [
          {"img": "assets/images/image 108 (1).png", "job": lang.furniture},
          {"img": "assets/images/image 111.png", "job": lang.door},
          {"img": "assets/images/image 112.png", "job": lang.shelving},
          {
            "img":
                "assets/images/Painter holding paint roller and paint bucket.png",
            "job": lang.painting,
          },
        ],
      },
      {
        lang.other_services: [
          {"img": "assets/images/image 113.png", "job": lang.interior},
          {"img": "assets/images/image 114.png", "job": lang.exterior},
          {"img": "assets/images/image 115.png", "job": lang.wall},
          {"img": "assets/images/image 116.png", "job": lang.dish_wash},
          {"img": "assets/images/image 117 (1).png", "job": lang.loading},
          {"img": "assets/images/image 118.png", "job": lang.cutting},
          {
            "img": "assets/images/Boy mopping the floor.png",
            "job": lang.mopping_floor,
          },
        ],
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Padding(
        padding: EdgeInsets.only(
          left: Dimensions(context).height10,
          right: Dimensions(context).height10,
          bottom: Dimensions(context).height10,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(title: lang.popular_services),
              ServicesCard(Data: servicesCard, more: false, ontap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
