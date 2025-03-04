import 'package:flutter/material.dart';

import 'custom_text_field.dart';
final GlobalKey<FormState>formKey=GlobalKey();
AutovalidateMode autoValidateMode= AutovalidateMode.disabled;
class AddNote extends StatefulWidget {

 const AddNote({Key? key}) : super(key: key);

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final TextEditingController title = TextEditingController();

  final TextEditingController content = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AddNoteForm(title: title, content: content),
            const SizedBox(height: 32,),
            CustomButton(
              onPressed: (){
                if(formKey.currentState!.validate())
                {
                  formKey.currentState!.save();
                }else{
                  autoValidateMode=AutovalidateMode.always;
                  setState(() {

                  });

                }
              }, text: 'Add',

            )
          ],
        ),
      ),
    );
  }
}

class AddNoteForm extends StatefulWidget {
   AddNoteForm({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

 late final TextEditingController title;
 late final TextEditingController content;


///////////////////////////////////////////////////////////////////////
  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  String?title,subtitle;
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
            onSaved: (value)
            {
              title= value;
            },
          ),
        const   SizedBox(
            height: 8,
          ),
          CustomTextFiled(
            onSaved: (value)
            {
              subtitle= value;
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

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key, required this.text, required this.onPressed,
  }) : super(key: key);
final String text;
final void Function()onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.cyanAccent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        onPressed:onPressed ,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}


