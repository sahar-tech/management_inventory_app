import 'package:flutter/material.dart';
import 'package:management_inventory_app/widgets/common/search_bar_icon.dart';
import 'package:management_inventory_app/widgets/home/button_actions.dart';
import 'package:management_inventory_app/widgets/home/category_tabs.dart';
import 'package:management_inventory_app/widgets/home/featured_product_filter.dart';
import 'package:management_inventory_app/widgets/home/product_grid.dart';

class BaseHome extends StatefulWidget {
  final bool isArabic;

  const BaseHome({required this.isArabic, super.key});
  @override
  _BaseHomeState createState() => _BaseHomeState();
}

class _BaseHomeState extends State<BaseHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ButtonActions(widget.isArabic),
          SizedBox(height: 10),
          SearchBarIcon(widget.isArabic),
          SizedBox(height: 10),
          CategoryTabs(isArabic: widget.isArabic),
          SizedBox(height: 10),
          FeaturedProductFilter(isArabic: widget.isArabic),
          SizedBox(height: 10),
          ProductGrid(isArabic: widget.isArabic),
        ],
      ),
    );
  }
}
