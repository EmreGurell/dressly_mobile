// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Dressly';

  @override
  String get loading => 'Loading...';

  @override
  String get retry => 'Retry';

  @override
  String get errorOccurred => 'Something went wrong';

  @override
  String get noContent => 'Nothing here yet';

  @override
  String get cancel => 'Cancel';

  @override
  String get save => 'Save';

  @override
  String get ok => 'OK';

  @override
  String get confirm => 'Confirm';

  @override
  String get remove => 'Remove';

  @override
  String get searchProducts => 'Search products...';

  @override
  String get allCategories => 'All';

  @override
  String productCount(int count) {
    return '$count items';
  }

  @override
  String priceTl(String price) {
    return '$price TL';
  }

  @override
  String get navFeed => 'Feed';

  @override
  String get navBrands => 'Brands';

  @override
  String get navSaved => 'Saved';

  @override
  String get navProfile => 'Profile';

  @override
  String get loginTitle => 'Sign In';

  @override
  String get loginSubtitle => 'Enter your details\nto access your account.';

  @override
  String get loginWithGoogle => 'Sign in with Google';

  @override
  String get loginWithApple => 'Sign in with Apple';

  @override
  String get loginWithEmail => 'Sign in with email';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get emailRequired => 'Email is required';

  @override
  String get passwordRequired => 'Password is required';

  @override
  String get forgotPassword => 'Forgot my password';

  @override
  String get noAccount => 'Don\'t have an account? ';

  @override
  String get registerTitle => 'Create Account';

  @override
  String get registerSubtitle =>
      'Enter your details\nto join the fashion world.';

  @override
  String get fullName => 'Full Name';

  @override
  String get nameRequired => 'Name is required';

  @override
  String get passwordMinLength => 'At least 6 characters required';

  @override
  String get alreadyHaveAccount => 'Already have an account? ';

  @override
  String get register => 'Sign Up';

  @override
  String get brandsTitle => 'Brands';

  @override
  String get allProductsTitle => 'All Products';

  @override
  String get allBrandsBanner => 'All';

  @override
  String get tryOn => 'Try On';

  @override
  String get buyNow => 'Buy';

  @override
  String get tryOnTitle => 'AI Try-On';

  @override
  String get tryOnReset => 'Reset';

  @override
  String get tryOnStarting => 'Starting AI try-on...';

  @override
  String get tryOnProcessing => 'Processing outfit with AI...';

  @override
  String get tryOnQueued => 'Queued, waiting...';

  @override
  String get tryOnSaved => 'Saved to your gallery!';

  @override
  String get tryOnAddPhoto => 'Add your photo';

  @override
  String get tryOnAddPhotoSubtitle => 'Take a photo or choose from gallery';

  @override
  String get tryOnProduct => 'Product';

  @override
  String get tryOnYourPhoto => 'Your Photo';

  @override
  String get tryOnResult => 'Result';

  @override
  String get tryOnTryButton => 'Try!';

  @override
  String get camera => 'Camera';

  @override
  String get gallery => 'Gallery';

  @override
  String get savedTitle => 'Wishlist';

  @override
  String get profileTitle => 'Profile';

  @override
  String get profileLoadError => 'Failed to load profile';

  @override
  String get profileDefaultName => 'User';

  @override
  String get subscription => 'Subscription';

  @override
  String get manageSubscription => 'Manage your plan';

  @override
  String get measurements => 'My Measurements';

  @override
  String get measurementsSubtitle => 'Height, weight, size';

  @override
  String get measurementsTitle => 'My Measurements';

  @override
  String get measurementsDescription =>
      'Enter your measurements for better results.';

  @override
  String get height => 'Height';

  @override
  String get weight => 'Weight';

  @override
  String get chest => 'Chest';

  @override
  String get waist => 'Waist';

  @override
  String get hips => 'Hips';

  @override
  String get size => 'Size';

  @override
  String get notifications => 'Notifications';

  @override
  String get theme => 'Theme';

  @override
  String get themeLight => 'Light';

  @override
  String get themeDark => 'Dark';

  @override
  String get themeSystem => 'System';

  @override
  String get logout => 'Log Out';
}
