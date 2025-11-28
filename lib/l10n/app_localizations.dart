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

  /// No description provided for @error_loading.
  ///
  /// In en, this message translates to:
  /// **'Error loading provider data'**
  String get error_loading;

  /// No description provided for @welcome_title.
  ///
  /// In en, this message translates to:
  /// **'Welcome to FixIt'**
  String get welcome_title;

  /// No description provided for @welcome_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Discover a world of convenience and reliability. FixIt is your one stop solution for all your home service needs.'**
  String get welcome_subtitle;

  /// No description provided for @find_services_title.
  ///
  /// In en, this message translates to:
  /// **'Find Services'**
  String get find_services_title;

  /// No description provided for @find_services_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Browse and book a wide range of services from plumbing and electrical to appliance repair. We’ve got it all covered.'**
  String get find_services_subtitle;

  /// No description provided for @fast_reliable_title.
  ///
  /// In en, this message translates to:
  /// **'Fast & Reliable'**
  String get fast_reliable_title;

  /// No description provided for @fast_reliable_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Our professionals ensure quick and reliable service every time. Sit back and relax, we’ve got you covered.'**
  String get fast_reliable_subtitle;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @get_started.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get get_started;

  /// No description provided for @login_title.
  ///
  /// In en, this message translates to:
  /// **'Enter your email and password to login'**
  String get login_title;

  /// No description provided for @email_label.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get email_label;

  /// No description provided for @email_required.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email'**
  String get email_required;

  /// No description provided for @email_invalid_at.
  ///
  /// In en, this message translates to:
  /// **'Email must contain @'**
  String get email_invalid_at;

  /// No description provided for @email_invalid_com.
  ///
  /// In en, this message translates to:
  /// **'Email must end with .com'**
  String get email_invalid_com;

  /// No description provided for @password_label.
  ///
  /// In en, this message translates to:
  /// **'Enter password'**
  String get password_label;

  /// No description provided for @password_required.
  ///
  /// In en, this message translates to:
  /// **'Please enter your password'**
  String get password_required;

  /// No description provided for @password_short.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters long'**
  String get password_short;

  /// No description provided for @forgot_password.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgot_password;

  /// No description provided for @sign_in.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get sign_in;

  /// No description provided for @login_success.
  ///
  /// In en, this message translates to:
  /// **'Logged in successfully'**
  String get login_success;

  /// No description provided for @login_invalid_data.
  ///
  /// In en, this message translates to:
  /// **'Please, input valid data'**
  String get login_invalid_data;

  /// No description provided for @new_to_fixit.
  ///
  /// In en, this message translates to:
  /// **'New to FixIt?'**
  String get new_to_fixit;

  /// No description provided for @sign_up_now.
  ///
  /// In en, this message translates to:
  /// **'Sign Up now'**
  String get sign_up_now;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'Or'**
  String get or;

  /// No description provided for @login_with.
  ///
  /// In en, this message translates to:
  /// **'Log in with'**
  String get login_with;

  /// No description provided for @google.
  ///
  /// In en, this message translates to:
  /// **'Google'**
  String get google;

  /// No description provided for @facebook.
  ///
  /// In en, this message translates to:
  /// **'Facebook'**
  String get facebook;

  /// No description provided for @signup_title.
  ///
  /// In en, this message translates to:
  /// **'Enter your email and password to sign up'**
  String get signup_title;

  /// No description provided for @full_name.
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get full_name;

  /// No description provided for @agree_terms.
  ///
  /// In en, this message translates to:
  /// **'I Agree With FixIt’s'**
  String get agree_terms;

  /// No description provided for @terms_conditions.
  ///
  /// In en, this message translates to:
  /// **'Term & Conditions'**
  String get terms_conditions;

  /// No description provided for @sign_up.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get sign_up;

  /// No description provided for @account_created.
  ///
  /// In en, this message translates to:
  /// **'Account created successfully'**
  String get account_created;

  /// No description provided for @already_have_account.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get already_have_account;

  /// No description provided for @sign_in_now.
  ///
  /// In en, this message translates to:
  /// **'Sign in now'**
  String get sign_in_now;

  /// No description provided for @signup_with.
  ///
  /// In en, this message translates to:
  /// **'Sign up with'**
  String get signup_with;

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

  /// Title for the user's orders section
  ///
  /// In en, this message translates to:
  /// **'My Orders'**
  String get myOrders;

  /// No description provided for @city.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get city;

  /// No description provided for @orders.
  ///
  /// In en, this message translates to:
  /// **'Orders'**
  String get orders;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @unpaid.
  ///
  /// In en, this message translates to:
  /// **'Unpaid'**
  String get unpaid;

  /// No description provided for @paid.
  ///
  /// In en, this message translates to:
  /// **'Paid'**
  String get paid;

  /// No description provided for @schedule.
  ///
  /// In en, this message translates to:
  /// **'Scheduled'**
  String get schedule;

  /// No description provided for @noOrders.
  ///
  /// In en, this message translates to:
  /// **'No Orders Found'**
  String get noOrders;

  /// No description provided for @egp.
  ///
  /// In en, this message translates to:
  /// **'EGP'**
  String get egp;

  /// No description provided for @providerName.
  ///
  /// In en, this message translates to:
  /// **'Provider'**
  String get providerName;

  /// No description provided for @date.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get date;

  /// No description provided for @arrivalTime.
  ///
  /// In en, this message translates to:
  /// **'Arrival Time'**
  String get arrivalTime;

  /// No description provided for @payNow.
  ///
  /// In en, this message translates to:
  /// **'Pay Now'**
  String get payNow;

  /// No description provided for @viewReceipt.
  ///
  /// In en, this message translates to:
  /// **'View Receipt'**
  String get viewReceipt;

  /// No description provided for @cancelBooking.
  ///
  /// In en, this message translates to:
  /// **'Cancel Booking'**
  String get cancelBooking;

  /// No description provided for @amountToPay.
  ///
  /// In en, this message translates to:
  /// **'Amount to pay'**
  String get amountToPay;

  /// No description provided for @unpaidSubtitle.
  ///
  /// In en, this message translates to:
  /// **'You have not paid yet for below service'**
  String get unpaidSubtitle;

  /// No description provided for @details.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get details;

  /// No description provided for @paidSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Paid services'**
  String get paidSubtitle;

  /// No description provided for @scheduleSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Upcoming Booking services'**
  String get scheduleSubtitle;

  /// No description provided for @amountToPaid.
  ///
  /// In en, this message translates to:
  /// **'Amount to paid'**
  String get amountToPaid;

  /// No description provided for @bookingDate.
  ///
  /// In en, this message translates to:
  /// **'Booking date'**
  String get bookingDate;

  /// No description provided for @payment.
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get payment;

  /// No description provided for @selectPaymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Select Payment method'**
  String get selectPaymentMethod;

  /// No description provided for @addNewCard.
  ///
  /// In en, this message translates to:
  /// **'Add new card'**
  String get addNewCard;

  /// No description provided for @cardNumber.
  ///
  /// In en, this message translates to:
  /// **'Card number'**
  String get cardNumber;

  /// No description provided for @cardHolderName.
  ///
  /// In en, this message translates to:
  /// **'Card holder name'**
  String get cardHolderName;

  /// No description provided for @cardExpiryDate.
  ///
  /// In en, this message translates to:
  /// **'Card expiry date'**
  String get cardExpiryDate;

  /// No description provided for @cvv.
  ///
  /// In en, this message translates to:
  /// **'CVV'**
  String get cvv;

  /// No description provided for @continueBtn.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueBtn;

  /// No description provided for @hour.
  ///
  /// In en, this message translates to:
  /// **'hour'**
  String get hour;

  /// No description provided for @hourLabel.
  ///
  /// In en, this message translates to:
  /// **'H'**
  String get hourLabel;

  /// No description provided for @perHour.
  ///
  /// In en, this message translates to:
  /// **'H'**
  String get perHour;

  /// No description provided for @enterValidCardNumber.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid 16-digit card number'**
  String get enterValidCardNumber;

  /// No description provided for @enterExpiryDate.
  ///
  /// In en, this message translates to:
  /// **'Please choose an expiry date'**
  String get enterExpiryDate;

  /// No description provided for @enterValidCvv.
  ///
  /// In en, this message translates to:
  /// **'CVV must be 3 to 4 digits'**
  String get enterValidCvv;

  /// No description provided for @paymentSuccessful.
  ///
  /// In en, this message translates to:
  /// **'Payment successful'**
  String get paymentSuccessful;

  /// No description provided for @paymentOf.
  ///
  /// In en, this message translates to:
  /// **'Payment of'**
  String get paymentOf;

  /// No description provided for @paidSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'has been paid successfully'**
  String get paidSuccessfully;

  /// No description provided for @giveFeedback.
  ///
  /// In en, this message translates to:
  /// **'Give Feedback'**
  String get giveFeedback;

  /// No description provided for @howWasExperience.
  ///
  /// In en, this message translates to:
  /// **'How was your experience with Fix it?'**
  String get howWasExperience;

  /// No description provided for @writeFeedback.
  ///
  /// In en, this message translates to:
  /// **'Write in the box below'**
  String get writeFeedback;

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// No description provided for @pay.
  ///
  /// In en, this message translates to:
  /// **'pay'**
  String get pay;

  /// No description provided for @write_here.
  ///
  /// In en, this message translates to:
  /// **'Write here...'**
  String get write_here;

  /// No description provided for @electric_work.
  ///
  /// In en, this message translates to:
  /// **'Electric Work'**
  String get electric_work;

  /// No description provided for @solar.
  ///
  /// In en, this message translates to:
  /// **'Solar'**
  String get solar;

  /// No description provided for @search_here.
  ///
  /// In en, this message translates to:
  /// **'Search Here...'**
  String get search_here;

  /// No description provided for @get_30_off.
  ///
  /// In en, this message translates to:
  /// **'Get 30% off'**
  String get get_30_off;

  /// No description provided for @booking_home_services.
  ///
  /// In en, this message translates to:
  /// **'Just by Booking Home Services'**
  String get booking_home_services;

  /// No description provided for @maskot_kota.
  ///
  /// In en, this message translates to:
  /// **'Maskot Kota'**
  String get maskot_kota;

  /// No description provided for @shams_jan.
  ///
  /// In en, this message translates to:
  /// **'Shams Jan'**
  String get shams_jan;

  /// No description provided for @home_booking_services.
  ///
  /// In en, this message translates to:
  /// **'Just by Booking Home Services'**
  String get home_booking_services;

  /// No description provided for @home_search_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Search Here..'**
  String get home_search_placeholder;

  /// No description provided for @home_popular_services.
  ///
  /// In en, this message translates to:
  /// **'Popular Services'**
  String get home_popular_services;

  /// No description provided for @home_service_providers.
  ///
  /// In en, this message translates to:
  /// **'Service Providers'**
  String get home_service_providers;

  /// No description provided for @nav_home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get nav_home;

  /// No description provided for @nav_order.
  ///
  /// In en, this message translates to:
  /// **'Order'**
  String get nav_order;

  /// No description provided for @nav_profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get nav_profile;

  /// No description provided for @rating.
  ///
  /// In en, this message translates to:
  /// **'Rating'**
  String get rating;

  /// No description provided for @no_providers.
  ///
  /// In en, this message translates to:
  /// **'No providers available at the moment.'**
  String get no_providers;

  /// No description provided for @loading_providers.
  ///
  /// In en, this message translates to:
  /// **'Loading providers...'**
  String get loading_providers;

  /// No description provided for @provider_details.
  ///
  /// In en, this message translates to:
  /// **'Provider Details'**
  String get provider_details;

  /// No description provided for @service_type.
  ///
  /// In en, this message translates to:
  /// **'Service Type'**
  String get service_type;

  /// No description provided for @electrician.
  ///
  /// In en, this message translates to:
  /// **'Electrician'**
  String get electrician;

  /// No description provided for @carpenter.
  ///
  /// In en, this message translates to:
  /// **'Carpenter'**
  String get carpenter;

  /// No description provided for @painter.
  ///
  /// In en, this message translates to:
  /// **'Painter'**
  String get painter;

  /// No description provided for @cleaner.
  ///
  /// In en, this message translates to:
  /// **'Cleaner'**
  String get cleaner;

  /// No description provided for @locksmith.
  ///
  /// In en, this message translates to:
  /// **'Locksmith'**
  String get locksmith;

  /// No description provided for @jackson.
  ///
  /// In en, this message translates to:
  /// **'Jackson'**
  String get jackson;

  /// No description provided for @ethan_lita.
  ///
  /// In en, this message translates to:
  /// **'Ethan Lita'**
  String get ethan_lita;

  /// No description provided for @isabella_una.
  ///
  /// In en, this message translates to:
  /// **'Isabella Una'**
  String get isabella_una;

  /// No description provided for @aiden.
  ///
  /// In en, this message translates to:
  /// **'Aiden'**
  String get aiden;

  /// No description provided for @logan.
  ///
  /// In en, this message translates to:
  /// **'Logan'**
  String get logan;

  /// No description provided for @lucas.
  ///
  /// In en, this message translates to:
  /// **'Lucas'**
  String get lucas;

  /// No description provided for @ethan.
  ///
  /// In en, this message translates to:
  /// **'Ethan'**
  String get ethan;

  /// No description provided for @harper.
  ///
  /// In en, this message translates to:
  /// **'Harper'**
  String get harper;

  /// No description provided for @caleb.
  ///
  /// In en, this message translates to:
  /// **'Caleb'**
  String get caleb;

  /// No description provided for @benjamin.
  ///
  /// In en, this message translates to:
  /// **'Benjamin'**
  String get benjamin;

  /// No description provided for @carter.
  ///
  /// In en, this message translates to:
  /// **'Carter'**
  String get carter;

  /// No description provided for @popular_services.
  ///
  /// In en, this message translates to:
  /// **'Popular Services'**
  String get popular_services;

  /// No description provided for @maintenance.
  ///
  /// In en, this message translates to:
  /// **'Maintenance'**
  String get maintenance;

  /// No description provided for @home_improvement.
  ///
  /// In en, this message translates to:
  /// **'Home Improvement'**
  String get home_improvement;

  /// No description provided for @security.
  ///
  /// In en, this message translates to:
  /// **'Security'**
  String get security;

  /// No description provided for @car_maintenance.
  ///
  /// In en, this message translates to:
  /// **'Car Maintenance'**
  String get car_maintenance;

  /// No description provided for @handyman_services.
  ///
  /// In en, this message translates to:
  /// **'Handyman Services'**
  String get handyman_services;

  /// No description provided for @other_services.
  ///
  /// In en, this message translates to:
  /// **'Other Services'**
  String get other_services;

  /// No description provided for @air_condition.
  ///
  /// In en, this message translates to:
  /// **'Air Condition'**
  String get air_condition;

  /// No description provided for @electric.
  ///
  /// In en, this message translates to:
  /// **'Electric'**
  String get electric;

  /// No description provided for @siding_repair.
  ///
  /// In en, this message translates to:
  /// **'Siding Repair'**
  String get siding_repair;

  /// No description provided for @car_wash.
  ///
  /// In en, this message translates to:
  /// **'Car Wash'**
  String get car_wash;

  /// No description provided for @home_flooring.
  ///
  /// In en, this message translates to:
  /// **'Home Flooring'**
  String get home_flooring;

  /// No description provided for @gutter.
  ///
  /// In en, this message translates to:
  /// **'Gutter'**
  String get gutter;

  /// No description provided for @carpet.
  ///
  /// In en, this message translates to:
  /// **'Carpet'**
  String get carpet;

  /// No description provided for @pliers.
  ///
  /// In en, this message translates to:
  /// **'Pliers'**
  String get pliers;

  /// No description provided for @drilling.
  ///
  /// In en, this message translates to:
  /// **'Drilling'**
  String get drilling;

  /// No description provided for @lawn.
  ///
  /// In en, this message translates to:
  /// **'Lawn'**
  String get lawn;

  /// No description provided for @weed_control.
  ///
  /// In en, this message translates to:
  /// **'Weed Control'**
  String get weed_control;

  /// No description provided for @water_tap.
  ///
  /// In en, this message translates to:
  /// **'Water Tap'**
  String get water_tap;

  /// No description provided for @cameras.
  ///
  /// In en, this message translates to:
  /// **'Cameras'**
  String get cameras;

  /// No description provided for @burglar_alarm.
  ///
  /// In en, this message translates to:
  /// **'Burglar Alarm'**
  String get burglar_alarm;

  /// No description provided for @sturdy_lock.
  ///
  /// In en, this message translates to:
  /// **'Sturdy Lock'**
  String get sturdy_lock;

  /// No description provided for @cctv.
  ///
  /// In en, this message translates to:
  /// **'CCTV'**
  String get cctv;

  /// No description provided for @car_washer.
  ///
  /// In en, this message translates to:
  /// **'Car Washer'**
  String get car_washer;

  /// No description provided for @oil_change.
  ///
  /// In en, this message translates to:
  /// **'Oil Change'**
  String get oil_change;

  /// No description provided for @car_battery.
  ///
  /// In en, this message translates to:
  /// **'Car Battery'**
  String get car_battery;

  /// No description provided for @furniture.
  ///
  /// In en, this message translates to:
  /// **'Furniture'**
  String get furniture;

  /// No description provided for @door.
  ///
  /// In en, this message translates to:
  /// **'Door'**
  String get door;

  /// No description provided for @shelving.
  ///
  /// In en, this message translates to:
  /// **'Shelving'**
  String get shelving;

  /// No description provided for @interior.
  ///
  /// In en, this message translates to:
  /// **'Interior'**
  String get interior;

  /// No description provided for @exterior.
  ///
  /// In en, this message translates to:
  /// **'Exterior'**
  String get exterior;

  /// No description provided for @wall.
  ///
  /// In en, this message translates to:
  /// **'Wall'**
  String get wall;

  /// No description provided for @dish_wash.
  ///
  /// In en, this message translates to:
  /// **'Dish Wash'**
  String get dish_wash;

  /// No description provided for @cutting.
  ///
  /// In en, this message translates to:
  /// **'Cutting'**
  String get cutting;

  /// No description provided for @mopping_floor.
  ///
  /// In en, this message translates to:
  /// **'Mopping Floor'**
  String get mopping_floor;

  /// No description provided for @services_providers.
  ///
  /// In en, this message translates to:
  /// **'Services Providers'**
  String get services_providers;

  /// No description provided for @electrician_providers.
  ///
  /// In en, this message translates to:
  /// **'Electrician Providers'**
  String get electrician_providers;

  /// No description provided for @plumber_providers.
  ///
  /// In en, this message translates to:
  /// **'Plumber Providers'**
  String get plumber_providers;

  /// No description provided for @carpenter_providers.
  ///
  /// In en, this message translates to:
  /// **'Carpenter Providers'**
  String get carpenter_providers;

  /// No description provided for @painter_providers.
  ///
  /// In en, this message translates to:
  /// **'Painter Providers'**
  String get painter_providers;

  /// No description provided for @cleaner_providers.
  ///
  /// In en, this message translates to:
  /// **'Cleaner Providers'**
  String get cleaner_providers;

  /// No description provided for @locksmith_providers.
  ///
  /// In en, this message translates to:
  /// **'Locksmith Providers'**
  String get locksmith_providers;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @emily_jani.
  ///
  /// In en, this message translates to:
  /// **'Emily jani'**
  String get emily_jani;

  /// No description provided for @plumber.
  ///
  /// In en, this message translates to:
  /// **'Plumber'**
  String get plumber;

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
  /// **'3 Years'**
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

  /// No description provided for @edit_profile.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get edit_profile;

  /// No description provided for @country.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get country;

  /// No description provided for @phone_number.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get phone_number;

  /// No description provided for @egy.
  ///
  /// In en, this message translates to:
  /// **'egy'**
  String get egy;

  /// No description provided for @egypt.
  ///
  /// In en, this message translates to:
  /// **'Egypt'**
  String get egypt;

  /// No description provided for @mexico.
  ///
  /// In en, this message translates to:
  /// **'Mexico'**
  String get mexico;

  /// No description provided for @usa.
  ///
  /// In en, this message translates to:
  /// **'USA'**
  String get usa;

  /// No description provided for @canada.
  ///
  /// In en, this message translates to:
  /// **'Canada'**
  String get canada;

  /// No description provided for @other.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get other;

  /// No description provided for @profession.
  ///
  /// In en, this message translates to:
  /// **'Profession'**
  String get profession;

  /// No description provided for @verification.
  ///
  /// In en, this message translates to:
  /// **'Verification'**
  String get verification;

  /// No description provided for @profile_information.
  ///
  /// In en, this message translates to:
  /// **'Profile information'**
  String get profile_information;

  /// No description provided for @home_clean_lawn_clean_washing.
  ///
  /// In en, this message translates to:
  /// **'Home clean, lawn clean, washing'**
  String get home_clean_lawn_clean_washing;

  /// No description provided for @subscription_payments.
  ///
  /// In en, this message translates to:
  /// **'Subscription & payments'**
  String get subscription_payments;

  /// No description provided for @payment_method.
  ///
  /// In en, this message translates to:
  /// **'Payment method'**
  String get payment_method;

  /// No description provided for @upgrade.
  ///
  /// In en, this message translates to:
  /// **'Upgrade'**
  String get upgrade;

  /// No description provided for @general_preferences.
  ///
  /// In en, this message translates to:
  /// **'General Preferences'**
  String get general_preferences;

  /// No description provided for @notification.
  ///
  /// In en, this message translates to:
  /// **'Notification'**
  String get notification;

  /// No description provided for @help_support.
  ///
  /// In en, this message translates to:
  /// **'Help & support'**
  String get help_support;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @confirm_logout.
  ///
  /// In en, this message translates to:
  /// **'Confirm Logout'**
  String get confirm_logout;

  /// No description provided for @logout_confirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to log out?'**
  String get logout_confirmation;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @change_profile_mode.
  ///
  /// In en, this message translates to:
  /// **'Change Profile to buying mode'**
  String get change_profile_mode;

  /// No description provided for @earnings.
  ///
  /// In en, this message translates to:
  /// **'Earnings'**
  String get earnings;

  /// No description provided for @active.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get active;

  /// No description provided for @completed.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get completed;

  /// No description provided for @service_name.
  ///
  /// In en, this message translates to:
  /// **'Service name'**
  String get service_name;

  /// No description provided for @expert_in.
  ///
  /// In en, this message translates to:
  /// **'Expert in'**
  String get expert_in;

  /// No description provided for @service_timing.
  ///
  /// In en, this message translates to:
  /// **'Service Timing'**
  String get service_timing;

  /// No description provided for @experience_in_years.
  ///
  /// In en, this message translates to:
  /// **'Experience in years'**
  String get experience_in_years;

  /// No description provided for @service_area.
  ///
  /// In en, this message translates to:
  /// **'Service Area'**
  String get service_area;

  /// No description provided for @upload_services_license.
  ///
  /// In en, this message translates to:
  /// **'Upload your services license'**
  String get upload_services_license;

  /// No description provided for @upload_certification.
  ///
  /// In en, this message translates to:
  /// **'Upload your Certification'**
  String get upload_certification;

  /// No description provided for @order_success_title.
  ///
  /// In en, this message translates to:
  /// **'You placed the order successfully'**
  String get order_success_title;

  /// No description provided for @order_failed_title.
  ///
  /// In en, this message translates to:
  /// **'Your order has been canceled'**
  String get order_failed_title;

  /// No description provided for @order_success_status.
  ///
  /// In en, this message translates to:
  /// **'successfully'**
  String get order_success_status;

  /// No description provided for @order_failed_status.
  ///
  /// In en, this message translates to:
  /// **'failed'**
  String get order_failed_status;

  /// No description provided for @back_to_home.
  ///
  /// In en, this message translates to:
  /// **'Back to Home'**
  String get back_to_home;

  /// No description provided for @payment_page_title.
  ///
  /// In en, this message translates to:
  /// **'Payment Page'**
  String get payment_page_title;

  /// No description provided for @payment_loading.
  ///
  /// In en, this message translates to:
  /// **'Redirecting to payment...'**
  String get payment_loading;

  /// No description provided for @payment_error_title.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get payment_error_title;

  /// No description provided for @payment_error_message.
  ///
  /// In en, this message translates to:
  /// **' Payment error occurred: {error}'**
  String payment_error_message(Object error);

  /// No description provided for @payment_success_title.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get payment_success_title;

  /// No description provided for @payment_success_message.
  ///
  /// In en, this message translates to:
  /// **'✅ Payment completed successfully'**
  String get payment_success_message;

  /// No description provided for @payment_failed_title.
  ///
  /// In en, this message translates to:
  /// **'Failed'**
  String get payment_failed_title;

  /// No description provided for @payment_failed_message.
  ///
  /// In en, this message translates to:
  /// **'❌ Payment failed'**
  String get payment_failed_message;

  /// No description provided for @close_button_tooltip.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close_button_tooltip;

  /// No description provided for @payment_auth_error.
  ///
  /// In en, this message translates to:
  /// **'Failed to get authentication token.'**
  String get payment_auth_error;

  /// No description provided for @payment_order_error.
  ///
  /// In en, this message translates to:
  /// **'Failed to create payment order.'**
  String get payment_order_error;

  /// No description provided for @payment_key_error.
  ///
  /// In en, this message translates to:
  /// **'Failed to get payment key.'**
  String get payment_key_error;

  /// No description provided for @payment_general_error.
  ///
  /// In en, this message translates to:
  /// **'Error in PaymobManager: {error}'**
  String payment_general_error(Object error);

  /// No description provided for @payment_failed_to_get_key.
  ///
  /// In en, this message translates to:
  /// **'Failed to get payment key'**
  String get payment_failed_to_get_key;

  /// No description provided for @change_to_selling_mode.
  ///
  /// In en, this message translates to:
  /// **'Change Profile to selling mode'**
  String get change_to_selling_mode;

  /// No description provided for @logout_title.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout_title;

  /// No description provided for @logout_button.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout_button;

  /// No description provided for @cancel_button.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel_button;

  /// No description provided for @my_profile.
  ///
  /// In en, this message translates to:
  /// **'My Profile'**
  String get my_profile;

  /// No description provided for @add_new_card.
  ///
  /// In en, this message translates to:
  /// **'+ Add new card'**
  String get add_new_card;

  /// No description provided for @mahrama.
  ///
  /// In en, this message translates to:
  /// **'Mahrama'**
  String get mahrama;

  /// No description provided for @select_payment_method.
  ///
  /// In en, this message translates to:
  /// **'Select Payment method'**
  String get select_payment_method;

  /// No description provided for @easypaisa.
  ///
  /// In en, this message translates to:
  /// **'Easypaisa'**
  String get easypaisa;

  /// No description provided for @bank_account.
  ///
  /// In en, this message translates to:
  /// **'Bank account'**
  String get bank_account;

  /// No description provided for @jazz_cash.
  ///
  /// In en, this message translates to:
  /// **'Jazz cash'**
  String get jazz_cash;

  /// No description provided for @paypal.
  ///
  /// In en, this message translates to:
  /// **'PayPal'**
  String get paypal;

  /// No description provided for @payment_saved.
  ///
  /// In en, this message translates to:
  /// **' saved successfully!'**
  String get payment_saved;

  /// No description provided for @please_select_payment.
  ///
  /// In en, this message translates to:
  /// **'Please select a payment method'**
  String get please_select_payment;

  /// No description provided for @general_notification.
  ///
  /// In en, this message translates to:
  /// **'General notification'**
  String get general_notification;

  /// No description provided for @sound.
  ///
  /// In en, this message translates to:
  /// **'Sound'**
  String get sound;

  /// No description provided for @vibrate.
  ///
  /// In en, this message translates to:
  /// **'Vibrate'**
  String get vibrate;

  /// No description provided for @new_service.
  ///
  /// In en, this message translates to:
  /// **'New Service'**
  String get new_service;

  /// No description provided for @notification_saved.
  ///
  /// In en, this message translates to:
  /// **'Notification settings saved successfully!'**
  String get notification_saved;

  /// No description provided for @home_screen.
  ///
  /// In en, this message translates to:
  /// **'Home Screen'**
  String get home_screen;

  /// No description provided for @city_screen.
  ///
  /// In en, this message translates to:
  /// **'City Screen'**
  String get city_screen;

  /// No description provided for @order_screen.
  ///
  /// In en, this message translates to:
  /// **'Order Screen'**
  String get order_screen;

  /// No description provided for @live_chat.
  ///
  /// In en, this message translates to:
  /// **'Live chat'**
  String get live_chat;

  /// No description provided for @hello_assist.
  ///
  /// In en, this message translates to:
  /// **'Hello, how can we assist you?'**
  String get hello_assist;

  /// No description provided for @title.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get title;

  /// No description provided for @title_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter the title of your issue'**
  String get title_hint;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Write in bellow box'**
  String get description;

  /// No description provided for @description_hint.
  ///
  /// In en, this message translates to:
  /// **'Write here...'**
  String get description_hint;

  /// No description provided for @enter_title.
  ///
  /// In en, this message translates to:
  /// **'Please enter a title for your issue'**
  String get enter_title;

  /// No description provided for @enter_description.
  ///
  /// In en, this message translates to:
  /// **'Please describe your issue'**
  String get enter_description;

  /// No description provided for @ticket_submitted.
  ///
  /// In en, this message translates to:
  /// **'Your issue has been submitted successfully!'**
  String get ticket_submitted;

  /// No description provided for @dob.
  ///
  /// In en, this message translates to:
  /// **'Date of Birth'**
  String get dob;

  /// No description provided for @select_country.
  ///
  /// In en, this message translates to:
  /// **'Select Country'**
  String get select_country;

  /// No description provided for @select_country_code.
  ///
  /// In en, this message translates to:
  /// **'Select Country Code'**
  String get select_country_code;

  /// No description provided for @changes_saved.
  ///
  /// In en, this message translates to:
  /// **'Changes saved successfully'**
  String get changes_saved;

  /// No description provided for @card.
  ///
  /// In en, this message translates to:
  /// **'Card'**
  String get card;

  /// No description provided for @credit_card.
  ///
  /// In en, this message translates to:
  /// **'Credit card'**
  String get credit_card;

  /// No description provided for @card_number.
  ///
  /// In en, this message translates to:
  /// **'Card number'**
  String get card_number;

  /// No description provided for @card_number_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter 14 digit number'**
  String get card_number_hint;

  /// No description provided for @card_holder_name.
  ///
  /// In en, this message translates to:
  /// **'Card holder name'**
  String get card_holder_name;

  /// No description provided for @card_holder_name_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter name'**
  String get card_holder_name_hint;

  /// No description provided for @card_expiry_date.
  ///
  /// In en, this message translates to:
  /// **'Card expiry date'**
  String get card_expiry_date;

  /// No description provided for @card_expiry_date_hint.
  ///
  /// In en, this message translates to:
  /// **'DD/MM/YYYY'**
  String get card_expiry_date_hint;

  /// No description provided for @pick_image_example.
  ///
  /// In en, this message translates to:
  /// **'Pick Image Example'**
  String get pick_image_example;

  /// No description provided for @no_image_selected.
  ///
  /// In en, this message translates to:
  /// **'No image selected'**
  String get no_image_selected;

  /// No description provided for @pick_image.
  ///
  /// In en, this message translates to:
  /// **'Pick Image'**
  String get pick_image;

  /// No description provided for @camera.
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get camera;

  /// No description provided for @payment_success.
  ///
  /// In en, this message translates to:
  /// **'✅ Payment Successful'**
  String get payment_success;

  /// No description provided for @payment_failed.
  ///
  /// In en, this message translates to:
  /// **'❌ Payment Failed'**
  String get payment_failed;

  /// No description provided for @close_button.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close_button;

  /// No description provided for @dob_label.
  ///
  /// In en, this message translates to:
  /// **'Date of Birth'**
  String get dob_label;

  /// No description provided for @select_country_title.
  ///
  /// In en, this message translates to:
  /// **'Select Country'**
  String get select_country_title;

  /// No description provided for @select_country_code_title.
  ///
  /// In en, this message translates to:
  /// **'Select Country Code'**
  String get select_country_code_title;

  /// No description provided for @data_saved_success.
  ///
  /// In en, this message translates to:
  /// **'Changes saved successfully'**
  String get data_saved_success;

  /// No description provided for @data_saved_console.
  ///
  /// In en, this message translates to:
  /// **'Data saved'**
  String get data_saved_console;

  /// No description provided for @success_message.
  ///
  /// In en, this message translates to:
  /// **'Profile updated successfully'**
  String get success_message;

  /// No description provided for @choose_date_hint.
  ///
  /// In en, this message translates to:
  /// **'Choose your date of birth'**
  String get choose_date_hint;

  /// No description provided for @uk.
  ///
  /// In en, this message translates to:
  /// **'United Kingdom'**
  String get uk;

  /// No description provided for @germany.
  ///
  /// In en, this message translates to:
  /// **'Germany'**
  String get germany;

  /// No description provided for @france.
  ///
  /// In en, this message translates to:
  /// **'France'**
  String get france;

  /// No description provided for @italy.
  ///
  /// In en, this message translates to:
  /// **'Italy'**
  String get italy;

  /// No description provided for @spain.
  ///
  /// In en, this message translates to:
  /// **'Spain'**
  String get spain;

  /// No description provided for @japan.
  ///
  /// In en, this message translates to:
  /// **'Japan'**
  String get japan;

  /// No description provided for @brazil.
  ///
  /// In en, this message translates to:
  /// **'Brazil'**
  String get brazil;

  /// No description provided for @australia.
  ///
  /// In en, this message translates to:
  /// **'Australia'**
  String get australia;

  /// No description provided for @india.
  ///
  /// In en, this message translates to:
  /// **'India'**
  String get india;

  /// No description provided for @china.
  ///
  /// In en, this message translates to:
  /// **'China'**
  String get china;

  /// No description provided for @south_korea.
  ///
  /// In en, this message translates to:
  /// **'South Korea'**
  String get south_korea;
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
