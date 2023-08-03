import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final int maxLine;
  const CustomTextField(
      {required this.textEditingController,
      required this.hintText,
      this.maxLine = 1,
      super.key});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      decoration: InputDecoration(
          hintText: hintText,
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black38)),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black38))),
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter your $hintText';
        }
        return null;
      },
      maxLines: maxLine,
    );
  }
}
