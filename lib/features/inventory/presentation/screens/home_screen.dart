import 'package:flutter/material.dart';
import 'package:management_inventory_app/app/constants/app_colors.dart';
import 'package:management_inventory_app/features/inventory/presentation/widgets/header_home.dart';
import 'package:management_inventory_app/providers/language_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  final Widget child;
  const HomeScreen({required this.child, super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
//  final user = FirebaseAuth.instance.currentUser;

  bool isArabic = false;
  @override
  Widget build(BuildContext context) {
    final languageProvider = context.watch<LanguageProvider>();
    final isArabic = languageProvider.isArabic;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.0,
        title: HeaderHome(isArabic),
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
      ),
      body: Stack(
        children: [
          // Main content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                top: 40.0,
                bottom: 10.0,
              ),
              child: widget.child,
            ),
          ),
        ],
      ),
    );
  }
}
