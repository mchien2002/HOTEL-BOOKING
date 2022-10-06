// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import '../../../data_sources/init.dart';

class RoomDetailPolicy extends StatelessWidget {
  const RoomDetailPolicy({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // BUILD POLICY OF HOTEL
    return Container(
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 226, 225, 225),
      ),
      child: Row(
        children: [
          PolicyWidget(context, "Nhận phòng", "Từ 14:00", false),
          PolicyWidget(context, "Trả phòng", "Trước 12:00", true),
        ],
      ),
    );
  }

  Widget PolicyWidget(
      BuildContext context, String policy, String time, bool right) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.of(context).size.width * .5 - paddingLR,
      decoration: BoxDecoration(
        border: right
            ? const Border(
                left: BorderSide(
                    width: 0.5, color: Color.fromARGB(255, 196, 193, 193)))
            : const Border(
                right: BorderSide(
                    width: 0.5, color: Color.fromARGB(255, 196, 193, 193))),
      ),
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(policy),
          Text(
            time,
            style: const TextStyle(
                fontWeight: FontWeight.w500, height: 1.5, fontSize: 15),
          ),
        ]),
      ),
    );
  }
}
