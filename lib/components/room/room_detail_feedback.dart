// ignore_for_file: non_constant_identifier_names, library_private_types_in_public_api, deprecated_member_use
import 'package:flutter/material.dart';
import '../../data_sources/init.dart';
import '../global/rating_star.dart';

class RoomDetailFeedBack extends StatefulWidget {
  const RoomDetailFeedBack({ Key? key }) : super(key: key);

  @override
  _RoomDetailFeedBackState createState() => _RoomDetailFeedBackState();
}

class _RoomDetailFeedBackState extends State<RoomDetailFeedBack> {
  @override
  Widget build(BuildContext context) {
    // BUILD FEEDBACK WIDGET
    return Column(
      children: [
        RoomDetailRating(context),
        const SizedBox(height: 20,),
        RoomDetailComment(context),
      ],
    );
  }

  Widget RoomDetailComment(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/img_userTemp.jpg"), 
                      fit: BoxFit.cover
                    )
                  ),
                ),
                const SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Nguyễn Thị Thùy Linh", 
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                    ),
                    Text(
                      "07:55 22/5/2022", 
                      style: TextStyle(height: 1.5, fontSize: 13, color: color777777),
                    )
                  ],
                )
              ],
            ),
            RatingStarWidget(rate: 4.toDouble()),
          ],
        ),
        const SizedBox(height: 10,),
        const Text(
          "Đánh giá cho: Vé vào cổng điểm tham quan: Làng gốm Thanh Hà", 
          style: TextStyle(color: color777777, fontSize: 13), 
          textAlign: TextAlign.justify,
        ),
        const SizedBox(height: 10,),
        const Text(
          "Mình mua vé trên Sàn du lịch và đổi ngay tại quầy vé làng gốm. Chỉ cần xuất voucher và nhận ngay một vé vào cổng, rất nhanh và tiện lợi.", 
          style: TextStyle(fontSize: 15), 
          textAlign: TextAlign.justify,
        ),
        const SizedBox(height: 20,),
        Center(
          child: ButtonRating(context),
        )
      ],
    );
  }

  Widget ButtonRating(BuildContext context) {
    return SizedBox(
      height: 45,
      width: MediaQuery.of(context).size.width * .9,
      child: RaisedButton(
        elevation: 0,
        onPressed: (){},
        color: colorWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: const BorderSide(color: colorPrimary, width: 1),
        ),
        child: const Center(
          child: Text(
            "Xem tất cả đánh giá", 
            style: TextStyle(color: colorPrimary),
          )
        ),
      ),
    );
  }

  Widget RoomDetailRating(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: (MediaQuery.of(context).size.width - 2 * paddingLR) * .38,
          child: Container(
            margin: const EdgeInsets.only(right: 20),
            child: Column(
              children: [
                const Text(
                  "4.2", 
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
                ),
                RatingStarWidget(rate: 4.toDouble(),),
                const Text(
                  "(14 đánh giá)", 
                  style: TextStyle(height: 1.5),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Column(
            children: [
              RatingWidget(context, "5 sao", 90),
              RatingWidget(context, "4 sao", 50),
              RatingWidget(context, "3 sao", 60),
              RatingWidget(context, "2 sao", 40),
              RatingWidget(context, "1 sao", 5),
            ],
          ),
        ),
      ],
    );
  }

  Widget RatingWidget(context, String ratingLv, double count) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(ratingLv),
        Container(
          width: (MediaQuery.of(context).size.width - 2 * paddingLR) * .5,
          margin: const EdgeInsets.symmetric(vertical: 10),
          height: 7,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 228, 228, 228),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Container(
            width: (MediaQuery.of(context).size.width - 2 * paddingLR) * .5 * (count / 100),
            decoration: BoxDecoration(
              color: colorD67402,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
      ],
    );
  }
}