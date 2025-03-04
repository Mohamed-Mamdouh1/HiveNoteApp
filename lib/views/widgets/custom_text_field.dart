import 'package:flutter/material.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled(
      {Key? key,
      required this.controller,
      this.maxLines = 1,
      required this.hintText,
      this.onSaved})
      : super(key: key);
  final TextEditingController controller;
  final int maxLines;
  final String hintText;
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "This field is required";
        } else {
          return null;
        }
      },
      maxLines: maxLines,
      controller: controller,
      decoration: InputDecoration(
          labelText: hintText,
          labelStyle: const TextStyle(
            color: Colors.cyanAccent,
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
          border:const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff62fcd7))) ,
          errorBorder:const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red)) ,
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff62fcd7)))),
    );
  }
}
