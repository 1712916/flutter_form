import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    this.minLines,
    this.maxLines,
  }) : super(key: key);

  final TextEditingController controller;
  final int? minLines;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        suffixIconConstraints: const BoxConstraints(
          minHeight: 0.0,
          minWidth: 0.0,
        ),
        hintStyle: const TextStyle(
          fontSize: 16,
          height: 20 / 16,
          fontWeight: FontWeight.w400,
          color: const Color(0xFF6F787E),
        ),
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(4),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      minLines: minLines,
      maxLines: maxLines,
    );
  }
}
