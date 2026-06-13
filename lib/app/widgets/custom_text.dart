import 'package:flutter/material.dart';
import 'package:management_inventory_app/app/constants/app_strings.dart';
import 'package:management_inventory_app/providers/language_provider.dart';
import 'package:provider/provider.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;

  const CustomText({super.key, required this.text, this.color, this.fontSize, this.fontWeight, this.textAlign});

  @override
  Widget build(BuildContext context) {
    bool isArabic = Provider.of<LanguageProvider>(context).isArabic;
    return Text(
      text,
      textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
      textAlign: textAlign,
      style: TextStyle(
        fontFamily: isArabic ? AppStrings.fontCairo : AppStrings.fontPoppins,
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}