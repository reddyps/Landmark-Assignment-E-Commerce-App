import 'package:get/get.dart';
import 'package:landmark_assignment/features/auth/models/user_model.dart';
import 'package:landmark_assignment/features/home/views/bloc/home_screen/homescreen_bloc.dart';

class GlobalVariables{
  static int userID=123456;
  static HomeScreenBloc? homeScreenBloc;
  static RxInt homeScreenTab = 0.obs;
  static late UserModel userData;
}