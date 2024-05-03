import 'package:flutter/material.dart';

class OAuth extends StatelessWidget {
  final String imagePath;
  final Color borderColor;
  final Color containerColor;
  
  const OAuth({
    super.key,
    required this.imagePath,
    this.borderColor = Colors.white,
    this.containerColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(10),
        color: containerColor,
      ),
      child: Image.asset(
        imagePath,
        height: 18,),
    );
  }
}
