import 'package:ctracker/constants/colors.dart';
import 'package:flutter/material.dart';

class FormTextField extends StatefulWidget {
  const FormTextField({
    super.key,
    this.keyboardType = TextInputType.text,
    this.hintText = "",
    required this.labelText,
    required this.controller,
    this.passwordField = false,
  });

  final bool passwordField;
  final TextInputType keyboardType;
  final String hintText;
  final String labelText;
  final TextEditingController controller;

  @override
  State<FormTextField> createState() => _FormTextFieldState();
}

class _FormTextFieldState extends State<FormTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboardType,
      style: const TextStyle(color: AppColor.textColor),
      obscureText: widget.passwordField,
      enableSuggestions: !widget.passwordField,
      autocorrect: !widget.passwordField,
      decoration: InputDecoration(
        hintText: widget.hintText,
        fillColor: AppColor.tertiaryColor,
        filled: true,
        labelText: widget.labelText,
        labelStyle: const TextStyle(color: AppColor.secondaryColor),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.transparent)),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: AppColor.primaryColor),
        ),
        enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.transparent)),
      ),
      controller: widget.controller,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Preencha o campo!';
        }
        return null;
      },
    );
  }
}
