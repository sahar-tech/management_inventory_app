import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:management_inventory_app/app/widgets/custom_button_icon.dart';
import 'package:management_inventory_app/app/widgets/custom_text.dart';

class ButtonActions extends StatelessWidget {
  final bool isArabic;
  const ButtonActions(this.isArabic, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,

      children: [
        Expanded(
          child: CustomButtonIcon(
            onPressed: () {
              context.push('/add-product');
            },
            icon: Icons.add,
            customText: CustomText(
              text: isArabic ? 'إضافة منتج جديد' : 'Add new product',
              color: Colors.white,
              fontSize: 8,
              fontWeight: FontWeight.normal,
            ),
            iconAlignment: isArabic ? IconAlignment.end : IconAlignment.start,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: CustomButtonIcon(
            iconAlignment: isArabic ? IconAlignment.end : IconAlignment.start,
            onPressed: () {
              context.push('/add-provider');
            },
            icon: Icons.add,
            customText: CustomText(
              text: isArabic ? 'إضافة مورد جديد' : 'Add new supplier',
              color: Colors.white,
              fontSize: 8,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }
}
