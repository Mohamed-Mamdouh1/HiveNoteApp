import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_note_app/bloc_observer.dart';
import 'package:hive_note_app/constant.dart';
import 'package:hive_note_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:hive_note_app/model/note_model.dart';
import 'package:hive_note_app/views/notes_view.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 96, 59, 181),
);
void main() async {
 await Hive.initFlutter();
 Bloc.observer= SBlocObserver();
 Hive.registerAdapter(NoteModelAdapter());
 await Hive.openBox(kNotesBox);
  runApp(const HiveNotes());
}

class HiveNotes extends StatelessWidget {
  const HiveNotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        cardTheme: const CardTheme().copyWith(

            color: kColorScheme.secondaryContainer,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: kColorScheme.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            color: kColorScheme.onPrimaryContainer,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const NotesView(),
    );
  }
}
