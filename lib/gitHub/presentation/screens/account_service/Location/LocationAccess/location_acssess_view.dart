import 'package:fixit/l10n/app_localizations.dart';
import 'package:fixit/gitHub/presentation/screens/account_service/Location/set_location/setlocation_view.dart';
import 'package:fixit/gitHub/presentation/widgets/custombutton.dart';
import 'package:fixit/userModel/service_provider_model.dart';
import 'package:flutter/material.dart';

class LocationAccessUI extends StatelessWidget {
   final ServiceProviderModel provider;
  const LocationAccessUI({super.key, required this.provider});

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
      body: SingleChildScrollView(
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
              "once",
              AppLocalizations.of(context)!.allowOnce,
              screenWidth,
              selectedOption,
            ),
            buildOption(
              "whileUsing",
              AppLocalizations.of(context)!.allowWhileUsing,
              screenWidth,
              selectedOption,
            ),
            buildOption(
              "donotAllow",
              AppLocalizations.of(context)!.donotAllow,
              screenWidth,
              selectedOption,
            ),

            SizedBox(height: screenHeight * 0.05),

            ValueListenableBuilder<String>(
              valueListenable: selectedOption,
              builder: (context, value, _) {
                return buttonItem(
                  context,
                  text: AppLocalizations.of(context)!.continueButton,
                  onPressed: value.isNotEmpty
                      ? () {
                        
                        print("-------------------------");
                        print(provider);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>  Setlocation(provider: provider),
                            ),
                          );
                        }
                      : null,
                );
              },
            ),

            SizedBox(height: screenHeight * 0.04),
          ],
        ),
      ),
    );
  }

  Widget buildOption(
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
            final isSelected = currentValue == value;
            return GestureDetector(
              onTap: () => selectedOption.value = value,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? const Color(0xffE0F0FF)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: isSelected
                        ? const Color(0xff0054A5)
                        : Colors.grey.shade300,
                    width: 1.5,
                  ),
                ),
                child: Text(
                  text,
                  style: TextStyle(
                    color: isSelected
                        ? const Color(0xff0054A5)
                        : const Color(0xff565656),
                    fontWeight: FontWeight.w700,
                    fontSize: screenWidth * 0.04,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
