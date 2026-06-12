import 'package:flutter/material.dart';

class FavoriteProductScreen extends StatelessWidget {
  const FavoriteProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Product'),
      ),
      body: const Center(
        child: Text('Favorite Product Screen'),
      ),
    );
  }
}