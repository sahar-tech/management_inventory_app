import 'package:flutter/material.dart';

class DeleteProductScreen extends StatelessWidget {
  const DeleteProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delete Product'),
      ),
      body: const Center(
        child: Text('Delete Product Screen'),
      ),
    );
  }
}