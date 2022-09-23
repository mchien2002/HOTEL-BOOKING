// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:hotel_service/data_sources/init.dart';

class NotificationComponent extends StatelessWidget {
  const NotificationComponent({
    Key? key,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    // BUILD NOTIFICATION COMPONENT
    return Container(
      color: colorWhite,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              BuildTagNotifi("Hỗ trợ khách hàng 24/7", "assets/images/img_icon_chat2.png"),
              const SizedBox(width: 14,),
              BuildTagNotifi("Hơn 5000+ khách sạn trên toàn quốc", "assets/images/img_icon_bed2.png"),
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            children: <Widget>[
              BuildTagNotifi("Thanh toán đơn giản, tiện lợi", "assets/images/img_icon_card2.png"),
              const SizedBox(width: 14,),
              BuildTagNotifi("Ưu đãi giảm giá đặc biệt", "assets/images/img_icon_discount.png"),
            ],
          )
        ],
      ),
    );
  }

  Widget BuildTagNotifi(String inf, String IconURL) {
    return Expanded(
      child: Row(
        children: [
        Image.asset(IconURL, scale: 1.5,),
        Expanded(
          child: 
            Text(
              inf, 
              style: const TextStyle(fontSize: 15)
            ),
          )
        ]
      ),
    );
  }
}