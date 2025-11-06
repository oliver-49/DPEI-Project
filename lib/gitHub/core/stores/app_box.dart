import 'package:hive_flutter/hive_flutter.dart';

class AppBox {
  static const String _appBox = 'app';
  static const String setupDoneKey = 'setup_done';

  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox(_appBox);
  }

  static Box get box => Hive.box(_appBox);

  static bool isSetupDone() {
    return box.get(setupDoneKey, defaultValue: false) as bool;
  }


  static Future<void> setSetupDone(bool value) async {
    await box.put(setupDoneKey, value);
  }
}
