import 'package:flutter/material.dart';
import 'package:management_inventory_app/app/constants/app_colors.dart';
import 'package:management_inventory_app/widgets/common/custom_text.dart';

class CustomButtonIcon extends StatelessWidget {
  final CustomText? customText;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final IconData icon;
  final IconAlignment iconAlignment;

  const CustomButtonIcon({
    super.key,
    this.customText,
    required this.onPressed,
    this.backgroundColor,
    required this.icon,
    this.textColor,
    this.iconAlignment = IconAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: textColor ?? Colors.white),
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? AppColors.buttonPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.symmetric(vertical: 3),
      ),
      iconAlignment: iconAlignment,
      label: customText != null
          ? customText!
          : const SizedBox(), // Provide an empty widget if customText is null
    );
  }
}
