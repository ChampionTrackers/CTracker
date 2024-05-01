import 'package:ctracker/constants/colors.dart';
import 'package:flutter/material.dart';

class ChipButton extends StatefulWidget{
  const ChipButton({
    super.key,
    required this.labelText
  });
  final String labelText;

  @override 
  State<ChipButton> createState() => _ChipButton();
}

class _ChipButton extends State<ChipButton>{
  var _isSelected = false;
  @override
  Widget build(BuildContext context){
    return FilterChip(
      label: Text(widget.labelText),
        labelStyle: TextStyle(color: AppColor.textColor, fontSize: 14.0, fontWeight: FontWeight.bold),
      selected: _isSelected,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        backgroundColor: AppColor.backgroundColor,
        onSelected: (isSelected){
          setState(() {
            _isSelected = isSelected;
          });
        },
        selectedColor: AppColor.primaryColor,
    );
  }
}