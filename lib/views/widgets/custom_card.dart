import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_note_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:hive_note_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:hive_note_app/model/note_model.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    required this.note,
  }) : super(key: key);
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(note.color),
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    note.title,
                    style: Theme.of(context).textTheme.titleLarge,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    note.content,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontSize: 16, fontWeight: FontWeight.w300),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        note.delete();
                        BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.black,
                      )),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    note.date,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontSize: 16, fontWeight: FontWeight.w300),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hive_note_app/cubits/notes_cubit/notes_cubit.dart';
// import 'package:hive_note_app/model/note_model.dart';
//
//
// class CustomCard extends StatefulWidget {
//   const CustomCard({Key? key, required this.note}) : super(key: key);
//   final NoteModel note;
//
//   @override
//   State<CustomCard> createState() => _CustomCardState();
// }
//
// class _CustomCardState extends State<CustomCard> {
//   bool isSnapped = false;
//
//   void _snapEffect() {
//     setState(() {
//       isSnapped = true;
//     });
//     Future.delayed(const Duration(milliseconds: 1000), () {
//      widget.note.delete();
//       if (mounted) {
//         BlocProvider.of<NotesCubit>(context).fetchAllNotes();
//       }   });
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedOpacity(
//       duration: const Duration(milliseconds: 800),
//       opacity: isSnapped ? 0.0 : 1.0,
//       child: Card(
//         child: SizedBox(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               SizedBox(
//                 width: 100,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       widget.note.title,
//                       style: Theme.of(context).textTheme.titleLarge,
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                     const SizedBox(height: 20),
//                     Text(
//                       widget.note.content,
//                       overflow: TextOverflow.ellipsis,
//                       maxLines: 2,
//                       style: Theme.of(context)
//                           .textTheme
//                           .titleLarge
//                           ?.copyWith(fontSize: 16, fontWeight: FontWeight.w300),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     IconButton(
//                       onPressed: _snapEffect,
//                       icon: const Icon(
//                         Icons.delete,
//                         color: Colors.black,
//                       ),
//                     ),
//                     const SizedBox(height: 40),
//                     Text(
//                       widget.note.date,
//                       style: Theme.of(context)
//                           .textTheme
//                           .titleLarge
//                           ?.copyWith(fontSize: 16, fontWeight: FontWeight.w300),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
