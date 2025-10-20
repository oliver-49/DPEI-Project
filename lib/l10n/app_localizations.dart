import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// Title for account setup page
  ///
  /// In en, this message translates to:
  /// **'I am'**
  String get accountSetupTitle;

  /// Title for selecting service provider role
  ///
  /// In en, this message translates to:
  /// **'Service Provider'**
  String get roleProviderTitle;

  /// Subtitle explaining provider role
  ///
  /// In en, this message translates to:
  /// **'I offer professional services'**
  String get roleProviderSubtitle;

  /// Title for selecting customer role
  ///
  /// In en, this message translates to:
  /// **'Looking for service'**
  String get roleCustomerTitle;

  /// Subtitle explaining customer role
  ///
  /// In en, this message translates to:
  /// **'I am looking for home services.'**
  String get roleCustomerSubtitle;

  /// Button text for next step
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get nextButton;

  /// Prompt asking user to enter phone number
  ///
  /// In en, this message translates to:
  /// **'Enter your Phone number to verify'**
  String get enterPhoneTitle;

  /// Button to send verification code
  ///
  /// In en, this message translates to:
  /// **'Send Code'**
  String get sendCodeButton;

  /// Prompt asking user to enter 5-digit PIN
  ///
  /// In en, this message translates to:
  /// **'Enter 5-digit PIN code sent to your phone number'**
  String get enterPinTitle;

  /// Button to verify code
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get verifyButton;

  /// Message asking if user didn’t get code
  ///
  /// In en, this message translates to:
  /// **'Did not receive code?'**
  String get didNotReceiveCode;

  /// Button text to resend verification code
  ///
  /// In en, this message translates to:
  /// **'Send again'**
  String get sendAgain;

  /// Prompt asking for location permission
  ///
  /// In en, this message translates to:
  /// **'Allow “FixIt” to use your location'**
  String get allowLocationTitle;

  /// Subtitle explaining why location is needed
  ///
  /// In en, this message translates to:
  /// **'We need to know your exact location so that Clients can find you easily near you.'**
  String get allowLocationSubtitle;

  /// Option to allow location one time
  ///
  /// In en, this message translates to:
  /// **'Allow Once'**
  String get allowOnce;

  /// Option to allow location only while using the app
  ///
  /// In en, this message translates to:
  /// **'Allow While Using FixIt'**
  String get allowWhileUsing;

  /// Option to deny location permission
  ///
  /// In en, this message translates to:
  /// **'Don’t Allow'**
  String get donotAllow;

  /// Button text to continue
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueButton;

  /// Message prompting user to allow location access
  ///
  /// In en, this message translates to:
  /// **'Please allow location access to proceed.'**
  String get pleaseAllowLocation;

  /// No description provided for @defaultLocationText.
  ///
  /// In en, this message translates to:
  /// **'No location selected yet'**
  String get defaultLocationText;

  /// No description provided for @businessNameHint.
  ///
  /// In en, this message translates to:
  /// **'Business name'**
  String get businessNameHint;

  /// No description provided for @businessAddressHint.
  ///
  /// In en, this message translates to:
  /// **'Business address'**
  String get businessAddressHint;

  /// No description provided for @errorFillAllFields.
  ///
  /// In en, this message translates to:
  /// **'Please fill in all fields'**
  String get errorFillAllFields;

  /// No description provided for @serviceOfferTitle.
  ///
  /// In en, this message translates to:
  /// **'Service Offer'**
  String get serviceOfferTitle;

  /// No description provided for @selectService.
  ///
  /// In en, this message translates to:
  /// **'Select Your Service'**
  String get selectService;

  /// No description provided for @selectExperience.
  ///
  /// In en, this message translates to:
  /// **'Select Your Experience'**
  String get selectExperience;

  /// No description provided for @selectServiceArea.
  ///
  /// In en, this message translates to:
  /// **'Select Service Area'**
  String get selectServiceArea;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @optionCleaning.
  ///
  /// In en, this message translates to:
  /// **'Cleaning'**
  String get optionCleaning;

  /// No description provided for @optionPlumbing.
  ///
  /// In en, this message translates to:
  /// **'Plumbing'**
  String get optionPlumbing;

  /// No description provided for @optionElectrical.
  ///
  /// In en, this message translates to:
  /// **'Electrical'**
  String get optionElectrical;

  /// No description provided for @optionBeginner.
  ///
  /// In en, this message translates to:
  /// **'Beginner'**
  String get optionBeginner;

  /// No description provided for @optionIntermediate.
  ///
  /// In en, this message translates to:
  /// **'Intermediate'**
  String get optionIntermediate;

  /// No description provided for @optionExpert.
  ///
  /// In en, this message translates to:
  /// **'Expert'**
  String get optionExpert;

  /// Service option: Plumbing
  ///
  /// In en, this message translates to:
  /// **'Plumbing'**
  String get plumbing;

  /// Service option: Electricity
  ///
  /// In en, this message translates to:
  /// **'Electricity'**
  String get electricity;

  /// Service option: Cleaning
  ///
  /// In en, this message translates to:
  /// **'Cleaning'**
  String get cleaning;

  /// Service option: Painting
  ///
  /// In en, this message translates to:
  /// **'Painting'**
  String get painting;

  /// Service option: Gardening
  ///
  /// In en, this message translates to:
  /// **'Gardening'**
  String get gardening;

  /// Governorate: Cairo
  ///
  /// In en, this message translates to:
  /// **'Cairo'**
  String get cairo;

  /// Governorate: Giza
  ///
  /// In en, this message translates to:
  /// **'Giza'**
  String get giza;

  /// Governorate: Alexandria
  ///
  /// In en, this message translates to:
  /// **'Alexandria'**
  String get alexandria;

  /// Governorate: Luxor
  ///
  /// In en, this message translates to:
  /// **'Luxor'**
  String get luxor;

  /// Governorate: Aswan
  ///
  /// In en, this message translates to:
  /// **'Aswan'**
  String get aswan;

  /// Governorate: Suez
  ///
  /// In en, this message translates to:
  /// **'Suez'**
  String get suez;

  /// Governorate: Dakahlia
  ///
  /// In en, this message translates to:
  /// **'Dakahlia'**
  String get dakahlia;

  /// Governorate: Sharqia
  ///
  /// In en, this message translates to:
  /// **'Sharqia'**
  String get sharqia;

  /// Governorate: Beheira
  ///
  /// In en, this message translates to:
  /// **'Beheira'**
  String get beheira;

  /// Governorate: Menofia
  ///
  /// In en, this message translates to:
  /// **'Menofia'**
  String get menofia;

  /// Governorate: Minya
  ///
  /// In en, this message translates to:
  /// **'Minya'**
  String get minya;

  /// Governorate: Ismailia
  ///
  /// In en, this message translates to:
  /// **'Ismailia'**
  String get ismailia;

  /// Governorate: Qalyubia
  ///
  /// In en, this message translates to:
  /// **'Qalyubia'**
  String get qalyubia;

  /// Governorate: Gharbia
  ///
  /// In en, this message translates to:
  /// **'Gharbia'**
  String get gharbia;

  /// Governorate: Fayoum
  ///
  /// In en, this message translates to:
  /// **'Fayoum'**
  String get fayoum;

  /// Title of service working hours section
  ///
  /// In en, this message translates to:
  /// **'Service Working Hours'**
  String get serviceWorkingHours;

  /// Label for start time field
  ///
  /// In en, this message translates to:
  /// **'From'**
  String get from;

  /// Label for end time field
  ///
  /// In en, this message translates to:
  /// **'To'**
  String get to;

  /// Hint text for time input field
  ///
  /// In en, this message translates to:
  /// **'HH:MM'**
  String get timeHint;

  /// Title of the upload documents section
  ///
  /// In en, this message translates to:
  /// **'We need a few Documents.'**
  String get documentsTitle;

  /// Button text for uploading service license
  ///
  /// In en, this message translates to:
  /// **'Upload your service license'**
  String get uploadServiceLicense;

  /// Button text for uploading certification
  ///
  /// In en, this message translates to:
  /// **'Upload your certification'**
  String get uploadCertification;

  /// Text for the upload file button
  ///
  /// In en, this message translates to:
  /// **'Upload'**
  String get upload;

  /// Text for changing uploaded file
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get change;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
