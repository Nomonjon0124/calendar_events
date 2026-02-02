import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final double? width;
  final double? height;
  final Widget? icon;
  final double? fontSize;
  final Color? fontColor;
  final FontWeight? fontWeight;
  final VoidCallback onTap;
  final Color? backgroundColor;

  const PrimaryButton({
    super.key,
    required this.title,
    this.width,
    this.height,
    this.fontSize,
    this.icon,
    this.fontColor,
    this.fontWeight,
    required this.onTap,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        minimumSize: Size(width ?? 100, height ?? 48),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          (icon != null) ? icon! : SizedBox.shrink(),
          (icon != null) ? SizedBox(width: 2) : SizedBox.shrink(),
          Text(title, style: TextStyle(fontSize: fontSize ?? 10, fontWeight: fontWeight ?? FontWeight.w600, color: fontColor ?? Colors.white)),
        ],
      ),
    );
  }
}
