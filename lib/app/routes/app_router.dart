import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../features/auth/presentation/auth_controller.dart';

// 💡 مفتاح التنقل العالمي لمراقبة حالة الشاشات برمجياً
final navigatorKey = GlobalKey<NavigatorState>();

// 🌍 مزوّد Riverpod المسؤول عن بناء وإدارة نظام المسارات بالكامل في الذاكرة
final appRouterProvider = Provider<GoRouter>((ref) {
  // الاستماع لحالة تسجيل الدخول (هل يوجد حساب مسجل أم لا؟)
  final authState = ref.watch(authStateStreamProvider);
  // الاستماع لحالة بيانات المستخدم (الصلاحية والتفعيل)
  final userDataAsync = ref.watch(currentUserDataProvider);

  return GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: '/splash', // نقطة الانطلاق الأولى للتطبيق دائماً
    
    // 🛡️ الخوارزمية الذكية لحماية المسارات والتوجيه التلقائي (Redirect Guard)
    redirect: (context, state) {
      final isLoggingIn = state.matchedLocation == '/login';
      final isRegistering = state.matchedLocation == '/signup';
      final isSplashing = state.matchedLocation == '/splash';

      // 1. إذا كان الفايربيس لا يزال يحمل أو يجلب البيانات، ابق في الـ Splash
      if (authState.isLoading || userDataAsync.isLoading) return null;

      final user = authState.value;
      final userData = userDataAsync.value;

      // 2. حالة عدم وجود مستخدم مسجل
      if (user == null) {
        if (isLoggingIn || isRegistering) return null; // اسمح له بالذهاب لصفحات الدخول
        return '/login'; // أي محاولة أخرى اطرده لصفحة الدخول فوراً
      }

      // 3. حالة وجود مستخدم ولكن قاعدة البيانات (Firestore) لم تنشئ حسابه بعد
      if (userData == null) {
        return '/login';
      }

      // 4. سيناريو الحساب غير المفعّل (وينتظر موافقة زوجكِ)
      if (!userData.isActive && userData.role != 'admin') {
        return '/waiting'; // خذه لصفحة الانتظار ولا تسمح له بالتحرك
      }

      // 5. إذا كان الحساب مفعّلاً وسليماً وهو في صفحات الدخول، خذه لصفحة العمليات فوراً
      if (isLoggingIn || isRegistering || isSplashing) {
        if (userData.role == 'admin') {
          return '/admin-dashboard'; // زوجكِ يذهب للوحة تحكم الإدارة
        } else {
          return '/home'; // العمال يذهبون لصفحة العمليات المخصصة لهم
        }
      }

      return null; // اترك المستخدم في مساره الحالي إذا تطابق مع الشروط
    },

    // 📋 قائمة شجرة المسارات والشاشات الرسمية للتطبيق
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const Scaffold(
          body: Center(child: CircularProgressIndicator()), // سنبدلها لاحقاً بصفحة الـ Splash المصممة
        ),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const Scaffold(
          body: Center(child: Text('واجهة تسجيل الدخول 🔑')), // سنربطها بـ LoginScreen
        ),
      ),
      GoRoute(
        path: '/signup',
        builder: (context, state) => const Scaffold(
          body: Center(child: Text('واجهة إنشاء حساب للعمال 📝')), // سنربطها بـ SignupScreen
        ),
      ),
      GoRoute(
        path: '/waiting',
        builder: (context, state) => const Scaffold(
          body: Center(child: Text('شاشة الانتظار: بانتظار تفعيل المدير ⏳')), 
        ),
      ),
      GoRoute(
        path: '/admin-dashboard',
        builder: (context, state) => const Scaffold(
          body: Center(child: Text('مرحباً بك يا مدير: لوحة تحكم زوجكِ 📊')), 
        ),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const Scaffold(
          body: Center(child: Text('واجهة العمليات للعمال المفعّلين 📦')), 
        ),
      ),
    ],
  );
});
