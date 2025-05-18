import 'package:landmark_assignment/features/auth/viewmodels/auth_view_model.dart';
import 'package:landmark_assignment/features/auth/views/login_page.dart';
import 'package:landmark_assignment/features/auth/views/register_page.dart';
import 'package:landmark_assignment/features/home/views/home.dart';
import 'package:landmark_assignment/features/home/views/screens/home_screen.dart';
import 'package:landmark_assignment/features/onbording/views/onboarding_screen.dart';
import 'package:landmark_assignment/main.dart';

class Routes{
  static const onBoardScreen = OnBoardingScreen();
  static const loginScreen = LoginPage();
  static var homeScreen = Home();
  static var registerScreen = RegisterPage(authViewModel: AuthViewModel(),);
}