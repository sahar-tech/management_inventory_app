import 'package:flutter/material.dart';

class AppColors {
  // الألوان الأساسية
  static const Color primaryColor = Color(0xFF010629);
  static const Color secondaryColor = Color(0xFF030C61);
  static const Color accentColor = Color(0xFF010743);
  // ألوان الأزرار
  static const Color buttonPrimary = Color(0xFF5e17eb);
  static const Color buttonSecondary = Color(0xFF03A9F4);
  static const Color buttonDisabled = Color(0xFFBDBDBD);
  
  // ألوان النصوص
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textLight = Color(0xFF9E9E9E);
  
  // ألوان الخلفية
  static const Color backgroundLight = Color(0xFFF5F5F5);
  static const Color backgroundDark = Color(0xFF303030);
  
  // ألوان الحالة
  static const Color successColor = Color(0xFF4CAF50);
  static const Color warningColor = Color(0xFFFF9800);
  static const Color errorColor = Color(0xFFF44336);
  static const Color infoColor = Color(0xFF2196F3);
  
  // ألوان الجودة
  static const Color qualityGood = Color(0xFF4CAF50);
  static const Color qualityOk = Color(0xFFFF9800);
  static const Color qualityBad = Color(0xFFF44336);
  
  // ألوان إضافية
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color grey = Color(0xFF9E9E9E);
  static const Color lightGrey = Color(0xFFE0E0E0);
  
  // ألوان التدرج
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF2196F3), Color(0xFF03A9F4)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}