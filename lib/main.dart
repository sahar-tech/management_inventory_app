import 'package:flutter/material.dart';
import 'package:management_inventory_app/constants/routes.dart';
import 'package:management_inventory_app/providers/auth_provider.dart';
import 'package:management_inventory_app/providers/product_provider.dart';
import 'package:provider/provider.dart';
import '../constants/strings.dart';
import '../providers/theme_provider.dart';
import '../constants/colors.dart';
import '../providers/language_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:go_router/go_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
        //  ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return Consumer<LanguageProvider>(
            builder: (context, languageProvider, child) {
              return Consumer<AuthProvider>(
                builder: (context, authProvider, child) {
                  return MaterialApp.router(
                    debugShowCheckedModeBanner: false,
                    title: languageProvider.isArabic
                        ? AppStrings.appNameAr
                        : AppStrings.appNameEn,
                    theme: ThemeData(
                      scaffoldBackgroundColor: AppColors.primaryColor,
                      appBarTheme: const AppBarTheme(
                        backgroundColor: AppColors.primaryColor,
                      ),
                      textTheme: ThemeData.light().textTheme.copyWith(
                        bodyLarge: TextStyle(
                          fontFamily: languageProvider.isArabic
                              ? AppStrings.fontCairo
                              : AppStrings.fontPoppins,
                        ),
                        bodyMedium: TextStyle(
                          fontFamily: languageProvider.isArabic
                              ? AppStrings.fontCairo
                              : AppStrings.fontPoppins,
                        ),
                        titleLarge: TextStyle(
                          fontFamily: languageProvider.isArabic
                              ? AppStrings.fontCairo
                              : AppStrings.fontPoppins,
                        ),
                        titleMedium: TextStyle(
                          fontFamily: languageProvider.isArabic
                              ? AppStrings.fontCairo
                              : AppStrings.fontPoppins,
                        ),
                      ),
                    ),
                    routerConfig: AppRoute(authProvider:authProvider).router,
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
