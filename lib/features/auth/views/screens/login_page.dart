import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:landmark_assignment/core/base/base_view.dart';
import 'package:landmark_assignment/core/util/extension/method_extension.dart';
import 'package:landmark_assignment/core/util/value/dimens.dart';
import 'package:landmark_assignment/core/util/value/images.dart';
import 'package:landmark_assignment/core/util/value/size_config.dart';
import 'package:landmark_assignment/features/auth/viewmodels/auth_view_model.dart';
import 'package:landmark_assignment/features/auth/views/components/login_email_password_form.dart';
import 'package:landmark_assignment/shared/widgets/custom_button.dart';

class LoginPage extends BaseView<AuthViewModel> {
  const LoginPage({super.key});

  @override
  void initState(AuthViewModel viewModel) {
    super.initState(viewModel);
  }
  @override
  Widget build(BuildContext context, AuthViewModel authViewModel) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                Images.loginImage,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(Dimens.defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.locale.welcome,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: Dimens.defaultPadding / 2),
                     Text(
                      context.locale.loginWithData,
                    ),
                    const SizedBox(height: Dimens.defaultPadding),
                    LoginEmailPasswordForm(formKey: authViewModel.loginFormKey,viewModel: authViewModel),
                    Align(
                      child: TextButton(
                        child:  Text(context.locale.forgotPassword),
                        onPressed: authViewModel.onPressForgot,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.blockSizeVertical! * 5,
                    ),
                    CustomButton(
                      onPressed: authViewModel.onPressLogin,
                      child: Text(context.locale.login),
                    ),
                    SizedBox(height: 10,),
                    CustomButton(
                      onPressed: authViewModel.onPressSignInWithGoogle,
                      child: Text(context.locale.signInWithGoogle),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(context.locale.dontHaveAcc),
                        TextButton(
                          onPressed: authViewModel.onPressRegister,
                          child:  Text(context.locale.register),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }

  @override
  AuthViewModel createViewModel() {
    return AuthViewModel();
  }
}
