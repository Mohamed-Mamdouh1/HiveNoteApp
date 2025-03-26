import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_note_app/views/widgets/add_note.dart';
import 'package:hive_note_app/views/widgets/note_view_body.dart';

import '../model/note_model.dart';

class NotesView extends StatelessWidget {
  const NotesView({
    Key? key,
    required this.notesBox,
  }) : super(key: key);
  final Box<NoteModel> notesBox;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                context: context,
                builder: (ctx) {
                  return AddNote(
                    notesBox: notesBox,
                  );
                });
          },
        child: const Icon(Icons.add),
      ),
      body: const NoteViewBody(),
    );
  }
}

