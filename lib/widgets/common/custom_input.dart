import 'package:flutter/material.dart';
import 'package:management_inventory_app/providers/language_provider.dart';
import 'package:provider/provider.dart';

class CustomInput extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? hintText;
  final String? Function(String?)? validator;

  const CustomInput({
    super.key,
    this.hintText= '',
    this.controller,
    this.keyboardType,
    this.validator,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return 
        TextFormField(
          validator: validator,
          textDirection: Provider.of<LanguageProvider>(context).isArabic ? TextDirection.rtl : TextDirection.ltr,
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          cursorColor: Colors.white,
          style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white.withOpacity(0.3),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            hintText: hintText,
            hintTextDirection: Provider.of<LanguageProvider>(context).isArabic ? TextDirection.rtl : TextDirection.ltr,
            hintStyle: const TextStyle(color: Colors.white, fontSize: 12),
          ),
    );
  }
}
