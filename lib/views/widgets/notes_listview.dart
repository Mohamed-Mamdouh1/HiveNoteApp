import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_note_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:hive_note_app/model/note_model.dart';
import 'package:hive_note_app/views/edit_note_view.dart';

import 'custom_card.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes =
              BlocProvider.of<NotesCubit>(context).notes ?? [];
          return ListView.builder(
              itemCount: notes.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                      return EditNoteView(
                        noteModel: notes[index],
                      );
                    }));
                  },
                  child: CustomCard(note: notes[index]));
            });
      },
    );
  }
}
