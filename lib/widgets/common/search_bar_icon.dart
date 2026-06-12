import 'package:flutter/material.dart';

class SearchBarIcon extends StatelessWidget {
  final bool isArabic;
  const SearchBarIcon(this.isArabic, {super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
      textAlign: isArabic ? TextAlign.right : TextAlign.left,

      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        hintText: isArabic ? '... بحث' : 'Search ...',
        hintStyle: TextStyle(
          fontSize: 10,
          color: Colors.grey,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 5),
        suffixIcon: isArabic
            ? null
            : const Icon(
                Icons.search,
                color: Colors.grey,
              ), 
        prefixIcon: isArabic
            ? const Icon(Icons.search, color: Colors.grey)
            : null,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
      onChanged:
          (
            value,
          ) {}, //(value) => context.read<ProductProvider>().search(value),
    );
  }
}
