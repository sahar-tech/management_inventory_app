import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider with ChangeNotifier {
  Locale _locale = const Locale('ar');
  bool _isArabic = true;

  Locale get locale => _locale;
  bool get isArabic => _isArabic;

  LanguageProvider() {
    _loadLanguage();
  }

  Future<void> _loadLanguage() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final lang = prefs.getString('language') ?? 'ar';
      _isArabic = lang == 'ar';
      _locale = Locale(lang);
      notifyListeners();
    } catch (e) {
      print('Error loading language: $e');
    }
  }

  Future<void> toggleLanguage() async {
    _isArabic = !_isArabic;
    _locale = Locale(_isArabic ? 'ar' : 'en');
    
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('language', _locale.languageCode);
    } catch (e) {
      print('Error saving language: $e');
    }
    
    notifyListeners();
  }
}