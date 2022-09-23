// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:hotel_service/data_sources/init.dart';
import 'package:hotel_service/models/hotel_data_model.dart';
import 'package:hotel_service/models/roomtype_model.dart';
import 'package:hotel_service/providers/search_provider.dart';
import 'package:provider/provider.dart';
import '../global/title.dart';

class RoomBookingRequest extends StatefulWidget {
  const RoomBookingRequest({
    Key? key, required this.hotelData, required this.roomType,
  }) : super(key: key);
  final HotelData hotelData;
  final RoomType roomType;

  @override
  State<RoomBookingRequest> createState() => _RoomBookingRequestState();
}

class _RoomBookingRequestState extends State<RoomBookingRequest> {
  bool showMore = true;

  @override
  Widget build(BuildContext context) {
    // BUILD ROOM BOOKING REQUEST
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleWidget(title: "Yêu cầu đặt phòng"),
        Text(
          widget.hotelData.name!, 
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        TimeBooking(),
        const Text(
          "(3 ngày 2 đêm)", 
          style: TextStyle(height: 1.5, color: color777777),
        ),
        const SizedBox(height: 20,),
        RoomInfo(context),
      ],
    );
  }

  Widget RoomInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Thông tin phòng",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            InkWell(
              onTap: (() {
                if (showMore){
                  setState(() {
                    showMore = false;
                  });
                }
                else{
                  setState(() {
                    showMore = true;
                  });
                }
              }),
              child: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: colorB2B2B2, width: 1.5)
                ),
                child: Image.asset(
                  showMore ? "assets/images/img_mg_icon_subtract.png" : "assets/images/ic_plus.png",
                  scale: .1,
                ),
              ),
            )
          ],
        ),
        showMore ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.roomType.name!, 
              style: const TextStyle(height: 1.5, color: color777777),
            ),
            Text(
              widget.roomType.numberOfBed!, 
              style: const TextStyle(height: 1.5, color: color777777),
            ),
            Text(
              "Dành cho ${context.watch<SearchProvider>().rooms[1]} người lớn và ${context.watch<SearchProvider>().rooms[2]} trẻ em", 
              style: const TextStyle(height: 1.5, color: color777777),
            ),
            const Text(
              "Miễn phí bữa sáng", 
              style: TextStyle(height: 1.5, color: color777777),
            ),
            const Text(
              "Hủy miễn phí (có thời hạn)", 
              style: TextStyle(height: 1.5, color: color777777),
            ),
            const Text(
              "Không hoàn tiền", 
              style: TextStyle(height: 1.5, color: color777777),
            ),
            const InkWell(
              child: Text(
                "Xem thêm", 
                style: TextStyle(height: 2, color: colorPrimary,),
              )
            ),
            const SizedBox(height: 20,),
          ],
        ) : Container(),
      ],
    );
  }

  Widget TimeBooking() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Nhận phòng: ", 
              style: TextStyle(height: 1.5),
            ),
            Text(
              "Trả phòng: ", 
              style: TextStyle(height: 1.5),
            ),
          ],
        ),
        const SizedBox(width: 40,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "18/7/2022 từ ${widget.roomType.rooms![0].price!.checkinTime}", 
              style: const TextStyle(height: 1.5),
            ),
            Text(
              "20/7/2022 từ ${widget.roomType.rooms![0].price!.checkoutTime}", 
              style: const TextStyle(height: 1.5),
            ),
          ],
        )
      ],
    );
  }
}

