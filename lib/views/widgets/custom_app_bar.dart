import 'package:flutter/material.dart';

import 'custom_search_icon.dart';
class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key, required this.text, required this.icon}) : super(key: key);
final String text ;
final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: Row(
        children:  [
          Text(
           text,
            style: const TextStyle(fontSize: 28, color: Colors.white),
          ),
          Spacer(),
          CustomSearchIcon(icon:icon,)
        ],
      ),
    );
  }
}