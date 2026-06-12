
import 'package:flutter/material.dart';
import 'package:management_inventory_app/constants/colors.dart';

class CardButton extends StatelessWidget {
  final  IconData? icon;
  final  VoidCallback? onPressed;

  const CardButton( this.icon, this.onPressed, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      width: 24,
      decoration: const BoxDecoration(
        color: AppColors.buttonPrimary,
        shape: BoxShape.circle,
      ),
        child: IconButton(
          icon: Icon(icon, color: Colors.white, size: 15),
          onPressed: onPressed,
          constraints: const BoxConstraints(),
          padding: EdgeInsets.zero,
        ),
      
    );
  }
}