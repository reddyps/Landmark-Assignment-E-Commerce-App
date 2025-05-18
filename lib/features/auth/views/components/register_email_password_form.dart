import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:landmark_assignment/core/util/extension/method_extension.dart';
import 'package:landmark_assignment/core/util/value/dimens.dart';
import 'package:landmark_assignment/core/util/value/images.dart';
import 'package:landmark_assignment/features/auth/viewmodels/auth_view_model.dart';
import 'package:landmark_assignment/shared/widgets/custom_textfield.dart';

class RegisterEmailPasswordForm extends StatelessWidget {
  const RegisterEmailPasswordForm({
    super.key,
    required this.formKey,
    required this.viewModel,
  });

  final GlobalKey<FormState> formKey;
  final AuthViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextField(
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Dimens.defaultPadding * 0.75,
              ),
              child: SvgPicture.asset(
                Images.message,
                height: 24,
                width: 24,
                color: Colors.black,
              ),
            ),
            controller: viewModel.registerEmailController,
            labelText: context.locale.email,
            validator: viewModel.emailValidator,
          ),
          const SizedBox(height: Dimens.defaultPadding),
          CustomTextField(
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Dimens.defaultPadding * 0.75,
              ),
              child: SvgPicture.asset(
                Images.lock,
                height: 24,
                width: 24,
                color: Colors.black,
              ),
            ),
            controller: viewModel.registerPasswordController,
            labelText: context.locale.password,
            obscureText: true,
            validator: viewModel.passwordValidator,
          ),
          const SizedBox(height: Dimens.defaultPadding),
          CustomTextField(
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Dimens.defaultPadding * 0.75,
              ),
              child: SvgPicture.asset(
                Images.lock,
                height: 24,
                width: 24,
                color: Colors.black,
              ),
            ),
            labelText: context.locale.confirmPassword,
            obscureText: true,
            validator: (value) {
              if (value == null || value != viewModel.registerPasswordController.text) {
                return context.locale.passwordNotMatch;
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
