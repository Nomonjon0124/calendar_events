import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? hint;
  final String? label;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final bool readOnly;
  final bool showCursor;
  final bool enabled;
  final int? maxLines;
  final int? minLines;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Function()? onTap;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final Function()? onEditingComplete;
  final Function()? onTapOutside;
  final FocusNode? focusNode;
  final String? initialValue;
  final bool autoFocus;
  final bool autocorrect;
  final bool enableSuggestions;
  final Color? fillColor;
  final bool? filled;
  final Color? cursorColor;
  final Color? hintColor;
  final Color? labelColor;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final Color? enabledBorderColor;
  final Color? disabledBorderColor;
  final Color? errorBorderColor;
  final Color? focusedErrorBorderColor;
  final Color? disabledErrorBorderColor;
  final Color? errorColor;
  final Color? focusedErrorColor;
  final Color? disabledErrorColor;
  final double? borderRadius;
  final double? borderWidth;
  final double? labelFontSize;
  final double? hintFontSize;
  final double? textFontSize;
  final double? cursorWidth;
  final double? cursorHeight;
  final double? elevation;
  final double? contentPadding;
  final double? prefixPadding;
  final double? suffixPadding;
  final double? labelPadding;
  final double? hintPadding;
  final double? textPadding;

  const CustomTextField({
    super.key,
    this.hint,
    this.label,
    this.validator,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.textInputAction,
    this.obscureText = false,
    this.readOnly = false,
    this.showCursor = false,
    this.enabled = true,
    this.maxLines,
    this.minLines,
    this.suffixIcon,
    this.prefixIcon,
    this.onTap,
    this.onChanged,
    this.onFieldSubmitted,
    this.onEditingComplete,
    this.onTapOutside,
    this.focusNode,
    this.initialValue,
    this.autoFocus = false,
    this.autocorrect = true,
    this.enableSuggestions = true,
    this.fillColor,
    this.filled,
    this.cursorColor,
    this.hintColor,
    this.labelColor,
    this.borderColor,
    this.focusedBorderColor,
    this.enabledBorderColor,
    this.disabledBorderColor,
    this.errorBorderColor,
    this.focusedErrorBorderColor,
    this.disabledErrorBorderColor,
    this.errorColor,
    this.focusedErrorColor,
    this.disabledErrorColor,
    this.borderRadius,
    this.borderWidth,
    this.labelFontSize,
    this.hintFontSize,
    this.textFontSize,
    this.cursorWidth,
    this.cursorHeight,
    this.elevation,
    this.contentPadding,
    this.prefixPadding,
    this.suffixPadding,
    this.labelPadding,
    this.hintPadding,
    this.textPadding,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      readOnly: readOnly,
      enabled: enabled,
      maxLines: maxLines,
      minLines: minLines,
      showCursor: showCursor,
      decoration: InputDecoration(
        fillColor: fillColor,
        filled: filled,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(borderRadius ?? 12), borderSide: BorderSide.none),
        hintText: hint,
        labelText: label,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
      keyboardType: keyboardType,
      obscureText: obscureText,
      onTap: onTap,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,

      textInputAction: textInputAction,
    );
  }
}
