import 'package:flutter/material.dart';
class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled(
      {Key? key,
        required this.controller,
        this.maxLines = 1,
        required this.hintText})
      : super(key: key);
  final TextEditingController controller;
  final int maxLines;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return TextField(

      maxLines: maxLines,
      controller: controller,
      decoration: InputDecoration(
          labelText: hintText,
          labelStyle: const TextStyle(
            color: Colors.cyanAccent,
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff62fcd7)))),
    );
  }
}