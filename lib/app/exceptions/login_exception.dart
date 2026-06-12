
class LoginExceptions {
  final bool isArabic;

  LoginExceptions(this.isArabic);

  String getErrorMessage(String message) {

    if (message.contains('network-request-failed')) {
      return isArabic
          ? 'لا يوجد اتصال بالشبكة. يرجى التحقق من الاتصال.'
          : 'Network error. Please check your connection.';
    } else if (message.contains('invalid-email')) {
      return isArabic
          ? 'البريد الإلكتروني غير صحيح التنسيق'
          : 'The email address is badly formatted';
    } else if (message.contains('invalid-credential')) {
      return isArabic
          ? 'بيانات الدخول غير صحيحة (البريد الإلكتروني أو كلمة المرور)'
          : 'Invalid credentials (email or password)';
    } else {
      return isArabic
          ? 'حدث خطأ غير متوقع. يرجى المحاولة مرة أخرى.'
          : 'An unexpected error occurred. Please try again.';
    }
  }
}
