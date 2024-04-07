import 'package:flutter/material.dart';

class OAuth extends StatelessWidget {
  final String imagePath;
  final Color borderColor;
  final Color containerColor;
  
  const OAuth({
    Key? key,
    required this.imagePath,
    this.borderColor = Colors.white,
    this.containerColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(10),
        color: containerColor,
      ),
      child: Image.asset(
        imagePath,
        height: 25,),
    );
  }
}
