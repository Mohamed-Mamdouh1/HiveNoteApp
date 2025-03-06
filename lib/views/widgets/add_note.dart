import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_note_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:hive_note_app/model/note_model.dart';


import 'custom_button.dart';
import 'custom_text_field.dart';

final GlobalKey<FormState> formKey = GlobalKey();
AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

class AddNote extends StatefulWidget {
  const AddNote({Key? key, required this.notesBox}) : super(key: key);
  final Box<NoteModel> notesBox;
  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final TextEditingController title = TextEditingController();

  final TextEditingController content = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(widget.notesBox),
      child: Container(
        padding: EdgeInsets.only(
            left: 18,
            right: 18,
            top: 18,
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: BlocConsumer<AddNoteCubit, AddNoteState>(
          listener: (context, state) {
            if (state is AddNoteFailure) {
              print("Failed to add note ");
            }
            if (state is AddNoteSuccess) {
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            return AbsorbPointer(
              absorbing: state is AddNoteLoading ? true :false,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AddNoteForm(title: title, content: content),
                    const SizedBox(
                      height: 32,
                    ),
                    BlocBuilder<AddNoteCubit, AddNoteState>(
                      builder: (context, state) {
                        return CustomButton(
                          isLoading:  state is AddNoteLoading ? true : false,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();

                              var noteModel = NoteModel(
                                  title: title.text,
                                  content: content.text,
                                  date: DateTime.now().toString(),
                                  color: Colors.deepPurpleAccent.value);
                              BlocProvider.of<AddNoteCubit>(context)
                                  .addNote(noteModel);
                            } else {
                              autoValidateMode = AutovalidateMode.always;
                              setState(() {});
                            }
                          },
                          text: 'Add',
                        );
                      },
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  final TextEditingController title;
  final TextEditingController content;

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  String? title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: Column(
        children: [
          CustomTextFiled(
            controller: widget.title,
            hintText: "Title",
            onSaved: (value) {
              title = value;
            },
          ),
          const SizedBox(
            height: 8,
          ),
          CustomTextFiled(
            onSaved: (value) {
              subtitle = value;
            },
            controller: widget.content,
            maxLines: 5,
            hintText: "Content",
          ),
        ],
      ),
    );
  }
}
