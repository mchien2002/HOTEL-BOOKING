// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hotel_service/data_sources/init.dart';
import 'package:hotel_service/data_sources/repositories/local/local_storage_repository_iml.dart';
import '../../../models/hotel_data_model.dart';
import '../../detail_screens/room_detail_screen.dart';

class CardMiniItem extends StatefulWidget {
  const CardMiniItem({
    Key? key, required this.hotelData
  }) : super(key: key);
  // HOTEL'S DATA OF HOTEL MODEL
  final HotelData hotelData;

  @override
  State<CardMiniItem> createState() => _CardMiniItemState();
}

class _CardMiniItemState extends State<CardMiniItem> {
  final LocalStorageRepositoryIml _localStorageRepository = LocalStorageRepositoryIml();
   
  @override
  Widget build(BuildContext context) {
    // BUILD CARD MINI FOR HOTEL INFORMATION
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0)
      ),
      elevation: 0,
      child: InkWell(
        onTap: () => cardPress(widget.hotelData),
        child: Column(
          children: [
            // THIS WIDGET IS BANNER OF CARD
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.hotelData.banner!),
                      fit: BoxFit.cover
                    )
                  ),
                  width: MediaQuery.of(context).size.width / 2,
                  height: 150,
                ),
                Container(
                  alignment: Alignment.topRight,
                  width: MediaQuery.of(context).size.width / 2,
                  child: Image.asset(
                    "assets/images/img_icon_like.png", 
                    scale: 2, 
                    color: colorWhite,
                  )
                )
              ],
            ),
            // THIS WIDGET IS HOTEL INFORMATION
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      widget.hotelData.name!, 
                      style: const TextStyle(
                        fontSize: 13, 
                        fontWeight: FontWeight.w900, 
                        letterSpacing: 1
                      ),
                    )
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                    child: Row(
                      children: [
                        const Text(
                          "Từ:", 
                          style: TextStyle(fontSize: 13, color: color929394),
                        ),
                        const SizedBox(width: 3,),
                        Text(
                          "${oCcy.format(widget.hotelData.currentPrice)} đ".replaceAll(',', ' '), 
                          style: const TextStyle(fontSize: 15, color: Colors.black),
                        ),
                        const SizedBox(width: 3,),
                      ],
                    )
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  // FUNCTION ENFORCEMENT EVENT WHEN WE CLICK
  void cardPress(HotelData hotelData) async{
    Box box = await _localStorageRepository.openBox(LocalStorageRepositoryIml.boxHotel);
    _localStorageRepository.addData(box, hotelData);
    Navigator.push(
      context, 
      MaterialPageRoute(builder: (context) => RoomDetailScreen(idHotel: widget.hotelData.id!,))
    );
  }
}