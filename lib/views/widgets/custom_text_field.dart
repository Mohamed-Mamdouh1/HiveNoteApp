import 'package:flutter/material.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled(
      {Key? key,
      this.maxLines = 1,
      required this.hintText,
      this.onSaved,
      this.controller,
      this.oldData,
      this.onChanged})
      : super(key: key);
  final TextEditingController? controller;
  final int maxLines;
  final String hintText;
  final void Function(String?)? onSaved;
  final String? oldData;
  final void Function(String?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: oldData,
      style: const TextStyle(color: Colors.white),
      onChanged: onChanged,
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "This field is required";
        } else {
          return null;
        }
      },
      maxLines: maxLines,
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
