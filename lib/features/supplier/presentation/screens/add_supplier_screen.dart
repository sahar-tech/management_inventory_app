import 'package:flutter/material.dart';
import 'package:management_inventory_app/app/widgets/custom_button.dart';
import 'package:management_inventory_app/app/widgets/custom_input.dart';
import 'package:management_inventory_app/app/widgets/custom_text.dart';

class AddSupplierScreen extends StatelessWidget {
  final bool isArabic;
  final TextEditingController _supplierNameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  AddSupplierScreen({this.isArabic = false, super.key});

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
              // Supplier title
              CustomText(
                text: isArabic ? 'إضافة تفاصيل المورد' : 'Add Supplier Details',
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
                                ? ' اسم المورد'
                                : ' supplier name',
                            controller: _supplierNameController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return isArabic
                                    ? 'يرجى إدخال اسم المورد'
                                    : 'Please enter supplier name';
                              }
                              if (value.contains(' ') ||
                                  value.contains(
                                    RegExp(r'[!@#$%^&*(),.?":{}|<>]'),
                                  )) {
                                return isArabic
                                    ? 'اسم المورد غير صالح'
                                    : 'Invalid supplier name';
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
              // add Supplier Button
              CustomButton(
                customText: CustomText(
                  text: isArabic ? 'إضافة مورد' : 'Add Supplier',
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
              const SizedBox(height: 20),
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
