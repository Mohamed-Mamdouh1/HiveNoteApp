import 'package:flutter/material.dart';
import 'package:hive_note_app/views/edit_note_view.dart';

import 'custom_card.dart';
class NotesListView extends StatelessWidget {
  const NotesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
     onTap: (){
       Navigator.push(context, MaterialPageRoute(builder: (ctx){
         return EditNoteView();
       }));
     },
      child: ListView.builder(
          padding:EdgeInsets.zero ,itemBuilder: (context,index)
      {
        return const  CustomCard();
      }),
    );
  }
}
