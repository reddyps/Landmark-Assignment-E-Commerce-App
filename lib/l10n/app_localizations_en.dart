// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get login => 'Login';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get register => 'Register';

  @override
  String get signInWithGoogle => 'Sign in with Google';

  @override
  String get alAccount => 'Already have an account? Login';

  @override
  String get pleaseEnterEmail => 'Please enter valid Email';

  @override
  String get pleaseEnterPassword =>
      'Please enter valid password (one uppercase,one special char,minimum length 8).';

  @override
  String get invalidEmail => 'Invalid email address';

  @override
  String get invalidPassword => 'Password must be at least 6 characters long';

  @override
  String get pleaseWait => 'Please wait...!';

  @override
  String get registerSuccess =>
      'Account registered successfully. Please login.';

  @override
  String get loginSuccess => 'User login successfully.';

  @override
  String get skip => 'Skip';

  @override
  String get welcome => 'Welcome back!';

  @override
  String get loginWithData =>
      ' Log in with your data that you entered during your registration';

  @override
  String get forgotPassword => 'Forgot password';

  @override
  String get dontHaveAcc => 'Don\'t have an account?';

  @override
  String get haveAccount => 'Do you have an account?';

  @override
  String get logIn => 'Log in';

  @override
  String get privacyPolicy => '& privacy policy.';

  @override
  String get terms => ' Terms of service ';

  @override
  String get iAgree => 'I agree with the';

  @override
  String get selectCheckbox => 'Please the accept the terms and conditions.';

  @override
  String get categories => 'Categories';

  @override
  String get brand => 'XYZ';

  @override
  String get product_details => 'Product Details';

  @override
  String get shipping_information => 'Shipping Information';

  @override
  String get confirmPassword => 'Confirm Password';

  @override
  String get passwordNotMatch =>
      'Entered password and confirm password mismatch';

  @override
  String get userLogOut => 'User Logout Successfully.';
}
