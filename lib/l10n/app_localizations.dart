import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_tr.dart';

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
    Locale('en'),
    Locale('tr')
  ];

  /// Application name
  ///
  /// In en, this message translates to:
  /// **'Dressly'**
  String get appName;

  /// Generic loading text
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// Retry button
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// Generic error message
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get errorOccurred;

  /// Empty state message
  ///
  /// In en, this message translates to:
  /// **'Nothing here yet'**
  String get noContent;

  /// Cancel button
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// Save button
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// OK button
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// Confirm button
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// Remove/dismiss action
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get remove;

  /// Search bar hint
  ///
  /// In en, this message translates to:
  /// **'Search products...'**
  String get searchProducts;

  /// All categories chip label
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get allCategories;

  /// Product count in brand banner
  ///
  /// In en, this message translates to:
  /// **'{count} items'**
  String productCount(int count);

  /// Price with TL suffix
  ///
  /// In en, this message translates to:
  /// **'{price} TL'**
  String priceTl(String price);

  /// Bottom nav - Feed tab
  ///
  /// In en, this message translates to:
  /// **'Feed'**
  String get navFeed;

  /// Bottom nav - Brands tab
  ///
  /// In en, this message translates to:
  /// **'Brands'**
  String get navBrands;

  /// Bottom nav - Saved tab
  ///
  /// In en, this message translates to:
  /// **'Saved'**
  String get navSaved;

  /// Bottom nav - Profile tab
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get navProfile;

  /// Login page heading
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get loginTitle;

  /// Login page subtitle
  ///
  /// In en, this message translates to:
  /// **'Enter your details\nto access your account.'**
  String get loginSubtitle;

  /// Google login button
  ///
  /// In en, this message translates to:
  /// **'Sign in with Google'**
  String get loginWithGoogle;

  /// Apple login button
  ///
  /// In en, this message translates to:
  /// **'Sign in with Apple'**
  String get loginWithApple;

  /// Email login link
  ///
  /// In en, this message translates to:
  /// **'Sign in with email'**
  String get loginWithEmail;

  /// Email field label
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// Password field label
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// Email validation error
  ///
  /// In en, this message translates to:
  /// **'Email is required'**
  String get emailRequired;

  /// Password validation error
  ///
  /// In en, this message translates to:
  /// **'Password is required'**
  String get passwordRequired;

  /// Forgot password link
  ///
  /// In en, this message translates to:
  /// **'Forgot my password'**
  String get forgotPassword;

  /// No account prompt
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account? '**
  String get noAccount;

  /// Register page heading
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get registerTitle;

  /// Register page subtitle
  ///
  /// In en, this message translates to:
  /// **'Enter your details\nto join the fashion world.'**
  String get registerSubtitle;

  /// Full name field label
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullName;

  /// Name validation error
  ///
  /// In en, this message translates to:
  /// **'Name is required'**
  String get nameRequired;

  /// Password min length validation
  ///
  /// In en, this message translates to:
  /// **'At least 6 characters required'**
  String get passwordMinLength;

  /// Already have account prompt
  ///
  /// In en, this message translates to:
  /// **'Already have an account? '**
  String get alreadyHaveAccount;

  /// Register button
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get register;

  /// Brands page title
  ///
  /// In en, this message translates to:
  /// **'Brands'**
  String get brandsTitle;

  /// All products page title
  ///
  /// In en, this message translates to:
  /// **'All Products'**
  String get allProductsTitle;

  /// All brands banner label
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get allBrandsBanner;

  /// Try on button
  ///
  /// In en, this message translates to:
  /// **'Try On'**
  String get tryOn;

  /// Buy now / shopping bag button tooltip
  ///
  /// In en, this message translates to:
  /// **'Buy'**
  String get buyNow;

  /// Try-on page title
  ///
  /// In en, this message translates to:
  /// **'AI Try-On'**
  String get tryOnTitle;

  /// Reset button in try-on
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get tryOnReset;

  /// Try-on starting state
  ///
  /// In en, this message translates to:
  /// **'Starting AI try-on...'**
  String get tryOnStarting;

  /// Try-on processing state
  ///
  /// In en, this message translates to:
  /// **'Processing outfit with AI...'**
  String get tryOnProcessing;

  /// Try-on queued state
  ///
  /// In en, this message translates to:
  /// **'Queued, waiting...'**
  String get tryOnQueued;

  /// Try-on save success snackbar
  ///
  /// In en, this message translates to:
  /// **'Saved to your gallery!'**
  String get tryOnSaved;

  /// Try-on photo instruction title
  ///
  /// In en, this message translates to:
  /// **'Add your photo'**
  String get tryOnAddPhoto;

  /// Try-on photo instruction subtitle
  ///
  /// In en, this message translates to:
  /// **'Take a photo or choose from gallery'**
  String get tryOnAddPhotoSubtitle;

  /// Product label in try-on
  ///
  /// In en, this message translates to:
  /// **'Product'**
  String get tryOnProduct;

  /// Your photo label in try-on
  ///
  /// In en, this message translates to:
  /// **'Your Photo'**
  String get tryOnYourPhoto;

  /// Result label in try-on
  ///
  /// In en, this message translates to:
  /// **'Result'**
  String get tryOnResult;

  /// Try button in try-on
  ///
  /// In en, this message translates to:
  /// **'Try!'**
  String get tryOnTryButton;

  /// Camera option
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get camera;

  /// Gallery option
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get gallery;

  /// Saved page title
  ///
  /// In en, this message translates to:
  /// **'Wishlist'**
  String get savedTitle;

  /// Profile page title
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileTitle;

  /// Profile load error message
  ///
  /// In en, this message translates to:
  /// **'Failed to load profile'**
  String get profileLoadError;

  /// Default user name placeholder
  ///
  /// In en, this message translates to:
  /// **'User'**
  String get profileDefaultName;

  /// Subscription menu item
  ///
  /// In en, this message translates to:
  /// **'Subscription'**
  String get subscription;

  /// Subscription menu subtitle
  ///
  /// In en, this message translates to:
  /// **'Manage your plan'**
  String get manageSubscription;

  /// Measurements menu item
  ///
  /// In en, this message translates to:
  /// **'My Measurements'**
  String get measurements;

  /// Measurements menu subtitle
  ///
  /// In en, this message translates to:
  /// **'Height, weight, size'**
  String get measurementsSubtitle;

  /// Measurements bottom sheet title
  ///
  /// In en, this message translates to:
  /// **'My Measurements'**
  String get measurementsTitle;

  /// Measurements bottom sheet subtitle
  ///
  /// In en, this message translates to:
  /// **'Enter your measurements for better results.'**
  String get measurementsDescription;

  /// Height field label
  ///
  /// In en, this message translates to:
  /// **'Height'**
  String get height;

  /// Weight field label
  ///
  /// In en, this message translates to:
  /// **'Weight'**
  String get weight;

  /// Chest field label
  ///
  /// In en, this message translates to:
  /// **'Chest'**
  String get chest;

  /// Waist field label
  ///
  /// In en, this message translates to:
  /// **'Waist'**
  String get waist;

  /// Hips field label
  ///
  /// In en, this message translates to:
  /// **'Hips'**
  String get hips;

  /// Size field label
  ///
  /// In en, this message translates to:
  /// **'Size'**
  String get size;

  /// Notifications menu item
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// Theme menu item and sheet title
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// Light theme option
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get themeLight;

  /// Dark theme option
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get themeDark;

  /// System theme option
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get themeSystem;

  /// Logout menu item
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get logout;
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
      <String>['en', 'tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'tr':
      return AppLocalizationsTr();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
