import 'package:flutter/material.dart';

import 'custom_card.dart';
class NotesListView extends StatelessWidget {
  const NotesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(padding:EdgeInsets.zero ,itemBuilder: (context,index)
    {
      return const  CustomCard();
    });
  }
}
