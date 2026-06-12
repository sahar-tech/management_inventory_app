import 'package:flutter/material.dart';
import 'package:management_inventory_app/constants/colors.dart';
import 'package:management_inventory_app/screen/splash/splash.dart';
import 'package:management_inventory_app/widgets/common/language_switcher.dart';

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
