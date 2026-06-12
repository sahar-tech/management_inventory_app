import 'package:flutter/material.dart';

class DeleteSupplierScreen extends StatelessWidget {
  const DeleteSupplierScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delete Supplier'),
      ),
      body: const Center(
        child: Text('Delete Supplier Screen'),
      ),
    );
  }
}