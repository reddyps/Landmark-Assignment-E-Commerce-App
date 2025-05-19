import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:landmark_assignment/core/base/base_view.dart';
import 'package:landmark_assignment/core/util/extension/method_extension.dart';
import 'package:landmark_assignment/core/util/theme/constants.dart';
import 'package:landmark_assignment/core/util/value/images.dart';
import 'package:landmark_assignment/features/auth/viewmodels/auth_view_model.dart';
import 'package:landmark_assignment/features/auth/views/components/register_email_password_form.dart';
import 'package:landmark_assignment/shared/widgets/custom_button.dart';
import 'package:landmark_assignment/shared/widgets/custom_textfield.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key, required this.authViewModel});
  AuthViewModel authViewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              Images.signUp,
              height: MediaQuery.of(context).size.height * 0.35,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Let’s get started!",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: defaultPadding / 2),
                  const Text(
                    "Please enter your valid data in order to create an account.",
                  ),
                  const SizedBox(height: defaultPadding),
                  RegisterEmailPasswordForm(formKey: authViewModel.registerFormKey,viewModel: authViewModel,),
                  const SizedBox(height: defaultPadding),
                  Row(
                    children: [
                      Obx( // Wrap the Checkbox with Obx
                            () => Checkbox(
                          onChanged: authViewModel.checkBoxOnChanged,
                          value: authViewModel.termsConditions.value, // Access the .value
                        ),
                      ),
                      Expanded(
                        child: Text.rich(
                          TextSpan(
                            text: context.locale.iAgree,
                            children: [
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {

                                  },
                                text: context.locale.terms,
                                style: const TextStyle(
                                  color: primaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                               TextSpan(
                                text: context.locale.privacyPolicy,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: defaultPadding * 2),
                  ElevatedButton(
                    onPressed: authViewModel.onPressRegisterSubmit,
                    child:  Text(context.locale.register),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(context.locale.haveAccount),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        child:  Text(context.locale.logIn),
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
}
