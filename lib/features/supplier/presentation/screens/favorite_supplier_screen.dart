import 'package:flutter/material.dart';

class FavoriteSupplierScreen extends StatelessWidget {
  const FavoriteSupplierScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Supplier'),
      ),
      body: const Center(
        child: Text('Favorite Supplier Screen'),
      ),
    );
  }
}