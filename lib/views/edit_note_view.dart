import 'package:flutter/material.dart';
import 'package:hive_note_app/views/widgets/custom_app_bar.dart';
import 'package:hive_note_app/views/widgets/custom_text_field.dart';

class EditNoteView extends StatelessWidget {
  EditNoteView({Key? key}) : super(key: key);
  final TextEditingController newTitle = TextEditingController();
  final TextEditingController newContent = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const CustomAppBar(
              text: "Edit Note",
              icon: Icons.done,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFiled(controller: newTitle, hintText: "Title"),
            const SizedBox(
              height: 20,
            ),
            CustomTextFiled(
              controller: newContent,
              hintText: "Content",
              maxLines: 4,
            ),
          ],
        ),
      ),
    );
  }
}
