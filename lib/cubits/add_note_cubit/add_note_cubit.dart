import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_note_app/constant.dart';
import 'package:hive_note_app/model/note_model.dart';
import 'package:meta/meta.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  addNote(NoteModel note)async{
    emit(AddNoteLoading());
    try {
      var notesBox= Hive.box(kNotesBox);
      notesBox.add(note);
      emit(AddNoteSuccess());
    }  catch (e) {
      emit(AddNoteFailure(e.toString()));
    }

  }

}
