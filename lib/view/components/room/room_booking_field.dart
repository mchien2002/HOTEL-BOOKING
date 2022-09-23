// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:hotel_service/view/components/global/title.dart';
import 'package:hotel_service/view/components/global/text_box.dart';

class BookingField extends StatelessWidget {
  const BookingField({
    Key? key, required this.textController, required this.roomTypeName
  }) : super(key: key); 
  final Map<String, TextEditingController> textController;
  final String roomTypeName;

  @override
  Widget build(BuildContext context){
    // BUILD ROOM BOOKING FIELD TEXT
    return Column(
      children: [
        const TitleWidget(title: "Thông tin người đặt phòng"),
        TextBox(title: "Tiêu đề", hintText: roomTypeName, readOnly: true, textEditingController: textController['roomTypeName']!),
        TextBox(title: "Tên", hintText: "Chiến", textEditingController: textController['firstName']!),
        TextBox(title: "Họ", hintText: "Nguyễn", textEditingController: textController['lastName']!),
        TextBox(title: "Địa chỉ mail", hintText: "minhchien123@gmail.com", textEditingController: textController['email']!),
        TextBox(title: "Số điện thoại", hintText: "0975xxxxxxx", textEditingController: textController['phone']!),
        TextBox(title: "Hộ chiếu / CCCD", hintText: "Hộ chiếu / CCCD", textEditingController: textController['CCCD']!),
        TextBox(title: "Quốc gia phát hành hộ chiếu / CCCD", hintText: "Việt Nam", textEditingController: textController['country']!),
      ],
    );
  }
}