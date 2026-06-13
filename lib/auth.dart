import 'package:flutter/material.dart';
import 'package:management_inventory_app/app/constants/app_colors.dart';
import 'package:management_inventory_app/app/widgets/language_switcher.dart';
import 'package:management_inventory_app/features/auth/presentation/screens/splash_screen.dart';

class Auth extends StatelessWidget {
  final Widget? child;
  const Auth({this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column( // Wrap Expanded in a Column
        children: [
          Expanded(child: child ?? Splash()),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child: LanguageSwitcher()
      )
    );
  }
}
