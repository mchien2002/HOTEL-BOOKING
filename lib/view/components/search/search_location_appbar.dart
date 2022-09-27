import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'search_box.dart';
import '../../../data_sources/init.dart';

class SearchLocationAppBar extends StatelessWidget implements PreferredSizeWidget{
  const SearchLocationAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // SEARCH LOCATION APP BAR
      backgroundColor: colorWhite,
      titleSpacing: 0,
      toolbarHeight: 50,
      leading: InkWell(
        onTap: () => Get.back(),
        child: SizedBox(
          width: 100,
          child: Image.asset(
            "assets/images/img_back.png", 
            color: const Color.fromARGB(255, 204, 201, 201), 
            scale: 2,
          )
        ),
      ),
      title:  Container(
        padding: const EdgeInsets.only(right: 20),
        child: const SizedBox(
          height: 40,
          child: SearchBox(title: "Tìm kiếm điểm đến, hoạt động")
        ),
      ),
      elevation: 0,
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}