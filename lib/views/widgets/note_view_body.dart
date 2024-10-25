import 'package:flutter/material.dart';

import 'custom_app_bar.dart';

import 'notes_listview.dart';

class NoteViewBody extends StatelessWidget {
  const NoteViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: const [
          SizedBox(
            height: 20,
          ),
          CustomAppBar(text: "Notes",icon: Icons.search,),
          Expanded(child: NotesListView())
        ],
      ),
    );
  }
}
