// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get accountSetupTitle => 'I am';

  @override
  String get roleProviderTitle => 'Service Provider';

  @override
  String get roleProviderSubtitle => 'I offer professional services';

  @override
  String get roleCustomerTitle => 'Looking for service';

  @override
  String get roleCustomerSubtitle => 'I am looking for home services.';

  @override
  String get nextButton => 'Next';

  @override
  String get enterPhoneTitle => 'Enter your Phone number to verify';

  @override
  String get sendCodeButton => 'Send Code';

  @override
  String get enterPinTitle =>
      'Enter 5-digit PIN code sent to your phone number';

  @override
  String get verifyButton => 'Verify';

  @override
  String get didNotReceiveCode => 'Did not receive code?';

  @override
  String get sendAgain => 'Send again';

  @override
  String get allowLocationTitle => 'Allow “FixIt” to use your location';

  @override
  String get allowLocationSubtitle =>
      'We need to know your exact location so that Clients can find you easily near you.';

  @override
  String get allowOnce => 'Allow Once';

  @override
  String get allowWhileUsing => 'Allow While Using FixIt';

  @override
  String get donotAllow => 'Don’t Allow';

  @override
  String get continueButton => 'Continue';

  @override
  String get pleaseAllowLocation => 'Please allow location access to proceed.';

  @override
  String get defaultLocationText => 'No location selected yet';

  @override
  String get businessNameHint => 'Business name';

  @override
  String get businessAddressHint => 'Business address';

  @override
  String get errorFillAllFields => 'Please fill in all fields';
}
