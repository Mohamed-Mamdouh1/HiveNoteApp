import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_note_app/cubits/add_note_cubit/add_note_cubit.dart';

class ColorsItem extends StatelessWidget {
  const ColorsItem({super.key, required this.isSelected, required this.color});

  final bool isSelected;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? CircleAvatar(
            radius: 40,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 30,
              backgroundColor: color,
            ),
          )
        : CircleAvatar(
            radius: 38,
            backgroundColor: color,
          );
  }
}

class ColorsList extends StatefulWidget {
  const ColorsList({super.key});

  @override
  State<ColorsList> createState() => _ColorsListState();
}

class _ColorsListState extends State<ColorsList> {
  int selectedIndex = 0;
  final List<Color> colorsList = const [
    Color(0xffF06449),
    Color(0xff744253),
    Color(0xffF3D9DC),
    Color(0xffD5FFF3),
    Color(0xffB9FFB7),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.width / 6.5,
        width: double.infinity,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (ctx, index) {
              return InkWell(
                splashColor: Colors.transparent,
                onTap: () {
                  selectedIndex = index;
                  BlocProvider.of<AddNoteCubit>(context).color =
                      colorsList[index];
                  setState(() {});
                },
                child: ColorsItem(
                  isSelected: selectedIndex == index,
                  color: colorsList[index],
                ),
              );
            }),
      ),
    );
  }
}
