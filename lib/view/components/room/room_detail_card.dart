// ignore_for_file: deprecated_member_use, library_private_types_in_public_api, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_service/presenters/hotelid_view_contract.dart';
import 'package:hotel_service/view/detail_screens/room_booking_screen.dart';
import 'package:hotel_service/view/detail_screens/room_utilities_screen.dart';
import '../../../data_sources/init.dart';
import '../../../models/facilities_model.dart';
import '../../../models/roomtype_model.dart';
import '../global/dialog_window.dart';

class RoomCardItem extends StatefulWidget {
  const RoomCardItem({ Key? key, required this.roomTypeData,}) : super(key: key);
  final RoomType roomTypeData;
  
  @override
  _RoomCardItemState createState() => _RoomCardItemState();
}

class _RoomCardItemState extends State<RoomCardItem> implements HotelByIDViewContract{
  bool moreBtn = true;
  HotelByIDPresenter? _hotelByIDPresenter;

  @override
  Widget build(BuildContext context) {
    // BUILD ROOM  CARD
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      child: Container(
        padding: const EdgeInsets.all(10),
        height: moreBtn ? 310 : 160,
        child: Column(
          children: [
            DetailCardBody(
              widget.roomTypeData.photos![0], 
              widget.roomTypeData.name!, 
              widget.roomTypeData.numberOfBed!, 
              "2m3", 
              widget.roomTypeData.facilities!
            ),
            const SizedBox(height: 20,),
            DetailCardPrice(4000000),
            moreBtn ? const SizedBox(height: 20,) : const SizedBox(),
            moreBtn ? DetailCardBooking(widget.roomTypeData.currentPrice!) : Container(),
          ],
        ),
      ),
    );
  }

  Widget DetailCardBooking(int discount) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text("Deluxe 2 giường đơn", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, height: 1.3)),
              Text("Đã bao gồm ăn sáng", style: TextStyle(height: 1.5, fontSize: 12),),
              Text("Miễn phí hủy (Có thời hạn)", style: TextStyle(height: 1.5, fontSize: 12)),
              Text("Không hoàn tiền", style: TextStyle(height: 1.5, fontSize: 12)),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text("2 080 000 đ", style: TextStyle(height: 1.5, decoration: TextDecoration.lineThrough, color: Colors.grey)),
              Text("${oCcy.format(discount)} đ".replaceAll(',', ' '), style: const TextStyle(height: 1.5, fontSize: 17, color: colorD67402)),
              const Text("Mỗi đêm", style: TextStyle(height: 1.5, fontSize: 12)),
              const SizedBox(height: 10,),
              SizedBox(
                width: 100,
                height: 40,
                child: RaisedButton(
                  onPressed: () => switchBookingScreen(),
                  color: color00AC44,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                  child: const Center(child: Text("Đặt ngay", style: TextStyle(color: colorWhite, fontSize: 15),)),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget DetailCardPrice(int cost) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Text("Giá chỉ từ: "),
        Text(oCcy.format(cost).toString().replaceAll(',', ' '), style: const TextStyle(color: colorD67402, fontSize: 20),),
        const Text(" đ/đêm"),
        const SizedBox(width: 10,),
        SizedBox(
          width: 20,
          height: 18,
          child: RaisedButton(
            color: moreBtn == false ? colorD67402 : colorWhite,
            padding: const EdgeInsets.all(0),
            onPressed: () {
              if (moreBtn) {
                setState(() {
                moreBtn = false;
              });
              } else {
                setState(() {
                moreBtn = true;
              });
              }
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: const BorderSide(color: colorD67402, width: 2),
            ),
            child: Center(child: Image.asset(moreBtn ? "assets/images/img_icon_up.png" : "assets/images/img_icon_down.png"),),
          ),
        ),
      ],
    );
  }

  Widget DetailCardBody(String imgUrl, String title, String numBerOfBed, String bedSize, List<Facilities> utilities, ) {
    return Row(children: [
      Container(
        height: 90,
        width: 100,
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(imgUrl),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(10)
        ),
      ),
      const SizedBox(width: 10,),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset("assets/images/img_icon_bed.png", scale: 1.9,),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .4,
                      child: Text(numBerOfBed, style: const TextStyle(fontSize: 11), overflow: TextOverflow.ellipsis,)
                    ),
                  ],
                ),
                Row(
                  children: [
                    Image.asset("assets/images/img_icon_bed.png", scale: 1.9,),
                    Text(bedSize, style: const TextStyle(fontSize: 11)),
                  ],
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.network(utilities[0].image!,),
                    const SizedBox(width: 10,),
                    SvgPicture.network(utilities[1].image!,),
                    const SizedBox(width: 10,),
                    SvgPicture.network(utilities[2].image!,),
                    const SizedBox(width: 10,),
                  ],
                ),
                InkWell(
                  onTap: () => showMoreBtn(),
                  child: const Text("Xem tất cả tiện nghi", style: TextStyle(fontSize: 11, color: colorPrimary))
                ),
              ],
            ),
          ],
        ),
      )
    ],);
  }

  switchBookingScreen(){
  showDialog(
    context: context, 
    builder: (context) => const SpinKitThreeInOut(color: colorB2B2B2,)
  );    _hotelByIDPresenter = HotelByIDPresenter(this);
    _hotelByIDPresenter!.loadHotelID(widget.roomTypeData.hotel!);
  }

  showMoreBtn(){
    Navigator.push(
      context, 
      MaterialPageRoute(builder: (context) => RoomUtilitiesScreen(data: widget.roomTypeData))
    );
  }
  
 @override
  onLoadError(String error) {
  Navigator.pop(context);
    showDialog(
      context: context, 
      builder: (context) => DialogWindow(code: error)
    );
  }
  
  @override
  onLoadHotelIDComplete(hotelData) {
  Navigator.pop(context);
    Navigator.push(
      context, 
      MaterialPageRoute(builder: (context) => RoomBookingScreen(roomTypeData: widget.roomTypeData, hotelName: hotelData.name,))
    );
  }
}