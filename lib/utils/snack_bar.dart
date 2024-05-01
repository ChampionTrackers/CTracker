import 'package:flutter/material.dart';

void snackBar(context, text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
}