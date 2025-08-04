import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData prefixIcon;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextAlign textAlign;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.prefixIcon,
    this.obscureText = false, 
    this.keyboardType = TextInputType.text,
    this.textAlign = TextAlign.start, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
    final Color orangeColor = Colors.orange[700]!;
    final Color textFieldFillColor = const Color(0xFF1F1F1F);
    final Color hintTextColor = Colors.grey[600]!;

    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textAlign: textAlign,
      style: const TextStyle(color: Colors.white, fontSize: 16),
      decoration: InputDecoration(
        prefixIcon: Icon(prefixIcon, color: hintTextColor, size: 20),
        hintText: hintText,
        hintStyle: TextStyle(color: hintTextColor, fontSize: 16),
        filled: true,
        fillColor: textFieldFillColor,
        contentPadding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 15.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey[800]!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey[800]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: orangeColor, width: 2),
        ),
      ),
    );
  }
}