import 'package:flutter/material.dart';
import 'package:management_inventory_app/models/product.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:management_inventory_app/widgets/common/custom_text.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product? product;
  final bool isArabic;

  const ProductDetailsScreen({
    super.key,
    this.product,
    this.isArabic = false,
  });

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final CarouselSliderController _carouselController =
      CarouselSliderController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final imageCount = widget.product?.imageUrls?.length ?? 0;

    return SizedBox(
      height:
          MediaQuery.of(context).size.height * 0.75, // Adjust height as needed

      child: Center(
        child: Column(
          children: [
            // Product Image with Navigation Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      color: Colors.white,
                      disabledColor: const Color.fromARGB(40, 158, 158, 158),
                      onPressed: _currentIndex > 0
                          ? () {
                              setState(() {
                                _currentIndex--;
                              });
                              _carouselController.previousPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            }
                          : null,
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: CarouselSlider(
                      options: CarouselOptions(
                        height: 200,
                        enableInfiniteScroll: false,
                        enlargeCenterPage: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                      ),
                      items: widget.product?.imageUrls?.map((imageUrl) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Image.asset(
                              height: 400,
                              imageUrl,
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(
                                    Icons.broken_image,
                                    color: Colors.grey,
                                    size: 100,
                                  ),
                            );
                          },
                        );
                      }).toList(),
                      carouselController: _carouselController,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      icon: Icon(Icons.arrow_forward_ios),
                      color: Colors.white,
                      disabledColor: const Color.fromARGB(40, 158, 158, 158),
                      onPressed: _currentIndex < imageCount - 1
                          ? () {
                              setState(() {
                                _currentIndex++;
                              });
                              _carouselController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            }
                          : null,
                    ),
                  ),
                ],
              ),
            ),

            // Product Name
            Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: CustomText(
                  text: widget.product?.name ?? 'N/A',
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Product Info List
            Expanded(
              child: Scrollbar(
                thumbVisibility: true,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            _buildInfoRow(
                              widget.isArabic ? 'الرمز' : 'Code',
                              widget.product?.code ?? 'N/A',
                            ),
                            Divider(color: Colors.white54),

                            _buildInfoRow(
                              widget.isArabic ? 'الجودة' : 'Quality',
                              widget.product?.quality ?? 'N/A',
                            ),
                            Divider(color: Colors.white54),
                            _buildInfoRow(
                              widget.isArabic ? 'الفئة' : 'Category',
                              widget.product?.category ?? 'N/A',
                            ),
                            Divider(color: Colors.white54),

                            _buildInfoRow(
                              widget.isArabic ? 'الكمية' : 'Quantity',
                              '${widget.product?.quantity} ${widget.product?.unit ?? 'N/A'}',
                            ),
                            Divider(color: Colors.white54),

                            _buildInfoRow(
                              widget.isArabic ? 'النوع' : 'Type',
                              widget.product?.type ?? 'N/A',
                            ),
                            Divider(color: Colors.white54),

                            _buildInfoRow(
                              widget.isArabic ? 'المزوّد' : 'Provider',
                              widget.product?.providerId ?? 'N/A',
                            ),
                            Divider(color: Colors.white54),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Price Section
            Container(
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  textDirection: widget.isArabic
                      ? TextDirection.rtl
                      : TextDirection.ltr,
                  children: [
                    CustomText(
                      text: widget.isArabic ? 'السعر' : 'Price:',
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomText(
                      text:
                          '${widget.product?.price.toStringAsFixed(2)} ${widget.isArabic ? 'دج' : 'DA'}',
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        textDirection: widget.isArabic ? TextDirection.rtl : TextDirection.ltr,
        children: [
          CustomText(
            text: label,
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          CustomText(
            text: value,
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
    );
  }
}
