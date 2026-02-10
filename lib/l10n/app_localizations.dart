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

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
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
    Locale('en')
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Our App'**
  String get appName;

  /// No description provided for @videos.
  ///
  /// In en, this message translates to:
  /// **'Videos'**
  String get videos;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @iDoNotHaveAnAccount.
  ///
  /// In en, this message translates to:
  /// **'I do not have an account'**
  String get iDoNotHaveAnAccount;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'welcome'**
  String get welcome;

  /// No description provided for @location_name.
  ///
  /// In en, this message translates to:
  /// **'{name}'**
  String location_name(Object name);

  /// No description provided for @categories.
  ///
  /// In en, this message translates to:
  /// **'categories'**
  String get categories;

  /// No description provided for @lastOrdered.
  ///
  /// In en, this message translates to:
  /// **'last ordered'**
  String get lastOrdered;

  /// No description provided for @favorite.
  ///
  /// In en, this message translates to:
  /// **'favorite'**
  String get favorite;

  /// No description provided for @main.
  ///
  /// In en, this message translates to:
  /// **'main'**
  String get main;

  /// No description provided for @orders.
  ///
  /// In en, this message translates to:
  /// **'orders'**
  String get orders;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'profile'**
  String get profile;

  /// No description provided for @showAll.
  ///
  /// In en, this message translates to:
  /// **'show all'**
  String get showAll;

  /// No description provided for @editProfile.
  ///
  /// In en, this message translates to:
  /// **'edit profile'**
  String get editProfile;

  /// No description provided for @tier_type.
  ///
  /// In en, this message translates to:
  /// **' {type} tier'**
  String tier_type(Object type);

  /// No description provided for @points.
  ///
  /// In en, this message translates to:
  /// **'points'**
  String get points;

  /// No description provided for @golden.
  ///
  /// In en, this message translates to:
  /// **'golden'**
  String get golden;

  /// No description provided for @silver.
  ///
  /// In en, this message translates to:
  /// **'silver'**
  String get silver;

  /// No description provided for @bronze.
  ///
  /// In en, this message translates to:
  /// **'bronze'**
  String get bronze;

  /// No description provided for @tier.
  ///
  /// In en, this message translates to:
  /// **'tier'**
  String get tier;

  /// No description provided for @help.
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get help;

  /// No description provided for @customize.
  ///
  /// In en, this message translates to:
  /// **'customize'**
  String get customize;

  /// No description provided for @logOut.
  ///
  /// In en, this message translates to:
  /// **'logOut'**
  String get logOut;

  /// No description provided for @scan.
  ///
  /// In en, this message translates to:
  /// **'scan'**
  String get scan;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'notifications'**
  String get notifications;

  /// No description provided for @ago.
  ///
  /// In en, this message translates to:
  /// **'agp'**
  String get ago;

  /// No description provided for @seconds.
  ///
  /// In en, this message translates to:
  /// **'seconds'**
  String get seconds;

  /// No description provided for @minutes.
  ///
  /// In en, this message translates to:
  /// **'mins'**
  String get minutes;

  /// No description provided for @hours.
  ///
  /// In en, this message translates to:
  /// **'hours'**
  String get hours;

  /// No description provided for @days.
  ///
  /// In en, this message translates to:
  /// **'days'**
  String get days;

  /// No description provided for @months.
  ///
  /// In en, this message translates to:
  /// **'months'**
  String get months;

  /// No description provided for @years.
  ///
  /// In en, this message translates to:
  /// **'years'**
  String get years;

  /// No description provided for @notification_duration.
  ///
  /// In en, this message translates to:
  /// **'{number} {unit} ago'**
  String notification_duration(Object number, Object unit);

  /// No description provided for @tap_bar_item_title.
  ///
  /// In en, this message translates to:
  /// **'{title}'**
  String tap_bar_item_title(Object title);

  /// No description provided for @orderDetails.
  ///
  /// In en, this message translates to:
  /// **'order details'**
  String get orderDetails;

  /// No description provided for @order_number.
  ///
  /// In en, this message translates to:
  /// **'order : {number}'**
  String order_number(Object number);

  /// No description provided for @order_time.
  ///
  /// In en, this message translates to:
  /// **'time : {time}'**
  String order_time(Object time);

  /// No description provided for @order_date.
  ///
  /// In en, this message translates to:
  /// **'date : {date}'**
  String order_date(Object date);

  /// No description provided for @table_number.
  ///
  /// In en, this message translates to:
  /// **'table : {number}'**
  String table_number(Object number);

  /// No description provided for @order_table.
  ///
  /// In en, this message translates to:
  /// **'table : {number}'**
  String order_table(Object number);

  /// No description provided for @cash.
  ///
  /// In en, this message translates to:
  /// **'cash'**
  String get cash;

  /// No description provided for @payment_method.
  ///
  /// In en, this message translates to:
  /// **'payment method :  {method}'**
  String payment_method(Object method);

  /// No description provided for @showMore.
  ///
  /// In en, this message translates to:
  /// **'show more.....'**
  String get showMore;

  /// No description provided for @showLess.
  ///
  /// In en, this message translates to:
  /// **'.....show less'**
  String get showLess;

  /// No description provided for @total_price.
  ///
  /// In en, this message translates to:
  /// **'total price :  {price}\$'**
  String total_price(Object price);

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'all'**
  String get all;

  /// No description provided for @coldDrinks.
  ///
  /// In en, this message translates to:
  /// **'cold drinks'**
  String get coldDrinks;

  /// No description provided for @hotDrinks.
  ///
  /// In en, this message translates to:
  /// **'hot drinks'**
  String get hotDrinks;

  /// No description provided for @desserts.
  ///
  /// In en, this message translates to:
  /// **'Desserts'**
  String get desserts;

  /// No description provided for @juices.
  ///
  /// In en, this message translates to:
  /// **'Juices'**
  String get juices;

  /// No description provided for @food.
  ///
  /// In en, this message translates to:
  /// **'food'**
  String get food;

  /// No description provided for @filterBy.
  ///
  /// In en, this message translates to:
  /// **'filter by :'**
  String get filterBy;

  /// No description provided for @lastDay.
  ///
  /// In en, this message translates to:
  /// **'last day'**
  String get lastDay;

  /// No description provided for @lastWeek.
  ///
  /// In en, this message translates to:
  /// **'last week'**
  String get lastWeek;

  /// No description provided for @lastMonth.
  ///
  /// In en, this message translates to:
  /// **'last month'**
  String get lastMonth;

  /// No description provided for @lastYear.
  ///
  /// In en, this message translates to:
  /// **'last year'**
  String get lastYear;

  /// No description provided for @thereAreNoOrdersYet.
  ///
  /// In en, this message translates to:
  /// **'There are no orders yet'**
  String get thereAreNoOrdersYet;

  /// No description provided for @emailOrPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'email or phone number'**
  String get emailOrPhoneNumber;

  /// No description provided for @uDontHaveAnAccount.
  ///
  /// In en, this message translates to:
  /// **'you don\'t have an account?'**
  String get uDontHaveAnAccount;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'password'**
  String get password;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'email'**
  String get email;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'forgot password ?'**
  String get forgotPassword;

  /// No description provided for @createAnAccount.
  ///
  /// In en, this message translates to:
  /// **'create an account'**
  String get createAnAccount;

  /// No description provided for @contactUs.
  ///
  /// In en, this message translates to:
  /// **'Contact us'**
  String get contactUs;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'cancel'**
  String get cancel;

  /// No description provided for @sure.
  ///
  /// In en, this message translates to:
  /// **'sure'**
  String get sure;

  /// No description provided for @alreadyHaveAnAccount.
  ///
  /// In en, this message translates to:
  /// **'ِِAlready have an account ?'**
  String get alreadyHaveAnAccount;

  /// No description provided for @logIn.
  ///
  /// In en, this message translates to:
  /// **'log in '**
  String get logIn;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'phone number'**
  String get phoneNumber;

  /// No description provided for @verifyPassword.
  ///
  /// In en, this message translates to:
  /// **'verify password'**
  String get verifyPassword;

  /// No description provided for @userName.
  ///
  /// In en, this message translates to:
  /// **'userName'**
  String get userName;

  /// No description provided for @gender.
  ///
  /// In en, this message translates to:
  /// **'gender'**
  String get gender;

  /// No description provided for @birthDate.
  ///
  /// In en, this message translates to:
  /// **'birthDate'**
  String get birthDate;

  /// No description provided for @applyChanges.
  ///
  /// In en, this message translates to:
  /// **'apply changes'**
  String get applyChanges;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'edit'**
  String get edit;

  /// No description provided for @neww.
  ///
  /// In en, this message translates to:
  /// **'new'**
  String get neww;

  /// No description provided for @thereAreNoFavoriteProducts.
  ///
  /// In en, this message translates to:
  /// **'the are no favorite products'**
  String get thereAreNoFavoriteProducts;

  /// No description provided for @order.
  ///
  /// In en, this message translates to:
  /// **'order'**
  String get order;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'language'**
  String get language;

  /// No description provided for @agreeFor.
  ///
  /// In en, this message translates to:
  /// **'agree for'**
  String get agreeFor;

  /// No description provided for @privacy.
  ///
  /// In en, this message translates to:
  /// **'Privacy'**
  String get privacy;

  /// No description provided for @policy.
  ///
  /// In en, this message translates to:
  /// **'Policy'**
  String get policy;

  /// No description provided for @and.
  ///
  /// In en, this message translates to:
  /// **'and'**
  String get and;

  /// No description provided for @visa.
  ///
  /// In en, this message translates to:
  /// **'visa'**
  String get visa;

  /// No description provided for @bank.
  ///
  /// In en, this message translates to:
  /// **'bank'**
  String get bank;

  /// No description provided for @congratulations.
  ///
  /// In en, this message translates to:
  /// **'congratulations'**
  String get congratulations;

  /// No description provided for @dispose.
  ///
  /// In en, this message translates to:
  /// **'dispose'**
  String get dispose;

  /// No description provided for @inValid.
  ///
  /// In en, this message translates to:
  /// **'inValid'**
  String get inValid;

  /// No description provided for @congratulations_you_have_gained_points.
  ///
  /// In en, this message translates to:
  /// **'Congratulations you have gained {points}'**
  String congratulations_you_have_gained_points(Object points);

  /// No description provided for @areYouSureYouWantToLogOut.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to log out ?'**
  String get areYouSureYouWantToLogOut;

  /// No description provided for @thanks.
  ///
  /// In en, this message translates to:
  /// **'thanks'**
  String get thanks;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'ok'**
  String get ok;

  /// No description provided for @points_have_been_disposed.
  ///
  /// In en, this message translates to:
  /// **'{points} points have been disposed'**
  String points_have_been_disposed(Object points);

  /// No description provided for @thisCodeIsInvValidPleaseTryAgain.
  ///
  /// In en, this message translates to:
  /// **'This code is inValid , please try again'**
  String get thisCodeIsInvValidPleaseTryAgain;

  /// No description provided for @unexpectedErrorOccurred.
  ///
  /// In en, this message translates to:
  /// **'Unexpected error occurred'**
  String get unexpectedErrorOccurred;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'error'**
  String get error;

  /// No description provided for @privacyAndPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy and Policy'**
  String get privacyAndPolicy;

  /// No description provided for @brick.
  ///
  /// In en, this message translates to:
  /// **'Brick'**
  String get brick;

  /// No description provided for @resetPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get resetPassword;

  /// No description provided for @enterYourPhoneNumberConnectedToYourAccount.
  ///
  /// In en, this message translates to:
  /// **'enter your phone number connected to your account'**
  String get enterYourPhoneNumberConnectedToYourAccount;

  /// No description provided for @ifThisAccountHasANumberYouWillReceiveACodeOnIt.
  ///
  /// In en, this message translates to:
  /// **'if this account has a number you will receive a code on it , enter it here'**
  String get ifThisAccountHasANumberYouWillReceiveACodeOnIt;

  /// No description provided for @enterPassword.
  ///
  /// In en, this message translates to:
  /// **'enter password'**
  String get enterPassword;

  /// No description provided for @enterPasswordAgain.
  ///
  /// In en, this message translates to:
  /// **'enter password again'**
  String get enterPasswordAgain;

  /// No description provided for @continuee.
  ///
  /// In en, this message translates to:
  /// **'continue'**
  String get continuee;

  /// No description provided for @welcomeEnterYourNumberToContinue.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Bistro . if you already have an account enter your number to continue .'**
  String get welcomeEnterYourNumberToContinue;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'full name'**
  String get fullName;

  /// No description provided for @games.
  ///
  /// In en, this message translates to:
  /// **'games'**
  String get games;

  /// No description provided for @socialMedia.
  ///
  /// In en, this message translates to:
  /// **'social media'**
  String get socialMedia;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'الانكليزية'**
  String get english;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'arabic'**
  String get arabic;

  /// No description provided for @getThePassword.
  ///
  /// In en, this message translates to:
  /// **'get the password'**
  String get getThePassword;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'next'**
  String get next;

  /// No description provided for @firstName.
  ///
  /// In en, this message translates to:
  /// **'first Name'**
  String get firstName;

  /// No description provided for @familyName.
  ///
  /// In en, this message translates to:
  /// **'family Name'**
  String get familyName;

  /// No description provided for @whatIsYourName.
  ///
  /// In en, this message translates to:
  /// **'What\'s your name ?'**
  String get whatIsYourName;

  /// No description provided for @enterTheNameYouUseInRealLife.
  ///
  /// In en, this message translates to:
  /// **'Enter tha name you use in real life.'**
  String get enterTheNameYouUseInRealLife;

  /// No description provided for @whatIsYourBirthday.
  ///
  /// In en, this message translates to:
  /// **'What\'s your birthday ?'**
  String get whatIsYourBirthday;

  /// No description provided for @chooseYourDateOfBirthYouCanScrollDownAndUpToAdjustThat.
  ///
  /// In en, this message translates to:
  /// **'Choose your date of birth. You can scroll down and up to adjust that.'**
  String get chooseYourDateOfBirthYouCanScrollDownAndUpToAdjustThat;

  /// No description provided for @month_january.
  ///
  /// In en, this message translates to:
  /// **'Jan'**
  String get month_january;

  /// No description provided for @month_february.
  ///
  /// In en, this message translates to:
  /// **'Feb'**
  String get month_february;

  /// No description provided for @month_march.
  ///
  /// In en, this message translates to:
  /// **'Mar'**
  String get month_march;

  /// No description provided for @month_april.
  ///
  /// In en, this message translates to:
  /// **'Apr'**
  String get month_april;

  /// No description provided for @month_may.
  ///
  /// In en, this message translates to:
  /// **'May'**
  String get month_may;

  /// No description provided for @month_june.
  ///
  /// In en, this message translates to:
  /// **'Jun'**
  String get month_june;

  /// No description provided for @month_july.
  ///
  /// In en, this message translates to:
  /// **'Jul'**
  String get month_july;

  /// No description provided for @month_august.
  ///
  /// In en, this message translates to:
  /// **'Aug'**
  String get month_august;

  /// No description provided for @month_september.
  ///
  /// In en, this message translates to:
  /// **'Sep'**
  String get month_september;

  /// No description provided for @month_october.
  ///
  /// In en, this message translates to:
  /// **'Oct'**
  String get month_october;

  /// No description provided for @month_november.
  ///
  /// In en, this message translates to:
  /// **'Nov'**
  String get month_november;

  /// No description provided for @month_december.
  ///
  /// In en, this message translates to:
  /// **'Dec'**
  String get month_december;

  /// No description provided for @male.
  ///
  /// In en, this message translates to:
  /// **'male'**
  String get male;

  /// No description provided for @female.
  ///
  /// In en, this message translates to:
  /// **'female'**
  String get female;

  /// No description provided for @whatIsYourGender.
  ///
  /// In en, this message translates to:
  /// **'What\'s your gender ?'**
  String get whatIsYourGender;

  /// No description provided for @whatIsYourLanguage.
  ///
  /// In en, this message translates to:
  /// **'What\'s your language ?'**
  String get whatIsYourLanguage;

  /// No description provided for @noteLanguageAndOtherDataCanBeChangedLater.
  ///
  /// In en, this message translates to:
  /// **'note : language and other data can be changed later.'**
  String get noteLanguageAndOtherDataCanBeChangedLater;

  /// No description provided for @chooseYourGenderByClickingOn.
  ///
  /// In en, this message translates to:
  /// **'Choose your gender by clicking on.'**
  String get chooseYourGenderByClickingOn;

  /// No description provided for @chooseYourLanguageByClickingOn.
  ///
  /// In en, this message translates to:
  /// **'Choose your language by clicking on.'**
  String get chooseYourLanguageByClickingOn;

  /// No description provided for @whatIsYourPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'What\'s your phone number?'**
  String get whatIsYourPhoneNumber;

  /// No description provided for @rememberYourPhone.
  ///
  /// In en, this message translates to:
  /// **'Remember you phone number because you will need it later to log in to your account. And choose your country code by clicking on the flag.'**
  String get rememberYourPhone;

  /// No description provided for @thanks_name_for_your_time.
  ///
  /// In en, this message translates to:
  /// **'Thanks {name} for your time.'**
  String thanks_name_for_your_time(Object name);

  /// No description provided for @allDataBeenCollectedWillBePrivate.
  ///
  /// In en, this message translates to:
  /// **'All collected data will be used solely for advertising purposes and customer communication through Bistro. Your information will remain private and secure and will not be shared with any third party. By clicking the button below, you agree to this usage.'**
  String get allDataBeenCollectedWillBePrivate;

  /// No description provided for @acceptPrivacyAndPolicy.
  ///
  /// In en, this message translates to:
  /// **'Accept privacy and policy'**
  String get acceptPrivacyAndPolicy;

  /// No description provided for @accept.
  ///
  /// In en, this message translates to:
  /// **'accept'**
  String get accept;

  /// No description provided for @create.
  ///
  /// In en, this message translates to:
  /// **'create'**
  String get create;

  /// No description provided for @pleaseEnterLongerFirstName.
  ///
  /// In en, this message translates to:
  /// **'please enter longer first name'**
  String get pleaseEnterLongerFirstName;

  /// No description provided for @pleaseEnterLongerLastName.
  ///
  /// In en, this message translates to:
  /// **'please enter longer last name'**
  String get pleaseEnterLongerLastName;

  /// No description provided for @pleaseEnterAPhoneNumberThatMatchYourSelectedCountry.
  ///
  /// In en, this message translates to:
  /// **'please enter a phone number that match your selected country'**
  String get pleaseEnterAPhoneNumberThatMatchYourSelectedCountry;

  /// No description provided for @pleaseRepeatYourPhoneNumberToVerify.
  ///
  /// In en, this message translates to:
  /// **'please repeat your phone number to verify '**
  String get pleaseRepeatYourPhoneNumberToVerify;

  /// No description provided for @pleaseOnlyUseOneLanguage.
  ///
  /// In en, this message translates to:
  /// **'please only use one language'**
  String get pleaseOnlyUseOneLanguage;

  /// No description provided for @pleaseOnlyUseOneLanguageForFields.
  ///
  /// In en, this message translates to:
  /// **'please only use one language for fields'**
  String get pleaseOnlyUseOneLanguageForFields;

  /// No description provided for @lastName.
  ///
  /// In en, this message translates to:
  /// **'last name'**
  String get lastName;

  /// No description provided for @pleaseFillINThisField.
  ///
  /// In en, this message translates to:
  /// **'please fill in this field'**
  String get pleaseFillINThisField;

  /// No description provided for @checkYourNumber.
  ///
  /// In en, this message translates to:
  /// **'check your number'**
  String get checkYourNumber;

  /// No description provided for @noMatchingPhoneNumbers.
  ///
  /// In en, this message translates to:
  /// **'no matching phone number'**
  String get noMatchingPhoneNumbers;

  /// No description provided for @pleaseSelectYourGender.
  ///
  /// In en, this message translates to:
  /// **'please select your gender'**
  String get pleaseSelectYourGender;

  /// No description provided for @pleaseCheckYourSelectedBirthday.
  ///
  /// In en, this message translates to:
  /// **'please check your selected birthday'**
  String get pleaseCheckYourSelectedBirthday;

  /// No description provided for @verifyPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'verify phone number'**
  String get verifyPhoneNumber;

  /// No description provided for @loginErrorServerSide.
  ///
  /// In en, this message translates to:
  /// **'Could not connect to the server. Please make sure you are connected to Bistro network.'**
  String get loginErrorServerSide;

  /// No description provided for @loginErrorUserSide.
  ///
  /// In en, this message translates to:
  /// **'Login failed. make sure of phone number '**
  String get loginErrorUserSide;

  /// No description provided for @available.
  ///
  /// In en, this message translates to:
  /// **'Available'**
  String get available;

  /// No description provided for @notAvailable.
  ///
  /// In en, this message translates to:
  /// **'Not Available'**
  String get notAvailable;

  /// No description provided for @ingredients.
  ///
  /// In en, this message translates to:
  /// **'Ingredients'**
  String get ingredients;

  /// No description provided for @lengthOfGame.
  ///
  /// In en, this message translates to:
  /// **'Length of game'**
  String get lengthOfGame;

  /// No description provided for @numberOfPlayers.
  ///
  /// In en, this message translates to:
  /// **'Number of players'**
  String get numberOfPlayers;

  /// No description provided for @clickForDetails.
  ///
  /// In en, this message translates to:
  /// **'Click for details'**
  String get clickForDetails;

  /// No description provided for @registerServerSideError.
  ///
  /// In en, this message translates to:
  /// **'Could not connect to the server. Please make sure you are connected to the Bistro network.'**
  String get registerServerSideError;

  /// No description provided for @registerUserSideError.
  ///
  /// In en, this message translates to:
  /// **'this number is already reserved'**
  String get registerUserSideError;

  /// No description provided for @editYourName.
  ///
  /// In en, this message translates to:
  /// **'edit your name'**
  String get editYourName;

  /// No description provided for @editYourPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'edit your phone number'**
  String get editYourPhoneNumber;

  /// No description provided for @editYourGender.
  ///
  /// In en, this message translates to:
  /// **'edit your gender'**
  String get editYourGender;

  /// No description provided for @editYourBirthday.
  ///
  /// In en, this message translates to:
  /// **'edit your birthday'**
  String get editYourBirthday;

  /// No description provided for @syp.
  ///
  /// In en, this message translates to:
  /// **'SYP'**
  String get syp;

  /// No description provided for @expiredDate.
  ///
  /// In en, this message translates to:
  /// **'valid until'**
  String get expiredDate;
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
      'that was used.');
}
