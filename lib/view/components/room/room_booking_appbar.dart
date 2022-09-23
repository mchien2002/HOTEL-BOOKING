import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data_sources/init.dart';
import '../../../provider/booking_provider.dart';

class RoomBookingAppBar extends StatelessWidget implements PreferredSizeWidget{
  const RoomBookingAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // BUILD ROOM BOOKING APPBAR
    return AppBar(
      centerTitle: true,
      backgroundColor: colorWhite,
      elevation: 0,
      title: const Text(
        "Thông tin đặt phòng", 
        style: TextStyle(color: Colors.black),
      ),
      leading: InkWell(
        onTap: (){
          Navigator.pop(context);
          context.read<BookingProvider>().clearTextController();
        },
        child: Image.asset(
          "assets/images/img_back.png", 
          scale: 2,
        )
      ),
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}