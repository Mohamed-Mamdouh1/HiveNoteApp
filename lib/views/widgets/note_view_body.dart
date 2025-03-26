import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_note_app/cubits/notes_cubit/notes_cubit.dart';

import 'custom_app_bar.dart';

import 'notes_listview.dart';

class NoteViewBody extends StatefulWidget {
  const NoteViewBody({
    Key? key,
  }) : super(key: key);

  @override
  State<NoteViewBody> createState() => _NoteViewBodyState();
}

class _NoteViewBodyState extends State<NoteViewBody> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: const [
          SizedBox(
            height: 20,
          ),
          CustomAppBar(
            text: "Notes",
            icon: Icons.search,
          ),
          Expanded(child: NotesListView())
        ],
      ),
    );
  }
}
