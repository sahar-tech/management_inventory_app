import 'package:flutter/material.dart';
import 'package:management_inventory_app/app/theme/colors.dart';
import 'package:management_inventory_app/models/product.dart';
import 'package:management_inventory_app/widgets/common/card_button.dart';
import 'package:management_inventory_app/widgets/common/custom_text.dart';

class ProductCard extends StatefulWidget {
  final bool isArabic;
  final Product product;

  const ProductCard({required this.isArabic, super.key, required this.product});
  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    final qualityColors = {
      'good': Colors.green,
      'ok': Colors.yellow,
      'bad': Colors.red,
    };
    final qualityIcons = {
      'good': Icons.check_circle,
      'ok': Icons.info,
      'bad': Icons.cancel,
    };

    final qualityColor = qualityColors[widget.product.quality] ?? Colors.grey;

    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                    child: /*Image.network(
                      widget.product.imageUrls?.first ?? '../assets/logo.png', // Fallback to a default image if imageUrl is null
                      fit: BoxFit.cover,
                      width: double.infinity,
                      errorBuilder: (context, error, stackTrace) => const Icon(
                        Icons.broken_image,
                        color: Colors.grey,
                        size: 50,
                      ),
                    ),*/
                    Image.asset(  
                      widget.product.imageUrls?.first ?? 'assets/logo.png', // Use logo as placeholder
                      fit: BoxFit.contain,
                      width: 80,
                      height: 80,
                    ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,

                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        widget.product.name,
                        style: const TextStyle(
                          color: AppColors.accentColor,
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      CustomText(
                        text:
                            '${widget.product.price} ${widget.isArabic ? 'د.ج' : 'DA'}',
                        color: AppColors.buttonPrimary,
                        fontWeight: FontWeight.bold,
                        fontSize: 8,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 8,
            right: 8,
            child: Column(
              children: [
                CardButton(Icons.delete, () {}),
                const SizedBox(height: 4),
                CardButton(Icons.edit, () {}),
                const SizedBox(height: 4),
                CardButton(Icons.favorite /* favorite_border */, () {}),
              ],
            ),
          ),
          Positioned(
            top: 8,
            left: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: qualityColor,
                borderRadius: const BorderRadius.horizontal(
                  right: Radius.circular(10),
                ),
              ),
              child: Text(
                widget.product.quality,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 8
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
