import 'package:flutter/material.dart';

import 'custom_text_field.dart';

class AddNote extends StatelessWidget {
  final TextEditingController title = TextEditingController();
  final TextEditingController content = TextEditingController();
  AddNote({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                CustomTextFiled(
                  controller: title,
                 hintText: "Title",
                ),
              const   SizedBox(
                  height: 8,
                ),
                CustomTextFiled(
                  controller: content,
                  maxLines: 5,
                  hintText: "Content",
                ),
              ],
            ),
            SizedBox(height: 32,),
            CustomButton(
              onPressed: (){
              }, text: 'Add',

            )
          ],
        ),
      ),
    );
  }
}

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


