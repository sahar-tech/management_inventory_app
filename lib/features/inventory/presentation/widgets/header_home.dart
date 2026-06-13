import 'package:flutter/material.dart';
import 'package:management_inventory_app/app/widgets/custom_text.dart';
import 'package:management_inventory_app/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class HeaderHome extends StatelessWidget {
  final bool isArabic;

  const HeaderHome(this.isArabic, {super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();

    return Padding(
      padding: const EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0, bottom: 30.0),
      child: Row(
        textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
        children: [
          GestureDetector(
            onTap: () {
              context.push('/profile');
            },
            child: Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('assets/logo.png'),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: isArabic ? 'مرحباً بعودتك' : 'Welcome Back',
                      color: Colors.white,
                      fontSize: 12,
                    ),
                    CustomText(
                      text: isArabic ? 'صلاح برني' : 'Salah Borni',
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () => authProvider.signOut(),
            icon: const Icon(Icons.power_settings_new, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
