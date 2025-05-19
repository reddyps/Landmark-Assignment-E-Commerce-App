import 'package:injectable/injectable.dart';
import 'package:landmark_assignment/core/base/base_viewmodel.dart';
import 'package:landmark_assignment/core/firebase/firebase_auth_type.dart';
import 'package:landmark_assignment/core/firebase/firebase_call.dart';
import 'package:landmark_assignment/core/navigation/routes.dart';
import 'package:landmark_assignment/core/util/extension/method_extension.dart';

@singleton
class ProfileViewModel extends BaseViewModel {
  final className = "ProfileViewModel";

  Future<void> logOUT() async {
    showCircularIndicator(message: context.locale.pleaseWait);
    await fireBaseAuthCall(
      firebaseAuthType: FirebaseAuthType.logOut,
      failed: (int statusCode, String errorDesc) {
        dismissDialogIndicator();
        showDialogAuto(method: () => pop(), message: errorDesc);
      },
      success: (response) {
        dismissDialogIndicator();
        showDialogAuto(method: () {
          push(Routes.loginScreen);
        }, message: context.locale.userLogOut);
      },
    );
  }

}
