import 'package:dpei_project/l10n/app_localizations.dart';
import 'package:dpei_project/presentation/screens/account_service/Location/set_location/setlocation_view.dart';
import 'package:dpei_project/presentation/widgets/custombutton.dart';
import 'package:flutter/material.dart';

class LocationAccessUI extends StatelessWidget {
  const LocationAccessUI({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final selectedOption = ValueNotifier<String>('');

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: InkWell(
          onTap: () => Navigator.pop(context),
          child: Image.asset(
            'assets/images/locationfram.png',
            width: screenWidth * 3,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.06,
          vertical: screenHeight * 0.04,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.allowLocationTitle,
              style: TextStyle(
                fontSize: screenWidth * 0.045,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Text(
              AppLocalizations.of(context)!.allowLocationSubtitle,
              style: TextStyle(
                fontSize: screenWidth * 0.035,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            Center(
              child: Image.asset(
                'assets/images/image 49.png',
                width: screenWidth * 0.8,
              ),
            ),
            SizedBox(height: screenHeight * 0.05),

            buildOption(
              context,
              "once",
              AppLocalizations.of(context)!.allowOnce,
              screenWidth,
              selectedOption,
            ),
            buildOption(
              context,
              "whileUsing",
              AppLocalizations.of(context)!.allowWhileUsing,
              screenWidth,
              selectedOption,
            ),
            buildOption(
              context,
              "donotAllow",
              AppLocalizations.of(context)!.donotAllow,
              screenWidth,
              selectedOption,
            ),

            SizedBox(height: screenHeight * 0.05),
            buttonItem(
              context,
              text: AppLocalizations.of(context)!.continueButton,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => Setlocation()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOption(
    BuildContext context,
    String value,
    String text,
    double screenWidth,
    ValueNotifier<String> selectedOption,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Center(
        child: ValueListenableBuilder<String>(
          valueListenable: selectedOption,
          builder: (context, currentValue, _) {
            return InkWell(
              onTap: () => selectedOption.value = value,
              child: Text(
                text,
                style: TextStyle(
                  color: currentValue == value
                      ? const Color(0xff0054A5)
                      : const Color(0xff565656),
                  fontWeight: FontWeight.w700,
                  fontSize: screenWidth * 0.04,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
