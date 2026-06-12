import 'dart:async';

import 'package:flutter/material.dart';
import 'package:management_inventory_app/auth.dart';
import 'package:management_inventory_app/providers/auth_provider.dart';
import 'package:management_inventory_app/screen/auth/reset_password_screen.dart';
import 'package:management_inventory_app/screen/home/home_screen.dart';
import 'package:management_inventory_app/screen/auth/login_screen.dart';
import 'package:management_inventory_app/screen/home/product/add_product.dart';
import 'package:management_inventory_app/screen/home/product/product_details.dart';
import 'package:management_inventory_app/screen/home/profile/profile_details.dart';
import 'package:management_inventory_app/screen/auth/signup_screen.dart';
import 'package:management_inventory_app/screen/home/supplier/add_supplier.dart';
import 'package:go_router/go_router.dart';
import 'package:management_inventory_app/screen/splash/splash.dart';
import 'package:management_inventory_app/widgets/home/base_home.dart';

class AppRouteNames {
  static const String auth = '/';
  static const String splash = '/splash';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String resetPassword = '/reset-password';
  static const String home = '/home';
  static const String products = '/products';
  static const String addProduct = '/add-product';
  static const String editProduct = '/edit-product';
  static const String productDetail = '/product-detail';
  static const String addProvider = '/add-provider';
  static const String profile = '/profile';
}

class AppRoute {
  final AuthProvider authProvider;

  AppRoute({required this.authProvider});

  GoRouter get router => GoRouter(
    initialLocation: AppRouteNames.splash,
    refreshListenable: GoRouterRefreshStream(authProvider.authStateChanges),
    redirect: (context, state) {
      print(
        '///////////////////////////////////////////////////////////:  path=${state.matchedLocation},   Auth State: isLoading=${authProvider.isLoading}, user=${authProvider.user}',
      ); // Debug print

      if (authProvider.isLoading == true) {
        return AppRouteNames.splash; // Stay on the splash screen while loading
      }

      final isAuthenticated = authProvider.user != null;
      final isLoggingIn = state.matchedLocation == AppRouteNames.login;
      final isInSplash = state.matchedLocation == AppRouteNames.splash;

      if (!isAuthenticated) {
        return AppRouteNames.login; // Redirect to login if not authenticated
      }

      if (isAuthenticated && (isLoggingIn || isInSplash)) {
        return AppRouteNames.home; // Redirect to home if already authenticated
      }

      return null; // No redirection needed
    },
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return Auth(child: child);
        },
        routes: [
          GoRoute(
            path: AppRouteNames.splash,
            builder: (context, state) => Splash(),
          ),
          GoRoute(
            path: AppRouteNames.login,
            builder: (context, state) => LoginScreen(),
          ),
          GoRoute(
            path: AppRouteNames.signup,
            builder: (context, state) => SignUpScreen(),
          ),
          GoRoute(
            path: AppRouteNames.resetPassword,
            builder: (context, state) => ResetPasswordScreen(),
          ),

          ShellRoute(
            builder: (context, state, child) {
              return HomeScreen(child: child);
            },
            routes: [
              GoRoute(
                path: AppRouteNames.home,
                builder: (context, state) => BaseHome(isArabic: false),
              ),
              GoRoute(
                path: AppRouteNames.addProduct,
                builder: (context, state) => AddProductScreen(isArabic: false),
              ),
              GoRoute(
                path: AppRouteNames.addProvider,
                builder: (context, state) => AddSupplierScreen(isArabic: false),
              ),
              GoRoute(
                path: AppRouteNames.productDetail,
                builder: (context, state) =>
                    ProductDetailsScreen(isArabic: false),
              ),
              GoRoute(
                path: AppRouteNames.profile,
                builder: (context, state) =>
                    ProfileDetailsScreen(isArabic: false),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen((_) => notifyListeners());
  }

  late final StreamSubscription _subscription;
}
