// ignore_for_file: non_constant_identifier_names, library_private_types_in_public_api, deprecated_member_use
import 'package:flutter/material.dart';
import '../../../data_sources/init.dart';

class RoomDetailAttractions extends StatefulWidget {
  const RoomDetailAttractions({Key? key}) : super(key: key);

  @override
  _RoomDetailAttractionsState createState() => _RoomDetailAttractionsState();
}

class _RoomDetailAttractionsState extends State<RoomDetailAttractions> {
  @override
  Widget build(BuildContext context) {
    // BUILD DETAIL ATTRACTION
    return Column(
      children: [
        MapWidget(),
        const SizedBox(
          height: 10,
        ),
        Column(
          children: [
            AttractionsWidget(),
            AttractionsWidget(),
            AttractionsWidget(),
          ],
        )
      ],
    );
  }

  Stack MapWidget() {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          height: 150,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage(
                "assets/images/img_google_map.jpg",
              ),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            bottom: 20,
            right: 10,
          ),
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
    );
  }

  SizedBox AttractionsWidget() {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text("Sun World Hạ Long"),
          Text(
            "3.00 km",
            style: TextStyle(color: color00AC44),
          ),
        ],
      ),
    );
  }
}
