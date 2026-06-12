import 'package:flutter/material.dart';

class EditSupplierScreen extends StatelessWidget {
  const EditSupplierScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Supplier'),
      ),
      body: const Center(
        child: Text('Edit Supplier Screen'),
      ),
    );
  }
}