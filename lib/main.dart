import 'package:device_preview/device_preview.dart';
import 'package:fixit/booking_services/cubit/booking_cubit.dart';
import 'package:fixit/booking_services/view/providerprofile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

void main() => runApp(
  DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => BlocProvider(
      create: (context) => BookingCubit(),
      child: MyApp()), // Wrap your app
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xfff9f9f9),
      ),
      home:  ProviderProfile(),
    );
  }
}