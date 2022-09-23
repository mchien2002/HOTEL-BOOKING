import 'package:flutter/material.dart';
import '../../data_sources/init.dart';

class SearchQuantityAppBar extends StatelessWidget implements PreferredSizeWidget{
  const SearchQuantityAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // BUILD QUANTITY APP BAR
    return AppBar(
      titleSpacing: 0,
      elevation: 0,
      centerTitle: true,
      backgroundColor: colorWhite,
      title: const Text(
        "Số khách & phòng", 
        style: TextStyle(color: Colors.black),
      ), 
      leading: IconButton(
        onPressed: (){
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.close_outlined, 
          color: Colors.black, size: 30,
        ),
      )
    );
  }
  
  @override
  Size get preferredSize {
    return const Size.fromHeight(kToolbarHeight);
  }
}

