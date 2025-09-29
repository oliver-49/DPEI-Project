// account_setup_responsive.dart
import 'package:dpei_project/presentation/screens/account_service/Phone%20number/phonnumber.dart';
import 'package:dpei_project/presentation/screens/account_service/selectionview/selection_cubit.dart';
import 'package:dpei_project/presentation/screens/customescreens/customerphone.dart';
import 'package:dpei_project/presentation/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dpei_project/presentation/screens/account_service/widgets.dart';

class AccountSetup extends StatelessWidget {
  const AccountSetup({super.key});

  @override
  Widget build(BuildContext context) {
   
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return BlocListener<SelectionCubit, SelectionState>(
      listener: (context, state) {
        if (state is NavigationRequested) {
          if (state.destination == 'service_provider') {
            Navigator.push(context, MaterialPageRoute(builder: (_) => Phonnumber()));
          } else if (state.destination == 'customer') {
            Navigator.push(context, MaterialPageRoute(builder: (_) => Customerphone()));
          }
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
        
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.01,
              ),
              child: Image.asset(
                'assets/images/fram.png',
            
                width: screenWidth * 3,
              ),
            ),
          ),
        ),
        body: Padding(
         
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
               
                padding: EdgeInsets.only(
                  top: screenHeight * 0.04,
                  right: screenWidth * 0.5,
                ),
                child: const Text(
                  "I am",
                  style: TextStyle(
                    color: Color(0xff565656),
                    fontSize: 48, 
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
             
              SizedBox(height: screenHeight * 0.03),
              BlocBuilder<SelectionCubit, SelectionState>(
                builder: (context, state) {
                  final selectedOption = state is OptionSelected ? state.selectedOption : null;
                  return Column(
                    children: [
                      containerItem(
                        text1: 'Service Provider',
                        text2: 'I offer professional services',
                        isSelected: selectedOption == 'Service Provider',
                        onTap: () {
                          context.read<SelectionCubit>().selectOption('Service Provider');
                        },
                      ),
                    
                      SizedBox(height: screenHeight * 0.02),
                      containerItem(
                        text1: 'Looking for service',
                        text2: 'I am looking for home services.',
                        isSelected: selectedOption == 'Looking for service',
                        onTap: () {
                          context.read<SelectionCubit>().selectOption('Looking for service');
                        },
                      ),
                    ],
                  );
                },
              ),
          
              SizedBox(height: screenHeight * 0.06),
              buttonItem(
                context,
                text: 'Next',
                onPressed: () {
                  context.read<SelectionCubit>().onNextTapped();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}