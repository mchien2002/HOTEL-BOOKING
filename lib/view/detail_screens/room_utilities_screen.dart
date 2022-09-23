// ignore_for_file: non_constant_identifier_names, library_private_types_in_public_api, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:hotel_service/view/components/room/room_utilities_body.dart';
import '../components/room/room_utilities_appbar.dart';

class RoomUtilitiesScreen extends StatefulWidget {
  const RoomUtilitiesScreen({ Key? key, required this.data}) : super(key: key);
  final data;
  @override
  _RoomUtilitiesScreenState createState() => _RoomUtilitiesScreenState();
}

class _RoomUtilitiesScreenState extends State<RoomUtilitiesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      appBar: RoomUtilitiesAppBar(data: widget.data),
      body: RoomUtilitiesBody(data: widget.data,),
    );  
  }
}

