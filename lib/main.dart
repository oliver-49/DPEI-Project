import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:fixit/booking_services/cubit/booking_cubit.dart';
import 'package:flutter/material.dart';
import 'package:fixit/account_setup_service_seeker/view/verification_method.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'booking_services/view/providerprofile.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('favoritesBox');
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) =>
          BlocProvider(create: (context) => BookingCubit(), child: MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Color(0xfff9f9f9)),
      home: ProviderProfile(),
    );
  }
}