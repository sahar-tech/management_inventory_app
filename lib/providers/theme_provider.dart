import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  // نغير القيمة الافتراضية لـ system بدلاً من light
  ThemeMode _themeMode = ThemeMode.system;
  bool _isDarkMode = false;
  bool _useSystemTheme = true; // إضافة متغير جديد لتتبع استخدام النظام

  ThemeMode get themeMode => _themeMode;
  bool get isDarkMode => _isDarkMode;
  bool get useSystemTheme => _useSystemTheme;

  ThemeProvider() {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      
      // تحميل إعداد استخدام النظام
      _useSystemTheme = prefs.getBool('useSystemTheme') ?? true;
      
      if (_useSystemTheme) {
        // إذا كان يستخدم النظام، نضع themeMode = system
        _themeMode = ThemeMode.system;
      } else {
        // إذا كان لا يستخدم النظام، نحمل الإعداد اليدوي
        final isDark = prefs.getBool('isDarkMode') ?? false;
        _isDarkMode = isDark;
        _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
      }
      
      notifyListeners();
    } catch (e) {
      print('Error loading theme: $e');
    }
  }

  // دالة للتبديل بين فاتح/داكن يدوياً
  Future<void> toggleDarkLight() async {
    _useSystemTheme = false; // عند التبديل يدوياً، نتجاهل النظام
    _isDarkMode = !_isDarkMode;
    _themeMode = _isDarkMode ? ThemeMode.dark : ThemeMode.light;
    
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('useSystemTheme', _useSystemTheme);
      await prefs.setBool('isDarkMode', _isDarkMode);
    } catch (e) {
      print('Error saving theme: $e');
    }
    
    notifyListeners();
  }

  // دالة لتشغيل/إيقاف النظام التلقائي
  Future<void> toggleSystemTheme(bool useSystem) async {
    _useSystemTheme = useSystem;
    
    if (useSystem) {
      _themeMode = ThemeMode.system;
    } else {
      // إذا أوقفنا النظام، نستخدم الإعداد اليدوي الحالي
      _themeMode = _isDarkMode ? ThemeMode.dark : ThemeMode.light;
    }
    
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('useSystemTheme', _useSystemTheme);
    } catch (e) {
      print('Error saving system theme: $e');
    }
    
    notifyListeners();
  }

  // دالة لتعيين الثيم يدوياً
  void setTheme(bool isDark) {
    _useSystemTheme = false;
    _isDarkMode = isDark;
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  // دالة للحصول على الوضع الحالي الفعلي
  bool get actualIsDarkMode {
    if (_themeMode == ThemeMode.system) {
      // هنا يمكنك التحقق من إعدادات النظام
      // هذا يتطلب حزمة مثل: dynamic_color أو flutter_platform_widgets
      // أو يمكنك استخدام: MediaQuery.of(context).platformBrightness
      return false; // قيمة افتراضية
    }
    return _isDarkMode;
  }
}