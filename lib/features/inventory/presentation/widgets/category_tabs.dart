import 'package:flutter/material.dart';
import 'package:management_inventory_app/app/constants/app_colors.dart';
import 'package:management_inventory_app/app/widgets/custom_text.dart';

class CategoryTabs extends StatefulWidget {
  final bool isArabic;

  const CategoryTabs({required this.isArabic, super.key});
  @override
  _CategoryTabsState createState() => _CategoryTabsState();
}

class _CategoryTabsState extends State<CategoryTabs> {
  String selectedCategory = 'All';
  final ScrollController _scrollController = ScrollController();
  bool isAtStart = true;
  bool isAtEnd = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_checkScrollPosition);
  }

  void _scrollToPrevious() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.offset - 100, // Adjust the scroll amount as needed
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToNext() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.offset + 100, // Adjust the scroll amount as needed
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _checkScrollPosition() {
    if (_scrollController.hasClients) {
      final minScroll = _scrollController.position.minScrollExtent;
      final maxScroll = _scrollController.position.maxScrollExtent;
      final currentScroll = _scrollController.offset;

      setState(() {
        isAtStart = currentScroll <= minScroll;
        isAtEnd = currentScroll >= maxScroll;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final categories = ['All', 'Perfums', 'Bakhour', 'Box', 'Oud', 'Others'];
    final arabicCategories = {
      'All': 'الكل',
      'Perfums': 'عطور',
      'Bakhour': 'بخور',
      'Box': 'علب',
      'Oud': 'عود',
      'Others': 'أخرى',
    };

    return SizedBox(
      height: 40,
      child: Row(
        textDirection: widget.isArabic ? TextDirection.rtl : TextDirection.ltr,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (!isAtStart)
            IconButton(
              icon: Icon(
                widget.isArabic
                    ? Icons.arrow_forward_ios
                    : Icons.arrow_back_ios,
                size: 10,
                color: Colors.white,
              ),
              onPressed: _scrollToPrevious,
            ),

          Expanded(
            child: Directionality(
              textDirection: widget.isArabic
                  ? TextDirection.rtl
                  : TextDirection.ltr,

              child: ListView.builder(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  final label = widget.isArabic
                      ? arabicCategories[category]!
                      : category;
                  final isSelected = selectedCategory == category;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategory = category;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      decoration: isSelected
                          ? BoxDecoration(
                              color: AppColors.buttonPrimary,
                              borderRadius: BorderRadius.circular(15),
                            )
                          : null,
                      child: CustomText(
                        text: label,
                        color: Colors.white,
                        fontSize: 8,
                        fontWeight: isSelected
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          if (!isAtEnd)
            IconButton(
              icon: Icon(
                widget.isArabic
                    ? Icons.arrow_back_ios
                    : Icons.arrow_forward_ios,
                size: 10,
                color: Colors.white,
              ),
              onPressed: _scrollToNext,
            ),
        ],
      ),
    );
  }
}
