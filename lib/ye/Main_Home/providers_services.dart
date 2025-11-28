import 'package:fixit/gitHub/booking_services/view/providerprofile.dart';
import 'package:fixit/userModel/service_provider_model.dart';
import 'package:fixit/ye/utalities/Dimensions.dart';
import 'package:fixit/ye/utalities/colors.dart';
import 'package:fixit/ye/utalities/custom_appbar.dart';
import 'package:fixit/ye/utalities/providers_card.dart';
import 'package:fixit/ye/widget/custom_provider_card.dart';
import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';

class ProvidersServices extends StatelessWidget {
  final List<ServiceProviderModel> providers;
  final ServiceProviderModel? provider;
  ProvidersServices({
    super.key,
    required this.providers,
    required this.provider,
  });

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    List<Map<String, List<Map<String, String>>>> personalCards = [
      {
        lang.electrician_providers: [
          {
            "img": "assets/images/Frame 1000003323 (1).png",
            "name": lang.jackson,
            "job": lang.electrician,
            "rate": "4.8",
          },
          {
            "img": "assets/images/Frame 1000003323 (2).png",
            "name": lang.emily_jani,
            "job": lang.electrician,
            "rate": "4.8",
          },
        ],
      },
      {
        lang.plumber_providers: [
          {
            "img": "assets/images/Frame 1000003323 (3).png",
            "name": lang.ethan_lita,
            "job": lang.plumber,
            "rate": "4.8",
          },
          {
            "img": "assets/images/Frame 1000003323 (4).png",
            "name": lang.isabella_una,
            "job": lang.plumber,
            "rate": "4.8",
          },
        ],
      },
      {
        lang.carpenter_providers: [
          {
            "img": "assets/images/Frame 1000003323 (5).png",
            "name": lang.aiden,
            "job": lang.carpenter,
            "rate": "4.8",
          },
          {
            "img": "assets/images/Frame 1000003323 (6).png",
            "name": lang.logan,
            "job": lang.carpenter,
            "rate": "4.8",
          },
        ],
      },
      {
        lang.painter_providers: [
          {
            "img": "assets/images/Frame 1000003323 (7).png",
            "name": lang.lucas,
            "job": lang.painter,
            "rate": "4.8",
          },
          {
            "img": "assets/images/Frame 1000003323 (8).png",
            "name": lang.ethan,
            "job": lang.painter,
            "rate": "4.8",
          },
        ],
      },
      {
        lang.cleaner_providers: [
          {
            "img": "assets/images/Frame 1000003323 (9).png",
            "name": lang.harper,
            "job": lang.cleaner,
            "rate": "4.8",
          },
          {
            "img": "assets/images/Frame 1000003323 (10).png",
            "name": lang.caleb,
            "job": lang.cleaner,
            "rate": "4.8",
          },
        ],
      },
      {
        lang.locksmith_providers: [
          {
            "img": "assets/images/Frame 1000003323 (11).png",
            "name": lang.benjamin,
            "job": lang.locksmith,
            "rate": "4.8",
          },
          {
            "img": "assets/images/Frame 1000003323 (12).png",
            "name": lang.carter,
            "job": lang.locksmith,
            "rate": "4.8",
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
              CustomAppBar(title: lang.services_providers),
              ProvidersCard(
                Data: personalCards,
                ontapView: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProviderProfile(imagePath: ""),
                    ),
                  );
                },
                ontap: () {},
              ),
              if (providers.length > 1) ...{
                ElevatedButton(
                  onPressed: () {
                    print("عدد المزودين: ${providers.length}");
                    print("المزودين: ${providers}");
                  },
                  child: Text(lang.viewAll),
                ),
                CustomProviderCard(
                  provider: provider,
                  Data: personalCards,
                  providers: providers,
                  ontapView: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProviderProfile(imagePath: ""),
                      ),
                    );
                  },
                  ontap: () {},
                ),
              },
              SizedBox(height: Dimensions(context).height10),
            ],
          ),
        ),
      ),
    );
  }
}
