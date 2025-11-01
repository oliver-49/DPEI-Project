import 'package:fixit/ye/utalities/Services/logic/service_cubit.dart';
import 'package:fixit/ye/utalities/Services/logic/service_state.dart';
import 'package:fixit/ye/utalities/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CityPage extends StatelessWidget {
  const CityPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: BlocBuilder<ServiceCubit, ServiceState>(
      builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(top: 75.0,bottom: 10,left: 10,right: 10),
            child: Column(children: [
              if(state is ServiceLoadingState)...{
                Center(child: CircularProgressIndicator(),)
              }
              else if(state is ServicefalierState)...{
                Center(child: Text(state.errorMessege),)
                }
              else if(state is ServiceSuccessState)...{
              Expanded(
                child: 
                  ListView.builder(
                    itemCount: state.services.length
                    ,itemBuilder:(context,i){return 
                  ListTile(
                    title: Text(state.services[i].job.toString()),
                  
                  );
                  } ),
                
              )
               }
               ,
               SizedBox(),
            ]),
          );
        },
      ),
    );
  }
}
