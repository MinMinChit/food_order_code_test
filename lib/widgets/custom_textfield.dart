import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/color_style.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final Function(String)? onChanged;
  final bool obscureText;
  final bool readOnly;
  final String? labelText;
  final String? initialValue;
  final String? prefixIconPath;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final VoidCallback? onTap;
  final double borderSide;
  final TextInputAction? textInputAction;
  final Function(String)? onFieldSubmitted;
  final int? maxLines;
  final Color? color;
  final bool autoFocus;
  final List<TextInputFormatter>? inputFormatters;
  final String? suffixText;
  final TextStyle? suffixStyle;
  final TextStyle? style;

  const CustomTextField({
    super.key,
    this.hintText,
    this.onChanged,
    this.controller,
    this.readOnly = false,
    this.initialValue,
    this.obscureText = false,
    this.labelText,
    this.prefixIconPath,
    this.suffixIcon,
    this.validator,
    this.onFieldSubmitted,
    this.keyboardType,
    this.textInputAction,
    this.onTap,
    this.borderSide = 1.0,
    this.maxLines = 1,
    this.color,
    this.autoFocus = false,
    this.inputFormatters,
    this.suffixText,
    this.suffixStyle,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autofocus: autoFocus,
      initialValue: initialValue,
      readOnly: readOnly,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      inputFormatters: inputFormatters,
      obscureText: obscureText,
      style: style ?? KStyle.tTextLarge,
      cursorColor: KStyle.cRed,
      validator: validator,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        fillColor: color ?? KStyle.cWhite,
        filled: true,
        hintText: hintText,
        hintStyle: KStyle.tTextLarge.copyWith(
          color: KStyle.cStroke,
        ),
        suffixText: suffixText,
        suffixStyle: suffixStyle,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIconPath != null
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13),
                child: SvgPicture.asset(prefixIconPath!),
              )
            : null,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: KStyle.cStroke,
            width: 1,
          ),
          borderRadius: BorderRadius.zero,
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: KStyle.cRed,
            width: 1,
          ),
          borderRadius: BorderRadius.zero,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: KStyle.cStroke,
            width: 1,
          ),
          borderRadius: BorderRadius.zero,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: KStyle.cStroke,
            width: borderSide,
          ),
          borderRadius: BorderRadius.zero,
        ),
      ),
      onTap: onTap,
      maxLines: maxLines,
    );
  }
}
