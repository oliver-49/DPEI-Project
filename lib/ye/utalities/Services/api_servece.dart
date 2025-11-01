import 'package:fixit/ye/utalities/Services/services_model.dart';

class ApiServece {
  getServices(List<Map<String, dynamic>> Data){
    final response=Data;
    return
      (response as List)
      .map((e)=>ServicesModel
      .fromJson(e))
      .toList();
  }
}