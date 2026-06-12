import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppLocalizations {
  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const List<Locale> supportedLocales = [
    Locale('ar', ''),
    Locale('en', ''),
  ];

  static const List<LocalizationsDelegate> localizationsDelegates = [
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  final Map<String, Map<String, String>> _localizedStrings = {
    'en': {
      'welcome_back': 'Welcome Back',
      'login': 'Login',
      'signup': 'Sign Up',
      'email': 'Email',
      'password': 'Password',
      'forgot_password': 'Forgot Password?',
      'full_name': 'Full Name',
      'dont_have_account': 'Don\'t have an account?',
      'already_have_account': 'Already have an account?',
      'signup_now': 'Signup Now',
      'login_here': 'Log in here',
      'add_new_product': 'Add new product',
      'add_new_provider': 'Add new provider',
      'search': 'Search...',
      'all': 'All',
      'perfumes': 'Perfumes',
      'bakhour': 'Bakhour',
      'boxes': 'Boxes',
      'others': 'Others',
      'featured_products': 'Featured Products',
      'good': 'Good',
      'ok': 'Ok',
      'bad': 'Bad',
      'category': 'Category',
      'code': 'Code',
      'quantity': 'Quantity',
      'type': 'Type',
      'provider': 'Provider',
      'price': 'Price',
      'unit': 'Unit',
      'name': 'Name',
      'add': 'Add',
      'edit': 'Edit',
      'delete': 'Delete',
      'favorite': 'Favorite',
      'logout': 'Logout',
      'settings': 'Settings',
      'profile': 'Profile',
      'filter': 'Filter',
      'filter_by_quality': 'Filter by Quality',
      'filter_by_category': 'Filter by Category',
      'save': 'Save',
      'cancel': 'Cancel',
      'confirm_delete': 'Are you sure you want to delete?',
      'yes': 'Yes',
      'no': 'No',
      'product_added': 'Product added successfully',
      'product_updated': 'Product updated successfully',
      'product_deleted': 'Product deleted successfully',
      'provider_added': 'Provider added successfully',
      'password_reset_sent': 'Password reset email sent',
      'login_successful': 'Login successful',
      'signup_successful': 'Signup successful',
      'invalid_email': 'Invalid email address',
      'weak_password': 'Password is too weak',
      'email_already_in_use': 'Email already in use',
      'user_not_found': 'User not found',
      'wrong_password': 'Wrong password',
      'unknown_error': 'An unknown error occurred',
    },
    'ar': {
      'welcome_back': 'مرحبا بعودتك',
      'login': 'تسجيل الدخول',
      'signup': 'تسجيل حساب جديد',
      'email': 'البريد الإلكتروني',
      'password': 'كلمة السر',
      'forgot_password': 'هل نسيت كلمة السر؟',
      'full_name': 'الاسم الكامل',
      'dont_have_account': 'لا يوجد لديك حساب؟',
      'already_have_account': 'ألديك حساب بالفعل؟',
      'signup_now': 'سجل الآن',
      'login_here': 'سجل دخولك هنا',
      'add_new_product': 'إضافة منتج جديد',
      'add_new_provider': 'إضافة مزود جديد',
      'search': 'بحث...',
      'all': 'الكل',
      'perfumes': 'عطور',
      'bakhour': 'بخور',
      'boxes': 'علب',
      'others': 'أشغال',
      'featured_products': 'منتجات مميزة',
      'good': 'جيد',
      'ok': 'عادي',
      'bad': 'سيء',
      'category': 'الصنف',
      'code': 'الكود',
      'quantity': 'الكمية',
      'type': 'النوع',
      'provider': 'المزود',
      'price': 'السعر',
      'unit': 'الوحدة',
      'name': 'الإسم',
      'add': 'إضافة',
      'edit': 'تعديل',
      'delete': 'حذف',
      'favorite': 'مفضل',
      'logout': 'تسجيل الخروج',
      'settings': 'الإعدادات',
      'profile': 'الملف الشخصي',
      'filter': 'فلترة',
      'filter_by_quality': 'تصفية حسب الجودة',
      'filter_by_category': 'تصفية حسب الصنف',
      'save': 'حفظ',
      'cancel': 'إلغاء',
      'confirm_delete': 'هل أنت متأكد من الحذف؟',
      'yes': 'نعم',
      'no': 'لا',
      'product_added': 'تمت إضافة المنتج بنجاح',
      'product_updated': 'تم تحديث المنتج بنجاح',
      'product_deleted': 'تم حذف المنتج بنجاح',
      'provider_added': 'تمت إضافة المزود بنجاح',
      'password_reset_sent': 'تم إرسال بريد إعادة تعيين كلمة المرور',
      'login_successful': 'تم تسجيل الدخول بنجاح',
      'signup_successful': 'تم التسجيل بنجاح',
      'invalid_email': 'بريد إلكتروني غير صالح',
      'weak_password': 'كلمة المرور ضعيفة',
      'email_already_in_use': 'البريد الإلكتروني مستخدم بالفعل',
      'user_not_found': 'المستخدم غير موجود',
      'wrong_password': 'كلمة المرور خاطئة',
      'unknown_error': 'حدث خطأ غير معروف',
    },
  };

  final Locale locale;

  AppLocalizations(this.locale);

  String translate(String key) {
    return _localizedStrings[locale.languageCode]?[key] ?? key;
  }
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}