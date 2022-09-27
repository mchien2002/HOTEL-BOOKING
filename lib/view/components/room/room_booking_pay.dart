// ignore_for_file: non_constant_identifier_names, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_service/models/roomtype_model.dart';
import 'package:hotel_service/view/detail_screens/room_utilities_screen.dart';
import '../../../data_sources/init.dart';
import '../../../data_sources/routes.dart';
import '../global/title.dart';

class RoomBookingPay extends StatefulWidget {
  const RoomBookingPay({
    Key? key, required this.roomTypeData,
  }) : super(key: key);
  final RoomType roomTypeData;

  @override
  State<RoomBookingPay> createState() => _RoomBookingPayState();
}

class _RoomBookingPayState extends State<RoomBookingPay> {
  @override
  Widget build(BuildContext context) {
    // BUILD BOOKNG PAY INFORMATION
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleWidget(title: "Tóm tắt thanh toán"),
        const Text("2 đêm (Thứ 4 18/07 - Thứ 5 20/07)"),
        const SizedBox(height: 20,),
        PriceWidget("Giá phòng / đêm", widget.roomTypeData.rooms![0].price!.nightlyPrice!),
        PriceWidget("Tạm tính", widget.roomTypeData.rooms![0].price!.nightlyPrice!, 2),
        VoucherWidget(),
        const SizedBox(height: 20,),
        PriceWidget("Mã ưu đãi", 100000),
        PriceWidget("Tổng cộng", widget.roomTypeData.rooms![0].price!.nightlyPrice!, 2, 100000, true),
        ContentBottom(),
        const SizedBox(height: 20,),
      ],
    );
  }

  Widget ContentBottom() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Bao gồm tất cả các loại thuế và phí dịch vụ", 
              style: TextStyle(color: color777777, fontSize: 10, height: 2),
            ),
            InkWell(
              onTap: () => Get.toNamed(
                RoutesClass.getUtilitiesRoute(widget.roomTypeData.id!),
                arguments: RoomUtilitiesScreen(data: widget.roomTypeData)
              ),
              child: const Text(
                "Xem chi tiết phòng", 
                style: TextStyle(color: colorPrimary, height: 2, fontSize: 12),
              )
            ),
          ],
        ),
        const SizedBox(height: 20,),
        const Center(
          child: Text(
            "Vui lòng điển thông tin cẩn thận. Bạn không thể chủ động thay đổi thông tin đã gửi. Khi cần trợ giúp vui lòng liên hệ chúng tôi",
            style: TextStyle(color: color777777, fontSize: 11,),
            textAlign: TextAlign.center,
          )
        ),
      ],
    );
  }

  Widget VoucherWidget() {
    return SizedBox(
      height: 50,
      child: TextField(
        onTap: () {},
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          hintText: "Nhập mã giảm giá",
          hintStyle: const TextStyle(color: Colors.black, fontSize: 13),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(10),
            child: Image.asset("assets/images/img_icon_voucher.png"),
          ),
          suffixIcon: Container(
            padding: const EdgeInsets.all(5),
            width: 100,
            child: RaisedButton(
              onPressed: (){},
              color: colorPrimary,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              child: const Center(
                child: Text(
                  "Áp dụng", 
                  style: TextStyle(color: colorWhite, fontSize: 13),
                )
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget PriceWidget(String title, int price, [int night = 1, int voucher = 0, bool total = false]){
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title, 
              style: total ? const TextStyle(fontWeight: FontWeight.w500, fontSize: 20) : null,
            ),
            Text(
              "${oCcy.format(price * night - voucher).toString().replaceAll(',', ' ')} ${widget.roomTypeData.rooms![0].price!.currencyCode}",
              style: total ? const TextStyle(color: colorFF6F15, fontSize: 20) : null,
            ),
          ],
        ),
        const SizedBox(height: 20,),
      ],
    );
  }
}