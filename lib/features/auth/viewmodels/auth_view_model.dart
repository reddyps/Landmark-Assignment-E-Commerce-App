import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:injectable/injectable.dart';
import 'package:landmark_assignment/core/base/base_viewmodel.dart';
import 'package:landmark_assignment/core/firebase/firebase_auth_type.dart';
import 'package:landmark_assignment/core/firebase/firebase_call.dart';
import 'package:landmark_assignment/core/navigation/routes.dart';
import 'package:landmark_assignment/core/util/extension/method_extension.dart';
import 'package:landmark_assignment/core/util/logger/logger_helper.dart';
import 'package:landmark_assignment/core/util/value/constants.dart';
import 'package:landmark_assignment/core/util/value/global_variables.dart';
import 'package:landmark_assignment/features/auth/models/user_model.dart';
import 'package:landmark_assignment/features/auth/views/screens/register_page.dart';

@singleton
class AuthViewModel extends BaseViewModel {
  final className = "AuthViewModel";

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final registerEmailController = TextEditingController();
  final registerPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final loginFormKey = GlobalKey<FormState>();
  final registerFormKey = GlobalKey<FormState>();

  final RxBool termsConditions = false.obs;

  UserModel? _user;
  UserModel? get user => _user;

  /// Email Validator
  String? emailValidator(value) {
    if (value == null || !value.toString().isValidEmail()) {
      return context.locale.pleaseEnterEmail;
    }
    return null;
  }

  /// Password Validator
  String? passwordValidator(value) {
    if (value == null || !value.toString().isValidPassword()) {
      return context.locale.pleaseEnterPassword;
    }
    return null;
  }

  /// Confirm Password Validator
  String? confirmPasswordValidator(value) {
    if (value == null || value != registerPasswordController.text) {
      return context.locale.passwordNotMatch;
    }
    return null;
  }

  /// Forgot password or login trigger
  onPressForgot() async {
    // if (loginFormKey.currentState!.validate()) {
    //   await loginWithEmailAndPassword();
    // }
  }

  onPressLogin() async {
    if (loginFormKey.currentState!.validate()) {
      await loginWithEmailAndPassword();
    }
  }

  onPressRegister() async {
    push(RegisterPage(authViewModel: this));
  }

  onPressRegisterSubmit() async {
    if (registerFormKey.currentState!.validate() && termsConditions.value) {
      await registerWithEmailAndPassword();
    } else if (!termsConditions.value) {
      showSnackBar(message: context.locale.selectCheckbox);
    }
  }

  onPressSignInWithGoogle() async {
    await signInWithGoogle();
  }

  void checkBoxOnChanged(bool? value) {
    if (value != null) {
      termsConditions.value = value;
      notifyListeners();
    }
  }

  void checkBoxOnTap() {
    termsConditions.value = !termsConditions.value;
    notifyListeners();
  }

  /// Login
  Future<void> loginWithEmailAndPassword() async {
    showCircularIndicator(message: context.locale.pleaseWait);
    await fireBaseAuthCall(
      firebaseAuthType: FirebaseAuthType.login,
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
      failed: (int statusCode, String errorDesc) {
        dismissDialogIndicator();
        showDialogAuto(method: () => pop(), message: errorDesc);
      },
      success: (response) {
        dismissDialogIndicator();
        showDialogAuto(method: () {
          pop();
          push(Routes.homeScreen);
        }, message: context.locale.loginSuccess);
        _user = response;
        GlobalVariables.userData = _user!;
      },
    );
  }

  /// Register
  Future<void> registerWithEmailAndPassword() async {
    showCircularIndicator(message: context.locale.pleaseWait);
    await fireBaseAuthCall(
      firebaseAuthType: FirebaseAuthType.signIN,
      email: registerEmailController.text.trim(),
      password: registerPasswordController.text.trim(),
      failed: (int statusCode, String errorDesc) {
        dismissDialogIndicator();
        showDialogAuto(method: () => pop(), message: errorDesc);
      },
      success: (response) {
        dismissDialogIndicator();
        showDialogAuto(method: () {
          pop();
          pushReplacement(Routes.loginScreen);
        }, message: context.locale.registerSuccess);
        _user = response;
      },
    );
  }

  Future<void> signInWithGoogle() async {
    showCircularIndicator(message: context.locale.pleaseWait);
    await fireBaseAuthCall(
      firebaseAuthType: FirebaseAuthType.registerWithMail,
      email: registerEmailController.text.trim(),
      password: registerPasswordController.text.trim(),
      failed: (int statusCode, String errorDesc) {
        print("catch $statusCode  ${errorDesc.toString()}");
        dismissDialogIndicator();
        showDialogAuto(method: () => pop(), message: errorDesc);
      },
      success: (response) {
        dismissDialogIndicator();
        showDialogAuto(method: () {
          pop();
          push(Routes.homeScreen);
        }, message: context.locale.loginSuccess);
        _user = response;
      },
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    registerEmailController.dispose();
    registerPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
