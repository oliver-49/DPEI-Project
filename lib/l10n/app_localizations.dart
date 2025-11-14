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
  /// **'send again'**
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

  /// Title of the account details screen in the app bar
  ///
  /// In en, this message translates to:
  /// **'Account Details'**
  String get accountDetails;

  /// Heading instructing the user to add their account details
  ///
  /// In en, this message translates to:
  /// **'Add Account Details'**
  String get addAccountDetails;

  /// Placeholder text for the owner's name input field
  ///
  /// In en, this message translates to:
  /// **'Owner Name'**
  String get ownerName;

  /// Placeholder text for the NIC (National ID) number field
  ///
  /// In en, this message translates to:
  /// **'NIC Number'**
  String get nicNumber;

  /// Placeholder text for the phone number input field
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumber;

  /// Label for the field showing when the NIC expires
  ///
  /// In en, this message translates to:
  /// **'NIC Expiry Date'**
  String get nicExpiryDate;

  /// Hint text showing the required date format
  ///
  /// In en, this message translates to:
  /// **'DD/MM/YYYY'**
  String get dateFormat;

  /// Text displayed while the form is being submitted
  ///
  /// In en, this message translates to:
  /// **'Submitting...'**
  String get submitting;

  /// Button text to proceed to the next step
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// Confirmation message shown after successful submission
  ///
  /// In en, this message translates to:
  /// **'Your application has been received!'**
  String get applicationReceived;

  /// Additional message explaining that the application will be reviewed
  ///
  /// In en, this message translates to:
  /// **'Thank you for submitting your application. Our team will review it soon.'**
  String get applicationReceivedMessage;

  /// Button text that takes the user back to the home screen
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Emily jani'**
  String get name;

  /// No description provided for @type.
  ///
  /// In en, this message translates to:
  /// **'Plumber'**
  String get type;

  /// No description provided for @rate.
  ///
  /// In en, this message translates to:
  /// **'Rating'**
  String get rate;

  /// No description provided for @order.
  ///
  /// In en, this message translates to:
  /// **'56 Orders '**
  String get order;

  /// No description provided for @complete.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get complete;

  /// No description provided for @years.
  ///
  /// In en, this message translates to:
  /// **'4 Years'**
  String get years;

  /// No description provided for @experience.
  ///
  /// In en, this message translates to:
  /// **'Experience'**
  String get experience;

  /// No description provided for @skills.
  ///
  /// In en, this message translates to:
  /// **'Skills'**
  String get skills;

  /// No description provided for @sink.
  ///
  /// In en, this message translates to:
  /// **'Sink'**
  String get sink;

  /// No description provided for @shower.
  ///
  /// In en, this message translates to:
  /// **'Shower'**
  String get shower;

  /// No description provided for @boiler.
  ///
  /// In en, this message translates to:
  /// **'Boiler'**
  String get boiler;

  /// No description provided for @toilet.
  ///
  /// In en, this message translates to:
  /// **'Toilet'**
  String get toilet;

  /// No description provided for @book.
  ///
  /// In en, this message translates to:
  /// **'Book'**
  String get book;

  /// No description provided for @bio.
  ///
  /// In en, this message translates to:
  /// **'Bio'**
  String get bio;

  /// No description provided for @bioDescription.
  ///
  /// In en, this message translates to:
  /// **'I\'m Emily Jani, a dedicated plumbing professional with a passion for delivering top notch service to ensure your home\'s plumbing runs smoothly. With years of hands-on experience.'**
  String get bioDescription;

  /// No description provided for @gallary.
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get gallary;

  /// No description provided for @viewAll.
  ///
  /// In en, this message translates to:
  /// **'View all'**
  String get viewAll;

  /// No description provided for @review.
  ///
  /// In en, this message translates to:
  /// **'Review'**
  String get review;

  /// No description provided for @nameUser.
  ///
  /// In en, this message translates to:
  /// **'yousef'**
  String get nameUser;

  /// No description provided for @comment.
  ///
  /// In en, this message translates to:
  /// **'Emily Jani exceeded my expectations! Quick, reliable, and fixed my plumbing issue with precision. Highly recommend.'**
  String get comment;

  /// No description provided for @bookPlumber.
  ///
  /// In en, this message translates to:
  /// **'Plumber booking'**
  String get bookPlumber;

  /// No description provided for @allowForFixit.
  ///
  /// In en, this message translates to:
  /// **'Allow “FixIt” to use your location'**
  String get allowForFixit;

  /// No description provided for @weAreNeedToKnowYourLocation.
  ///
  /// In en, this message translates to:
  /// **'We need to know your exact location so that The electrician can visit you easily.'**
  String get weAreNeedToKnowYourLocation;

  /// No description provided for @allowDuringUsingFixit.
  ///
  /// In en, this message translates to:
  /// **'Allow While Using FixIt'**
  String get allowDuringUsingFixit;

  /// No description provided for @dontAllow.
  ///
  /// In en, this message translates to:
  /// **'Don’t Allow'**
  String get dontAllow;

  /// No description provided for @fillManually.
  ///
  /// In en, this message translates to:
  /// **'Fill Manually'**
  String get fillManually;

  /// No description provided for @enterYourLocation.
  ///
  /// In en, this message translates to:
  /// **'Enter your location address'**
  String get enterYourLocation;

  /// No description provided for @houseNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter house number'**
  String get houseNumber;

  /// No description provided for @streetNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter street number'**
  String get streetNumber;

  /// No description provided for @fullLocation.
  ///
  /// In en, this message translates to:
  /// **'Enter street number'**
  String get fullLocation;

  /// No description provided for @success.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get success;

  /// No description provided for @locationIsAdded.
  ///
  /// In en, this message translates to:
  /// **'Your address has been successfully added.'**
  String get locationIsAdded;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @pleaseEnterVaildData.
  ///
  /// In en, this message translates to:
  /// **'Please enter correct information.'**
  String get pleaseEnterVaildData;

  /// No description provided for @selectDate.
  ///
  /// In en, this message translates to:
  /// **'Select Date'**
  String get selectDate;

  /// No description provided for @selectHour.
  ///
  /// In en, this message translates to:
  /// **'Select Hours'**
  String get selectHour;

  /// No description provided for @theDateHasBeenAddedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'The date has been added successfully.'**
  String get theDateHasBeenAddedSuccessfully;

  /// No description provided for @pleaseSelectTime.
  ///
  /// In en, this message translates to:
  /// **'Please select a time.'**
  String get pleaseSelectTime;

  /// No description provided for @am.
  ///
  /// In en, this message translates to:
  /// **'AM'**
  String get am;

  /// No description provided for @pm.
  ///
  /// In en, this message translates to:
  /// **'PM'**
  String get pm;

  /// No description provided for @reviewSummary.
  ///
  /// In en, this message translates to:
  /// **'Review Summary'**
  String get reviewSummary;

  /// No description provided for @craftsmanType.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get craftsmanType;

  /// No description provided for @salary.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get salary;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// Formatted full address
  ///
  /// In en, this message translates to:
  /// **'{fullAddress}/House No {homeNo}/Street No {streetNo}'**
  String fullAddressFormat(Object fullAddress, Object homeNo, Object streetNo);

  /// No description provided for @bookingDate.
  ///
  /// In en, this message translates to:
  /// **'Booking date'**
  String get bookingDate;

  /// No description provided for @bookingHour.
  ///
  /// In en, this message translates to:
  /// **'Booking Hours'**
  String get bookingHour;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @orderRecive.
  ///
  /// In en, this message translates to:
  /// **'Order received'**
  String get orderRecive;

  /// No description provided for @plumberArrival.
  ///
  /// In en, this message translates to:
  /// **'Based on your booking request received by the plumber, he will arrive at {time}.'**
  String plumberArrival(String time);

  /// No description provided for @selectVerifcationMethod.
  ///
  /// In en, this message translates to:
  /// **'Select Verification method '**
  String get selectVerifcationMethod;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @phone.
  ///
  /// In en, this message translates to:
  /// **'Mobile number'**
  String get phone;

  /// No description provided for @enterEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter your Email address to verify'**
  String get enterEmail;

  /// No description provided for @sendCode.
  ///
  /// In en, this message translates to:
  /// **'Send Code'**
  String get sendCode;

  /// No description provided for @pleaseEnterYourEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email'**
  String get pleaseEnterYourEmail;

  /// No description provided for @enterValidEmailAddress.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid email address'**
  String get enterValidEmailAddress;

  /// No description provided for @codeSendsSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'code sends successfully '**
  String get codeSendsSuccessfully;

  /// No description provided for @enter5digit.
  ///
  /// In en, this message translates to:
  /// **'Enter 5-digit PIN code sent to your Email address'**
  String get enter5digit;

  /// No description provided for @theCodeIsCorrect.
  ///
  /// In en, this message translates to:
  /// **'the code is correct'**
  String get theCodeIsCorrect;

  /// No description provided for @verify.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get verify;

  /// No description provided for @didNotRecivedCode.
  ///
  /// In en, this message translates to:
  /// **'Did not received code?'**
  String get didNotRecivedCode;

  /// No description provided for @createPassword.
  ///
  /// In en, this message translates to:
  /// **'Create new password'**
  String get createPassword;

  /// No description provided for @newPassword.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get newPassword;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @passwordUpdatedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Password updated successfully'**
  String get passwordUpdatedSuccessfully;
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
