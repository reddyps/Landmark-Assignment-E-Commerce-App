import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:landmark_assignment/core/util/styles/input_borders.dart';
import 'package:landmark_assignment/core/util/value/colors.dart';
import 'package:landmark_assignment/core/util/value/dimens.dart';
import 'package:landmark_assignment/core/util/value/dynamic_size_util.dart';
import 'package:landmark_assignment/core/util/value/size_config.dart';

class CustomTextField extends StatelessWidget with InputBorders {
  String? hintText;
  String? counterText;
  String? errorText;
  Iterable<String>? autofillHints;
  TextEditingController? controller;
  FocusNode? focusNode;
  bool? enabled;
  int? maxLength;
  List<TextInputFormatter>? inputFormatters;
  TextInputType? keyboardType;
  TextStyle? style;
  ValueChanged<String>? onChanged;
  String? labelText="";
  Widget ? suffixIcon;
  Widget? prefixIcon;
  bool? isMandatory = false;
  bool? hasValid = true;
  bool? filled= true;
  bool? obscureText= false;
  Color? fillColor = Colors.white70;
  GestureTapCallback? onTap;
  InputBorder? enabledBorder;
  InputBorder? disabledBorder;
  TextCapitalization? textCapitalization= TextCapitalization.none;
  final String? Function(String?)? validator;

  CustomTextField({
    super.key,
    this.textCapitalization,
    this.hintText,
    this.autofillHints,
    this.errorText,
    this.counterText,
    this.controller,
    this.focusNode,
    this.inputFormatters,
    this.keyboardType,
    this.maxLength,
    this.enabled,
    this.style,
    this.onChanged,
    this.labelText,
    this.suffixIcon,
    this.isMandatory,
    this.onTap,
    this.hasValid,
    this.prefixIcon,
    this.filled,
    this.fillColor,
    this.obscureText,
    this.validator
  }){
    isMandatory ??= false;
    hasValid ??= true;
    textCapitalization ??= TextCapitalization.none;
    filled ??= true;
    obscureText ??= false;
    fillColor ??= Colors.white70;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().initialize(context);
    return Column(
      children: [
        SizedBox(
          height: 60,
          width: double.infinity,
          child: TextFormField(
            validator : validator,
            obscureText: obscureText!,
            textCapitalization: textCapitalization!,
            controller: controller,
            focusNode: focusNode,
            maxLength: maxLength,
            enabled: enabled,
            autofillHints: autofillHints,
            keyboardType: keyboardType,
            inputFormatters: inputFormatters,
            decoration: InputDecoration(
              filled: filled,
              fillColor: fillColor,
              contentPadding: EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal! *1 ),
              counterText: counterText,
              label: isMandatory! ?
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: labelText,
                        style: hasValid! ?
                        Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.warmGrey,
                          fontSize: DynamicSizeUtil.getResponsiveFontSize(Dimens.textSize14),
                        ) : Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.red,
                          fontSize: DynamicSizeUtil.getResponsiveFontSize(Dimens.textSize14),
                        )
                    ),
                    TextSpan(
                      text: '*',
                      style: hasValid! ?
                      Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.warmGrey,
                        fontSize: DynamicSizeUtil.getResponsiveFontSize(Dimens.textSize14),
                      ) : Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.red,
                        fontSize: DynamicSizeUtil.getResponsiveFontSize(Dimens.textSize14),
                      ),
                    ),
                  ],
                ),
              ): RichText(text: TextSpan(text: labelText,
                  style: hasValid! ? Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.warmGrey,
                    fontSize: DynamicSizeUtil.getResponsiveFontSize(Dimens.textSize14),
                  ) : Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.red,
                    fontSize: DynamicSizeUtil.getResponsiveFontSize(Dimens.textSize14),
                  ))),
              suffixIcon :suffixIcon,
              prefixIcon: prefixIcon,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.0),
              ),
              enabledBorder  : hasValid! ? outlineInputBorder() : outlineErrorBorder(),
              disabledBorder : hasValid! ? outlineInputBorder() : outlineErrorBorder(),
              focusedBorder  : hasValid! ? outlineFocusedInputBorder() : outlineErrorBorder(),
            ),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppColors.black,
              fontSize: DynamicSizeUtil.getResponsiveFontSize(Dimens.textSize14),
            ),
            onChanged: onChanged,
            onTap: onTap,
          ),
        ),
        SizedBox(
          height: SizeConfig.blockSizeVertical! * 1,
        ),
        Visibility(
          visible: !hasValid!,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.info,
                    color: AppColors.red,
                    size: DynamicSizeUtil.getResponsiveFontSize(14),
                  ),
                  SizedBox(width: SizeConfig.blockSizeHorizontal! *1),
                  Expanded(
                    child: Text(
                      errorText ??'',
                      softWrap: true,
                      maxLines: 10,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.red,
                        fontSize: DynamicSizeUtil.getResponsiveFontSize(Dimens.textSize14),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical! * 1,
              ),
            ],
          ),
        )
      ],
    );
  }
}
