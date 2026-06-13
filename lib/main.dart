import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:management_inventory_app/app/constants/app_strings.dart';
import 'package:management_inventory_app/app/constants/app_colors.dart';
import 'package:management_inventory_app/app/routes/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  runApp(
    // 🌍 التغليف السحري الأساسي لتشغيل Riverpod في كامل المشروع
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

// ⚡ تحويل الصنف إلى ConsumerWidget لكي يتعرف على الـ WidgetRef بأمان ومثالية
class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 🗺️ قراءة مزوّد المسارات الحديث والذكي من ريفر بود
    final router = ref.watch(appRouterProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appNameAr, // سنقوم بربط مزوّد اللغات الحديث لاحقاً بسطر واحد
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.primaryColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.primaryColor,
        ),
        // إعداد الخط الافتراضي الاحترافي (Cairo) للتطبيق ككل
        fontFamily: AppStrings.fontCairo,
      ),
      // ربط الـ GoRouter المطور تلقائياً لإدارة الواجهات والصلاحيات
      routerConfig: router,
    );
  }
}
