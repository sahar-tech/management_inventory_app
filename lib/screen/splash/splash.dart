import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return /*Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.0,
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
      ),
      body: */ 
      const Center(child: CircularProgressIndicator(color: Colors.white)
      //),
    );
  }
}
