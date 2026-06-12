import 'package:flutter/material.dart';

class SupplierDetailsScreen extends StatelessWidget {
  const SupplierDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Supplier Details'),
      ),
      body: const Center(
        child: Text('Supplier Details Screen'),
      ),
    );
  }
}