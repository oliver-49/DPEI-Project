import 'package:fixit/firebase/business_mode.dart';
import 'package:fixit/l10n/app_localizations.dart';
import 'package:fixit/gitHub/presentation/screens/account_service/Location/set_location/setlocation_cubit.dart';
import 'package:fixit/gitHub/presentation/screens/account_service/Location/set_location/setlocation_state.dart';
import 'package:fixit/gitHub/presentation/screens/account_service/service_offer/about_offer/aboutoffer.dart';
import 'package:fixit/gitHub/presentation/widgets/custombutton.dart';
import 'package:fixit/userModel/service_provider_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Setlocation extends StatelessWidget {
  final ServiceProviderModel provider;
  const Setlocation({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    final TextEditingController? buesinessAddressController =TextEditingController();
    final TextEditingController? buesinessNameController =TextEditingController();

    return BlocProvider(
      create: (_) => SetLocationCubit(),
      child: BlocBuilder<SetLocationCubit, SetLocationState>(
        builder: (context, state) {
          final cubit = context.read<SetLocationCubit>();

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
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.allowLocationTitle,
                      style: TextStyle(
                        color: const Color(0xff565656),
                        fontSize: screenWidth * 0.045,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    Text(
                      AppLocalizations.of(context)!.allowLocationSubtitle,
                      style: TextStyle(
                        color: const Color(0xff565656),
                        fontSize: screenWidth * 0.035,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.04),

                    Container(
                      height: screenHeight * 0.1,
                      width: screenWidth * 0.85,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: const Color(0xffCACACA)),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: screenWidth * 0.04),
                            child: Icon(
                              Icons.location_on_outlined,
                              color: Colors.black,
                              size: screenWidth * 0.06,
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.02),
                          Expanded(
                            child: Text(
                              state.location.isNotEmpty
                                  ? state.location
                                  : AppLocalizations.of(
                                      context,
                                    )!.defaultLocationText,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.025),

                    TextField(
                      controller: buesinessNameController,
                      onChanged: cubit.updateBusinessName,
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(
                          context,
                        )!.businessNameHint,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),

                    TextField(
                      controller: buesinessAddressController,
                      onChanged: cubit.updateBusinessAddress,
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(
                          context,
                        )!.businessAddressHint,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    ),

                    if (state.errorMessage != null)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Center(
                          child: Text(
                            state.errorMessage!,
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: screenWidth * 0.035,
                            ),
                          ),
                        ),
                      ),

                    SizedBox(height: screenHeight * 0.04),

                    buttonItem(
                      context,
                      text: AppLocalizations.of(context)!.continueButton,
                      onPressed: () async {
                        cubit.saveData();
                        if (state.businessName.isNotEmpty &&
                            state.businessAddress.isNotEmpty) {
                              await BusinessMode().setUserBusiness(
                                business_name : buesinessNameController!.text
                              , address : buesinessAddressController!.text, );
                              provider.businessAddress=buesinessAddressController.text;
                              provider.businessName=buesinessNameController.text;
                              print("-----------------");
                              print(provider);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>  ServiceOffer(provider: provider,),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
