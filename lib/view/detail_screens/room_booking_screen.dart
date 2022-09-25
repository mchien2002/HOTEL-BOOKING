// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously, non_constant_identifier_names, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:hotel_service/view/components/room/room_booking_body.dart';
import 'package:hotel_service/models/roomtype_model.dart';
import '../components/room/room_booking_appbar.dart';
import '../../data_sources/init.dart';

class RoomBookingScreen extends StatefulWidget {
  const RoomBookingScreen({ Key? key, required this.roomTypeData, required this.hotelName }) : super(key: key);
  final RoomType roomTypeData;
  final String hotelName;
  @override
  _RoomBookingScreenState createState() => _RoomBookingScreenState();
}

class _RoomBookingScreenState extends State<RoomBookingScreen>{ 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      appBar: const RoomBookingAppBar(),
      body: RoomBookingBody(
        hotelName: widget.hotelName, 
        roomTypeData: widget.roomTypeData,
      )
    );
  }
}
