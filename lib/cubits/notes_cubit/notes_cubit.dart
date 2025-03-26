import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_note_app/model/note_model.dart';
import 'package:meta/meta.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit(this.notesBox) : super(NotesInitial());
  List<NoteModel>? notes;
  final Box<NoteModel> notesBox;

  fetchAllNotes() {
    notes = notesBox.values.toList();
    emit(NotesSuccess());
  }
}
