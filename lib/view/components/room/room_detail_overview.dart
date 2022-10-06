// ignore_for_file: deprecated_member_use, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_service/data_sources/routes.dart';
import 'package:hotel_service/models/hotel_data_model.dart';
import 'package:hotel_service/view/detail_screens/room_utilities_screen.dart';
import '../../../data_sources/init.dart';
import '../../../models/roomtype_model.dart';
import '../global/rating_star.dart';

class RoomDetailOverview extends StatefulWidget {
  const RoomDetailOverview({
    Key? key,
    required this.hotelData,
    required this.listRoomData,
  }) : super(key: key);
  final HotelData hotelData;
  final List<RoomType> listRoomData;

  @override
  State<RoomDetailOverview> createState() => _RoomDetailOverviewState();
}

class _RoomDetailOverviewState extends State<RoomDetailOverview> {
  @override
  Widget build(BuildContext context) {
    // BUILD OVERVIEW ABOUT HOTEL WIDGET
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DetailTitle(widget.hotelData.name!),
        const SizedBox(
          height: 10,
        ),
        DetailFeedback(widget.hotelData.ratings!),
        const SizedBox(
          height: 10,
        ),
        DetailContact(widget.hotelData.city!.name!),
        const SizedBox(
          height: 10,
        ),
        DetailInfo(context, widget.hotelData.address!),
        const SizedBox(
          height: 10,
        ),
        DetailDescribe(widget.hotelData.description!),
      ],
    );
  }

  Widget DetailDescribe(String describe) {
    return Column(
      children: [
        const SizedBox(
            width: double.infinity,
            child: Text(
              "Mô tả",
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
        const SizedBox(
          height: 10,
        ),
        Text(
          describe,
          textAlign: TextAlign.justify,
          style: const TextStyle(height: 1.6),
        ),
        const SizedBox(
          height: 10,
        ),
        InkWell(
            onTap: () => buildPress(),
            child: const Text("Xem thêm",
                style: TextStyle(fontSize: 13, color: color0E66AC)))
      ],
    );
  }

  Widget DetailInfo(BuildContext context, String address) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * .5 - paddingLR * 1.5,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 238, 236, 236)),
          child: Container(
            padding: const EdgeInsets.all(10),
            height: 200,
            alignment: Alignment.centerLeft,
            child: Column(
              children: [
                const SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Tiện Nghi",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                UtilitieWidget(
                    "Phòng tủ/quần áo", "assets/images/img_icon_wardrobe.png"),
                UtilitieWidget(
                    "Ga trải giường, gối", "assets/images/img_icon_bed2.png"),
                UtilitieWidget(
                    "Liên hệ hổ trợ", "assets/images/img_icon_phone.png"),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () => buildPress(),
                  child: const SizedBox(
                      width: double.infinity,
                      child: Text("Xem thêm",
                          style: TextStyle(fontSize: 13, color: color0E66AC))),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * .5 - 1.5 * paddingLR,
          height: 200,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 238, 236, 236),
              borderRadius: BorderRadius.circular(10)),
          child: Container(
            padding: const EdgeInsets.all(10),
            height: 200,
            alignment: Alignment.centerLeft,
            child: Column(children: [
              const SizedBox(
                width: double.infinity,
                child: Text(
                  "Địa điểm",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                address,
                style: const TextStyle(fontSize: 12),
              )
            ]),
          ),
        ),
      ],
    );
  }

  Widget UtilitieWidget(String title, String iconUrl) {
    return Row(
      children: [
        Image.asset(
          iconUrl,
          scale: 2,
          color: Colors.black,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(title, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget DetailContact(String cityName) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  "assets/images/img_icon_location.png",
                  scale: 1.5,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(cityName),
              ],
            ),
            SizedBox(
              width: 90,
              height: 30,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                onPressed: () {},
                color: Colors.black,
                child: const Text(
                  "Mở Bản Đồ",
                  style: TextStyle(color: colorWhite, fontSize: 10),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Image.asset(
              "assets/images/img_icon_phone.png",
              scale: 1.5,
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              "Liên hệ hổ trợ",
              style: TextStyle(color: colorFF6F15),
            ),
          ],
        ),
      ],
    );
  }

  Widget DetailFeedback(int rate) {
    return Row(
      children: [
        Text(rate.toString()),
        const SizedBox(
          width: 20,
        ),
        RatingStarWidget(
          rate: rate.toDouble(),
        ),
      ],
    );
  }

  Widget DetailTitle(String hotelName) {
    return Text(
      hotelName,
      style: const TextStyle(
          color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  void buildPress() {
    Get.toNamed(RoutesClass.getUtilitiesRoute(widget.hotelData.id!),
        arguments: RoomUtilitiesScreen(data: widget.hotelData));
  }
}
