// ignore_for_file: non_constant_identifier_names, deprecated_member_use
import 'package:flutter/material.dart';
import '../../../data_sources/init.dart';

class RoomDetailSupport extends StatelessWidget {
  const RoomDetailSupport({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // BUILD SUPPORT CENTER OF HOTEL
    return Column(
      children: [
        const Text(
          "Bạn Thắc mắc về dịch vụ này? Chat với Sàn du lịch nhé!",
          style: TextStyle(fontSize: 15),
        ),
        const SizedBox(height: 10),
        ButtonRating(context)
      ],
    );
  }

  Widget ButtonRating(BuildContext context) {
    return SizedBox(
      height: 45,
      width: MediaQuery.of(context).size.width * .9,
      child: RaisedButton(
        elevation: 0,
        onPressed: () {},
        color: colorWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: const BorderSide(color: colorPrimary, width: 1),
        ),
        child: const Center(
            child: Text(
          "Xem tất cả đánh giá",
          style: TextStyle(color: colorPrimary),
        )),
      ),
    );
  }
}
