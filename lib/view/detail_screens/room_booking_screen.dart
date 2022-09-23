// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously, non_constant_identifier_names, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:hotel_service/view/system_screens/loading_screen.dart';
import 'package:hotel_service/view/components/room/room_booking_body.dart';
import 'package:hotel_service/models/hotel_data_model.dart';
import 'package:hotel_service/models/roomtype_model.dart';
import 'package:hotel_service/data_sources/repositories/hotel/hotel_repository_iml.dart';
import '../components/room/room_booking_appbar.dart';
import '../../data_sources/init.dart';

class RoomBookingScreen extends StatefulWidget {
  const RoomBookingScreen({ Key? key, required this.roomTypeData }) : super(key: key);
  final RoomType roomTypeData;
  
  @override
  _RoomBookingScreenState createState() => _RoomBookingScreenState();
}

class _RoomBookingScreenState extends State<RoomBookingScreen> {
  bool _isLoading = true;
  HotelData hotelData = HotelData();

  @override
  void initState() {
    super.initState();
    getData(widget.roomTypeData.hotel!);
  }

  getData(String id)async{
    hotelData = await HotelRepositoryIml().fetchHotelByID(id);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      appBar: const RoomBookingAppBar(),
      body: _isLoading ? const LoadingScreen() : RoomBookingBody(
        hotelData: hotelData, 
        roomTypeData: widget.roomTypeData,
      )
    );
  }
}
