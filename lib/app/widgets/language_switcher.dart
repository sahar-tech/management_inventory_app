import 'package:flutter/material.dart';
import 'package:management_inventory_app/providers/language_provider.dart';
import 'package:management_inventory_app/widgets/common/custom_text.dart';
import 'package:provider/provider.dart';

class LanguageSwitcher extends StatelessWidget {
  const LanguageSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    return Center(
      child: FittedBox(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomText(
              text: languageProvider.isArabic ? 'عربية' : 'English',
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
            IconButton(
              icon: const Icon(Icons.language, color: Colors.white),
              onPressed: () {
                languageProvider.toggleLanguage();
              },
            ),
          ],
        ),
      ),
    );
  }
}
