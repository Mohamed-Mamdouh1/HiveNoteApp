import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_note_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:hive_note_app/model/note_model.dart';
import 'package:hive_note_app/views/widgets/custom_app_bar.dart';
import 'package:hive_note_app/views/widgets/custom_text_field.dart';

class EditNoteView extends StatefulWidget {
  const EditNoteView({Key? key, required this.noteModel}) : super(key: key);
  final NoteModel noteModel;

  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  String? title, content;
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
            CustomAppBar(
              text: "Edit Note",
              icon: Icons.done,
              onTap: () {
                widget.noteModel.title = title ?? widget.noteModel.title;
                widget.noteModel.content = content ?? widget.noteModel.content;
                widget.noteModel.save();
                BlocProvider.of<NotesCubit>(context).fetchAllNotes();

                Navigator.pop(context);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFiled(
              onChanged: (value) {
                title = (value ?? "").isEmpty ? "No Title" : value;
                print(value);
              },
              hintText: "Title",
              oldData: widget.noteModel.title,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFiled(
              onChanged: (value) {
                content = (value ?? "").isEmpty ? "No Content" : value;
              },
              hintText: "Content",
              maxLines: 4,
              oldData: widget.noteModel.content,
            ),
          ],
        ),
      ),
    );
  }
}
