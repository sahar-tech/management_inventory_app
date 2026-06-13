import 'package:flutter/material.dart';
import 'package:management_inventory_app/features/inventory/domain/product_model.dart';
import 'package:management_inventory_app/app/widgets/custom_text.dart';
import 'package:management_inventory_app/features/inventory/presentation/widgets/product_card.dart';

class ProductGrid extends StatefulWidget {
  final bool isArabic;

  const ProductGrid({required this.isArabic, super.key});
  @override
  _ProductGridState createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> {
  final List<Product> _products = [
    Product(
      id: '1',
      name: 'Black Mesk',
      code: 'BM001',
      price: 18000,
      type: 'perfums',
      quantity: 10,
      unit: 'bottle',
      category: 'perfums',
      providerId: 'p1',
      quality: 'good',
      imageUrls: ['assets/prod1.jpg'],
    ),
    Product(
      id: '2',
      name: 'Machakel Perfum',
      code: 'MP002',
      price: 5000,
      type: 'perfums',
      quantity: 20,
      unit: 'bottle',
      category: 'perfums',
      providerId: 'p2',
      quality: 'ok',
      imageUrls: ['assets/prod2.jpg'],
    ),
    Product(
      id: '3',
      name: 'Fakhama Bakhour',
      type: 'bakhour',
      code: 'FB003',
      price: 250,
      quantity: 50,
      unit: 'gram',
      category: 'bakhour',
      providerId: 'p3',
      quality: 'bad',
      imageUrls: ['assets/prod3.jpg'],
    ),
    Product(
      id: '4',
      name: 'Edmen Perfum',
      type: 'perfums',
      code: 'EP004',
      price: 6000,
      quantity: 15,
      unit: 'bottle',
      category: 'perfums',
      providerId: 'p1',
      quality: 'good',
      imageUrls: ['assets/prod4.jpg'],
    ),
    Product(
      id: '5',
      name: 'Bakhour Deluxe',
      code: 'BD005',
      type: "bakhour",
      price: 6000,
      quantity: 15,
      unit: 'gram',
      category: 'bakhour',
      providerId: 'p1',
      quality: 'ok',
      imageUrls: ['assets/prod5.jpg'],
    ),
    Product(
      id: '6',
      name: 'Box Perfum',
      code: 'EP006',
      type: 'box',
      price: 6000,
      quantity: 15,
      unit: 'box',
      category: 'box',
      providerId: 'p1',
      quality: 'good',
      imageUrls: ['assets/prod6.jpg'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.43, // Adjust height as needed
      child: Center(
        child: _products.isEmpty
            ? CustomText(
                text: widget.isArabic ? 'لا توجد منتجات' : 'No products found',
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              )
            : SingleChildScrollView(
                child: GridView.builder(
                  shrinkWrap: true, // Prevents overflow by limiting the grid size
                  physics: const NeverScrollableScrollPhysics(), // Disable GridView's own scrolling
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 1,
                    childAspectRatio: 1,
                  ),
                  itemCount: _products.length,
                  itemBuilder: (context, index) {
                    final product = _products[index];
                    return ProductCard(
                      product: product,
                      isArabic: widget.isArabic,
                    );
                  },
                ),
              ),
      ),
    );
  }
}
