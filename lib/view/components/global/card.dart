// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hotel_service/data_sources/init.dart';
import 'package:hotel_service/presenters/hotelid_view_contract.dart';
import 'package:hotel_service/view/components/global/dialog_window.dart';
import 'package:hotel_service/view/detail_screens/room_detail_screen.dart';
import '../../../models/hotel_data_model.dart';

class CardLarge extends StatefulWidget {
  const CardLarge({
    Key? key, required this.hotelData,
  }) : super(key: key);
  // HOTEL'S DATA OF HOTEL MODEL
  final HotelData hotelData;
  
  @override
  State<CardLarge> createState() => _CardLargeState();
}

class _CardLargeState extends State<CardLarge> implements HotelByIDViewContract{
  HotelByIDPresenter? _hotelByIDPresenter;
  bool _isError = false;

  @override
  void initState() {
    super.initState();
    FlutterError.onError = (FlutterErrorDetails detail){
      setState(() {
        _isError = true;
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    // BUILD CARD FOR HOTEL INFOMATION
    return SizedBox(
      width: MediaQuery.of(context).size.width  - 2 * paddingLR,
      height: 450,
      child: Card(
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: InkWell(
          onTap: () => cardPress(widget.hotelData.id!),
          child: Column(
            children: [
              // THIS WIDGET IS BANNER OF HOTEL
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: _isError ? const AssetImage("assets/images/img_error.jpg") as ImageProvider : NetworkImage(widget.hotelData.banner!), 
                        fit: BoxFit.cover
                      ),
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: 250,
                  ),
                  Container(
                    height: 45,
                    width: 45,
                    decoration: const BoxDecoration(
                      color: colorD67402,
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(30)),
                    ),
                    child: const Center(
                      child: Text(
                        "-50%", 
                        style: TextStyle(color: colorWhite, fontWeight: FontWeight.bold),
                      )
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 10 * 2 - 5,
                    alignment: Alignment.centerRight,
                    child: Image.asset(
                      "assets/images/img_icon_like.png", 
                      scale: 2, 
                      color: colorWhite
                    )
                  ),
                ],
              ),
              // THIS WIDGET IS HOTEL INFORMATION
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.hotelData.name!, 
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 13,),
                      Text(
                        widget.hotelData.address!, 
                        style:  const TextStyle(color: color929394),
                      ),
                      const SizedBox(height: 13,),
                      Row(
                        children: [
                          const Text(
                            "Từ:", 
                            style: TextStyle(fontSize: 15, color: color929394),
                          ),
                          const SizedBox(width: 10,),
                          Text(
                            "${oCcy.format(widget.hotelData.currentPrice)} đ".replaceAll(',', ' '), 
                            style: const TextStyle(fontSize: 16, color: Colors.blue),
                          ),
                          const SizedBox(width: 10,),
                          Text(
                            "${oCcy.format(1000000)} đ".replaceAll(',', ' '), 
                            style: const TextStyle(decoration: TextDecoration.lineThrough, color: Colors.grey, fontSize: 15),
                          ),
                        ],
                      ),
                      const SizedBox(height: 13,),
                      const Text(
                        "Dựa vào giá ngày 1/9/2022", 
                        style: TextStyle(fontStyle: FontStyle.italic, color: color929394,)
                      ),
                    ],
                  ),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
  // FUNCTION ENFORCEMENT EVENT WHEN WE CLICK
  void cardPress(String hotelID) async{
    EasyLoading.show();
    _hotelByIDPresenter = HotelByIDPresenter(this);
    _hotelByIDPresenter?.loadHotelID(hotelID);
  }
  
  @override
  onLoadError(String error) {
    EasyLoading.dismiss();
    showDialog(
      context: context, 
      builder: (context) => DialogWindow(code: error)
    );
  }
  
  @override
  onLoadHotelIDComplete(hotelData) {
    EasyLoading.dismiss();
    Navigator.push(
      context, 
      MaterialPageRoute(builder: (context) => RoomDetailScreen(hotelData: hotelData,))
    );
  }
}

