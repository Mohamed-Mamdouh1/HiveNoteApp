import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key, required this.text, required this.onPressed,
  }) : super(key: key);
  final String text;
  final void Function()onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.cyanAccent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        onPressed:onPressed ,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}