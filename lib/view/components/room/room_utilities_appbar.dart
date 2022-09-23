// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import '../../../data_sources/init.dart';

class RoomUtilitiesAppBar extends StatelessWidget implements PreferredSizeWidget{
  const RoomUtilitiesAppBar({
    Key? key,
    required this.data,
  }) : super(key: key);
  final data;

  @override
  Widget build(BuildContext context) {
    // BUILD UTILITIES APP BAR
    return AppBar(
      centerTitle: true,
      backgroundColor: colorWhite,
      elevation: 0,
      title: Text(
        data.name!, 
        style: const TextStyle(color: Colors.black),
      ),
      actions: [
        IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Image.asset(
            "assets/images/ic_close1.png", 
            scale: 0.8,
          ),
        ),
        const SizedBox(width: 10,),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
