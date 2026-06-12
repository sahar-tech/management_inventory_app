import 'package:flutter/material.dart';
import 'package:management_inventory_app/app/theme/colors.dart';
import 'package:management_inventory_app/widgets/common/custom_button_icon.dart';
import 'package:management_inventory_app/widgets/common/custom_text.dart';

class FeaturedProductFilter extends StatefulWidget {
  final bool isArabic;

  const FeaturedProductFilter({required this.isArabic, super.key});
  @override
  _FeaturedProductFilterState createState() => _FeaturedProductFilterState();
}

class _FeaturedProductFilterState extends State<FeaturedProductFilter> {
  String selectedFilter = 'All';
    bool listView = false; 

  @override
  Widget build(BuildContext context) {
    final filters = widget.isArabic
        ? {'All': 'الكل', 'Good': 'جيد', 'Ok': 'مقبول', 'Bad': 'سيء'}
        : {'All': 'All', 'Good': 'Good', 'Ok': 'Ok', 'Bad': 'Bad'};
    return Row(
      textDirection: widget.isArabic ? TextDirection.rtl : TextDirection.ltr,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: widget.isArabic ? 'المنتجات المميزة' : 'Featured Products',
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),

        Row(
          textDirection: widget.isArabic
              ? TextDirection.rtl
              : TextDirection.ltr,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              icon: Icon(listView ? Icons.list : Icons.grid_view, color: Colors.white),
              onPressed: () {
                listView = !listView; // Toggle between list and grid view
                setState(() {}); // Update the UI
                // Handle filter button press
              },
            ),
            PopupMenuButton<String>(
              icon: Icon(Icons.filter_list, color: Colors.white),
              onSelected: (value) {
                setState(() {
                  selectedFilter = value; // Update the selected filter
                });
              },
              itemBuilder: (context) {
                return filters.entries.map((entry) {
                  return PopupMenuItem<String>(
                    onTap: () {
                      setState(() {
                        selectedFilter =
                            entry.key; // Update the selected filter
                      });
                    },
                    value: entry.key,
                    child: Row(
                      textDirection: widget.isArabic
                          ? TextDirection.rtl
                          : TextDirection.ltr,
                      children: [
                        Radio<String>(
                          activeColor: AppColors.buttonPrimary,
                          value: entry.key,
                          groupValue: selectedFilter,
                          onChanged: (value) {
                            setState(() {
                              selectedFilter = value!;
                              Navigator.pop(context); // Close the popup
                            });
                          },
                        ),
                        CustomText(
                          text: entry.value,
                          color: AppColors.primaryColor,
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  );
                }).toList();
              },
            ),
          ],
        ),
      ],
    );
  }
}
