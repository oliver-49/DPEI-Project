import 'package:fixit/booking_services/view/const.dart';
import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';

class RatingANDOrders extends StatelessWidget {
  const RatingANDOrders({
    super.key,
    required this.screenHeight,
  });

  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    var lang=AppLocalizations.of(context)!;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: Color(0xffFFFFFF),
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 5),
            blurRadius: 4,
            color: Color.fromARGB(255, 216, 214, 214),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Image.asset(
                imagepath + "rate.png",
                height: screenHeight * .04,
              ),
              Text("4.8", style: TextStyle(fontSize: 18)),
              Text(lang.rate),
            ],
          ),
          Column(
            children: [
              Image.asset(
                imagepath + "order.png",
                height: screenHeight * .04,
              ),
              Text(
                lang.order,
                style: TextStyle(fontSize: 18),
              ),
              Text(lang.complete),
            ],
          ),
          Column(
            children: [
              Text(
                lang.years,
                style: TextStyle(fontSize: 18),
              ),
              Text(lang.experience),
            ],
          ),
        ],
      ),
    );
  }
}