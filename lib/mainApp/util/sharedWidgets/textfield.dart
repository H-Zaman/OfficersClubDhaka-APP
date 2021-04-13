import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final IconData? prefixIcon;

  const CustomTextField({
    Key? key,
    this.controller,
    this.labelText,
    this.prefixIcon
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12)
        ),
        fillColor: Colors.grey.shade200,
        filled: true,
        prefixIcon: prefixIcon != null ? Icon(
          prefixIcon
        ) : null
      ),
    );
  }
}
