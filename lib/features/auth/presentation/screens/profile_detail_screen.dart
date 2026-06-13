import 'package:flutter/material.dart';
import 'package:management_inventory_app/app/widgets/custom_text.dart';
import 'package:provider/provider.dart';
import 'package:management_inventory_app/providers/language_provider.dart';

class ProfileDetailsScreen extends StatelessWidget {
  final bool isArabic; // This should ideally come from a provider or settings
  const ProfileDetailsScreen({this.isArabic = false, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:
          MediaQuery.of(context).size.height * 0.9, // Adjust height as needed
      child: Column(
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.yellow, width: 2),
                ),
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(
                    'assets/logo.png',
                  ), // Use logo as placeholder
                ),
              ),
              SizedBox(height: 10),
              CustomText(
                text: isArabic ? 'برني صلاح الدين' : 'Borni Salah Eddine',

                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              CustomText(
                text: 'borni.salah1988@gmail.com',
                color: Colors.white70,
                fontSize: 14,
              ),
            ],
          ),
          const SizedBox(height: 16),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  textDirection: isArabic
                      ? TextDirection.rtl
                      : TextDirection.ltr,
                  children: [
                    CustomText(
                      text: isArabic ? 'إعدادات الحساب' : 'Account Settings',
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                    const SizedBox(height: 10),
                    _buildSettingsTile(
                      icon: Icons.edit,
                      color: Colors.green,
                      title: isArabic ? 'تعديل الملف الشخصي' : 'Edit Profile',
                      onTap: () {},
                      isArabic: isArabic,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      isArabic ? 'إعدادات عامة' : 'General Settings',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 10),
                    _buildSettingsTile(
                      icon: Icons.language,
                      color: Colors.orange,
                      title: isArabic ? 'اللغة' : 'Language',
                      onTap: () {},
                      isArabic: isArabic,
                    ),
                    _buildSettingsTile(
                      icon: Icons.help_outline,
                      color: Colors.grey,
                      title: isArabic ? 'حول' : 'About',
                      onTap: () {},
                      isArabic: isArabic,
                    ),
                    _buildSettingsTile(
                      icon: Icons.info_outline,
                      color: Colors.blue,
                      title: isArabic
                          ? 'الشروط والأحكام'
                          : 'Terms & Conditions',
                      onTap: () {},
                      isArabic: isArabic,
                    ),
                    _buildSettingsTile(
                      icon: Icons.lock_outline,
                      color: Colors.red,
                      title: isArabic ? 'سياسة الخصوصية' : 'Privacy Policy',
                      onTap: () {},
                      isArabic: isArabic,
                    ),
                    _buildSettingsTile(
                      icon: Icons.star_border,
                      color: Colors.purple,
                      title: isArabic ? 'قيم هذا التطبيق' : 'Rate This App',
                      onTap: () {},
                      isArabic: isArabic,
                    ),
                    _buildSettingsTile(
                      icon: Icons.share_outlined,
                      color: Colors.pink,
                      title: isArabic ? 'شارك هذا التطبيق' : 'Share This App',
                      onTap: () {},
                      isArabic: isArabic,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildSettingsTile({
  required IconData icon,
  required Color color,
  required String title,
  required VoidCallback onTap,
  required bool isArabic,
}) {
  return Consumer<LanguageProvider>(
    builder: (context, languageProvider, child) {
      return ListTile(
        onTap: onTap,
        contentPadding: EdgeInsets.zero,
        trailing: isArabic
            ? Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
                child: Icon(icon, color: Colors.white, size: 20),
              )
            : Icon(Icons.arrow_forward_ios, color: Colors.white70, size: 16),
        leading: isArabic
            ? Icon(Icons.arrow_back_ios, color: Colors.white70, size: 16)
            : Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
                child: Icon(icon, color: Colors.white, size: 20),
              ),
        title: CustomText(text: title, color: Colors.white, fontSize: 16),
      );
    },
  );
}
