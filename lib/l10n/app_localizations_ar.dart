// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get accountSetupTitle => 'أنا';

  @override
  String get roleProviderTitle => 'مزود خدمة';

  @override
  String get roleProviderSubtitle => 'أقدم خدمات احترافية';

  @override
  String get roleCustomerTitle => 'باحث عن خدمة';

  @override
  String get roleCustomerSubtitle => 'أبحث عن خدمات منزلية.';

  @override
  String get nextButton => 'التالي';

  @override
  String get enterPhoneTitle => 'أدخل رقم هاتفك للتحقق';

  @override
  String get sendCodeButton => 'إرسال الكود';

  @override
  String get enterPinTitle => 'أدخل رمز التحقق المكون من 5 أرقام المرسل إلى رقم هاتفك';

  @override
  String get verifyButton => 'تحقق';

  @override
  String get didNotReceiveCode => 'لم تستلم الكود؟';

  @override
  String get sendAgain => 'أرسل مرة أخرى';

  @override
  String get allowLocationTitle => 'اسمح لتطبيق “FixIt” باستخدام موقعك';

  @override
  String get allowLocationSubtitle => 'نحتاج لمعرفة موقعك الدقيق حتى يتمكن العملاء من العثور عليك بسهولة بالقرب منك.';

  @override
  String get allowOnce => 'السماح مرة واحدة';

  @override
  String get allowWhileUsing => 'السماح أثناء استخدام FixIt';

  @override
  String get donotAllow => 'عدم السماح';

  @override
  String get continueButton => 'متابعة';
}
