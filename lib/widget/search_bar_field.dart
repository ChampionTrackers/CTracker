import 'package:ctracker/constants/colors.dart';
import 'package:flutter/material.dart';

class SearchBarField extends StatefulWidget{
  const SearchBarField({
    super.key,
    this.keyboardType = TextInputType.text,
    this.hintText = "",
    required this.labelText,
    required this.controller,
  });
  
  final TextInputType keyboardType;
  final String hintText;
  final String labelText;
  final TextEditingController controller;

  @override
  State<SearchBarField> createState() => _SearchBarFieldState();
}

class _SearchBarFieldState extends State<SearchBarField>{
  @override
  Widget build(BuildContext context){
    return TextFormField(
      keyboardType: widget.keyboardType,
      style: const TextStyle(color: AppColor.textColor),    

      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        prefixIconColor: AppColor.secondaryColor,
        hintText: widget.hintText,
        fillColor: AppColor.backgroundColor,
        filled: true,
        labelText: widget.labelText,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelStyle: const TextStyle(color: AppColor.secondaryColor),
        border: const UnderlineInputBorder(            
            borderSide: BorderSide(color: AppColor.primaryColor)),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColor.primaryColor),
        ),
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColor.primaryColor)),
      ),  
    controller: widget.controller,
    );
  }
}