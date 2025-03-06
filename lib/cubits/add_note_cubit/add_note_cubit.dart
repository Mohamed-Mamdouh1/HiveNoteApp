import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_note_app/constant.dart';
import 'package:hive_note_app/model/note_model.dart';
import 'package:meta/meta.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  final Box<NoteModel> notesBox;

  AddNoteCubit(this.notesBox) : super(AddNoteInitial());

  addNote(NoteModel note)async{
    emit(AddNoteLoading());
    try {
      notesBox.add(note);
      emit(AddNoteSuccess());
    }  catch (e) {
      debugPrint(e.toString());
      emit(AddNoteFailure(e.toString()));
    }

  }

}
