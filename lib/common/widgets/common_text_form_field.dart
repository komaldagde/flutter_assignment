import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_assignment/common/utilities/colors_utility.dart';
import 'package:flutter_assignment/common/utilities/text_style_utility.dart';
import 'package:flutter_assignment/common/utilities/util.dart';

// ignore: must_be_immutable
class CommonTextFormField extends StatefulWidget {
  List<TextInputFormatter>? inputFormatters;
  TextInputType? keyboardType;
  final String? initialValue;
  final TextEditingController? controller;
  final Color? fillColor;
  final int? maxLength;
  final Widget? icon;
  final FormFieldValidator? validator;
  final String? hintText;
  final String? label;
  final Widget? suffixIcon;
  final String? helperText;
  final bool? filled;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;
  final TextCapitalization? textCapitalization;
  final double? width;
  bool? readOnly;

  CommonTextFormField(
      {super.key,
      this.textCapitalization = TextCapitalization.none,
      this.fillColor,
      this.initialValue,
      this.keyboardType,
      this.readOnly,
      this.controller,
      this.inputFormatters,
      this.hintText,
      this.label,
      this.maxLength,
      this.icon,
      this.suffixIcon,
      this.validator,
      this.onChanged,
      this.onTap,
      this.helperText,
      this.filled,
      this.width});

  @override
  State<CommonTextFormField> createState() => _CommonTextFormFieldState();
}

class _CommonTextFormFieldState extends State<CommonTextFormField> {
  @override
  Widget build(context) {
    return SizedBox(
      width: widget.width ?? buildWidth(context) * 0.90,
      child: TextFormField(
        readOnly: widget.readOnly != null ? widget.readOnly! : false,
        controller: widget.controller,
        maxLength: widget.maxLength,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        textCapitalization: widget.textCapitalization!,
        initialValue: widget.initialValue,
        autofocus: false,
        keyboardType: widget.keyboardType,
        inputFormatters: widget.inputFormatters,
        validator: widget.validator,
        onChanged: widget.onChanged,
        onTap: widget.onTap,
        cursorColor: ColorsUtility.secondaryGreyColor,
        decoration: InputDecoration(
          // filled: true,
          // fillColor: ColorsUtility.primaryWhiteColor,
          helperText: widget.helperText,
          suffixIcon: widget.suffixIcon,
          hintText: widget.hintText,
          labelStyle: TextStyleUtility.commonTextStyle(context,
              ColorsUtility.inputBoxTextColor, 16.0, FontWeight.normal),
          contentPadding: EdgeInsets.symmetric(
              vertical: buildWidth(context) * 0.03,
              horizontal: buildWidth(context) * 0.04),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: ColorsUtility.primaryGreyColor),
            borderRadius: BorderRadius.circular(buildWidth(context) * 0.02),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: ColorsUtility.primaryGreyColor),
            borderRadius: BorderRadius.circular(buildWidth(context) * 0.02),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: ColorsUtility.primaryGreyColor),
            borderRadius: BorderRadius.circular(buildWidth(context) * 0.02),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: ColorsUtility.primaryRedColor),
            borderRadius: BorderRadius.circular(buildWidth(context) * 0.02),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: ColorsUtility.primaryGreyColor),
            borderRadius: BorderRadius.circular(buildWidth(context) * 0.02),
          ),
        ),
      ),
    );
  }
}
