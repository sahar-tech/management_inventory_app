import 'package:flutter/material.dart';
import 'package:management_inventory_app/app/widgets/custom_button.dart';
import 'package:management_inventory_app/app/widgets/custom_input.dart';
import 'package:management_inventory_app/app/widgets/custom_text.dart';

class AddProductScreen extends StatelessWidget {
  final bool isArabic;
  final TextEditingController _productNameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  AddProductScreen({this.isArabic = false, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:
          MediaQuery.of(context).size.height * 0.9, // Adjust height as needed

      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Product title
              CustomText(
                text: isArabic ? 'إضافة تفاصيل المنتج' : 'Add Details Product',
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                textAlign: TextAlign.center,
              ),
              // Scrollable Form
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40.0),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CustomInput(
                            hintText: isArabic
                                ? ' اسم المنتج'
                                : ' product name',
                            controller: _productNameController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return isArabic
                                    ? 'يرجى إدخال اسم المنتج'
                                    : 'Please enter product name';
                              }
                              if (value.contains(' ') ||
                                  value.contains(
                                    RegExp(r'[!@#$%^&*(),.?":{}|<>]'),
                                  )) {
                                return isArabic
                                    ? 'اسم المنتج غير صالح'
                                    : 'Invalid product name';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          CustomInput(
                            hintText: isArabic
                                ? ' سعر المنتج'
                                : ' product price',
                            controller: null,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return isArabic
                                    ? 'يرجى إدخال سعر المنتج'
                                    : 'Please enter product price';
                              }
                              if (value.contains(
                                RegExp(r'[!@#$%^&*(),.?":{}|<>]'),
                              )) {
                                return isArabic
                                    ? 'سعر المنتج غير صالح'
                                    : 'Invalid product price';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          CustomInput(
                            hintText: isArabic
                                ? ' سعر المنتج'
                                : ' product price',
                            controller: null,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return isArabic
                                    ? 'يرجى إدخال سعر المنتج'
                                    : 'Please enter product price';
                              }
                              if (value.contains(
                                RegExp(r'[!@#$%^&*(),.?":{}|<>]'),
                              )) {
                                return isArabic
                                    ? 'سعر المنتج غير صالح'
                                    : 'Invalid product price';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          CustomInput(
                            hintText: isArabic
                                ? ' سعر المنتج'
                                : ' product price',
                            controller: null,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return isArabic
                                    ? 'يرجى إدخال سعر المنتج'
                                    : 'Please enter product price';
                              }
                              if (value.contains(
                                RegExp(r'[!@#$%^&*(),.?":{}|<>]'),
                              )) {
                                return isArabic
                                    ? 'سعر المنتج غير صالح'
                                    : 'Invalid product price';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          CustomInput(
                            hintText: isArabic
                                ? ' سعر المنتج'
                                : ' product price',
                            controller: null,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return isArabic
                                    ? 'يرجى إدخال سعر المنتج'
                                    : 'Please enter product price';
                              }
                              if (value.contains(
                                RegExp(r'[!@#$%^&*(),.?":{}|<>]'),
                              )) {
                                return isArabic
                                    ? 'سعر المنتج غير صالح'
                                    : 'Invalid product price';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          CustomInput(
                            hintText: isArabic
                                ? ' سعر المنتج'
                                : ' product price',
                            controller: null,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return isArabic
                                    ? 'يرجى إدخال سعر المنتج'
                                    : 'Please enter product price';
                              }
                              if (value.contains(
                                RegExp(r'[!@#$%^&*(),.?":{}|<>]'),
                              )) {
                                return isArabic
                                    ? 'سعر المنتج غير صالح'
                                    : 'Invalid product price';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          CustomInput(
                            hintText: isArabic
                                ? ' سعر المنتج'
                                : ' product price',
                            controller: null,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return isArabic
                                    ? 'يرجى إدخال سعر المنتج'
                                    : 'Please enter product price';
                              }
                              if (value.contains(
                                RegExp(r'[!@#$%^&*(),.?":{}|<>]'),
                              )) {
                                return isArabic
                                    ? 'سعر المنتج غير صالح'
                                    : 'Invalid product price';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          CustomInput(
                            hintText: isArabic
                                ? ' سعر المنتج'
                                : ' product price',
                            controller: null,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return isArabic
                                    ? 'يرجى إدخال سعر المنتج'
                                    : 'Please enter product price';
                              }
                              if (value.contains(
                                RegExp(r'[!@#$%^&*(),.?":{}|<>]'),
                              )) {
                                return isArabic
                                    ? 'سعر المنتج غير صالح'
                                    : 'Invalid product price';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          CustomInput(
                            hintText: isArabic
                                ? ' سعر المنتج'
                                : ' product price',
                            controller: null,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return isArabic
                                    ? 'يرجى إدخال سعر المنتج'
                                    : 'Please enter product price';
                              }
                              if (value.contains(
                                RegExp(r'[!@#$%^&*(),.?":{}|<>]'),
                              )) {
                                return isArabic
                                    ? 'سعر المنتج غير صالح'
                                    : 'Invalid product price';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          CustomInput(
                            hintText: isArabic
                                ? ' سعر المنتج'
                                : ' product price',
                            controller: null,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return isArabic
                                    ? 'يرجى إدخال سعر المنتج'
                                    : 'Please enter product price';
                              }
                              if (value.contains(
                                RegExp(r'[!@#$%^&*(),.?":{}|<>]'),
                              )) {
                                return isArabic
                                    ? 'سعر المنتج غير صالح'
                                    : 'Invalid product price';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // add Product Button
              CustomButton(
                customText: CustomText(
                  text: isArabic ? 'إضافة منتج' : 'Add Product',
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
              SizedBox(height: 20),
              // Cancel Button
              CustomButton(
                customText: CustomText(
                  text: isArabic ? 'إلغاء' : 'Cancel',
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
