import 'package:flutter/material.dart';

import 'custom_search_icon.dart';
class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: Row(
        children: const [
          Text(
            "Notes",
            style: TextStyle(fontSize: 28, color: Colors.white),
          ),
          Spacer(),
          CustomSearchIcon()
        ],
      ),
    );
  }
}