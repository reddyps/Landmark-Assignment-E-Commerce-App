import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:landmark_assignment/core/util/extension/method_extension.dart';
import 'package:landmark_assignment/core/util/value/dimens.dart';
import 'package:landmark_assignment/core/util/value/images.dart';
import 'package:landmark_assignment/features/auth/viewmodels/auth_view_model.dart';
import 'package:landmark_assignment/shared/widgets/custom_textfield.dart';

class LoginEmailPasswordForm extends StatelessWidget {
  const LoginEmailPasswordForm({
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
            controller: viewModel.emailController,
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
            controller: viewModel.passwordController,
            labelText: context.locale.password,
            obscureText: true,
            validator: viewModel.passwordValidator,
          ),
        ],
      ),
    );
  }
}
