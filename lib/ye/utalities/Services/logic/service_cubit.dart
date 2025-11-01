
import 'package:fixit/ye/utalities/Services/api_servece.dart';
import 'package:fixit/ye/utalities/Services/logic/service_state.dart';
import 'package:fixit/ye/utalities/Services/services_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServiceCubit extends Cubit<ServiceState>{
  ServiceCubit():super(ServiceInitial());

  Future <void>getServices(List<Map<String, dynamic>> Data)async{
    emit(ServiceLoadingState());
    try{
        final List<ServicesModel> services =await ApiServece().getServices(Data);
        emit(ServiceSuccessState(services:services));
    }catch(e){
        emit(ServicefalierState(
            errorMessege:e.toString()
        ));


    }
  }

  
  }