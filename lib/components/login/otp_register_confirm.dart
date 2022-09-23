import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data_sources/init.dart';
import '../../providers/register_provider.dart';
import '../../views/register_screen/hotel_login_screen.dart';

class OTPRegisterConfirm extends StatefulWidget {
  const OTPRegisterConfirm({
    Key? key, required this.timer
  }) : super(key: key);
  final Timer timer;
  
  @override
  State<OTPRegisterConfirm> createState() => _OTPRegisterConfirmState();
}

class _OTPRegisterConfirmState extends State<OTPRegisterConfirm> {
  
  @override
  Widget build(BuildContext context) {
    // BUILD OTP CONFIM TITLE
    return WillPopScope(
      onWillPop: () => stopTimer(context),
      child: Column(
        children: [
          const Text(
            "Xác nhận số điện thoại", 
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: color777777),
          ),
          const SizedBox(height: 20,),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: paddingLR * 2),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: <TextSpan>[
                  const TextSpan(
                    text: "Nhập mã xác thực OTP đã được gửi đến số điện thoại ", 
                    style: TextStyle(fontSize: 16, color: color929394),
                  ),
                  TextSpan(
                    text: context.watch<RegisterInfoProvider>().phone.replaceRange(3, 8, "*****"),
                    style: const TextStyle(color: color777777, fontWeight: FontWeight.bold, fontSize: 17)
                  )
                ]
              ),
            ),
          ),
          const SizedBox(height: 10,),
          Text("${timeFormat.format(context.watch<RegisterInfoProvider>().minutes)} : ${timeFormat.format(context.watch<RegisterInfoProvider>().seconds)}"),
          const SizedBox(height: 20,),            
        ],
      ),
    );
  }
  // STOP TIMER
  stopTimer(BuildContext context) {
    context.read<RegisterInfoProvider>().returnLogin(widget.timer);
    Navigator.push(context, MaterialPageRoute(builder: (context) => const HotelLoginScreen()));
  }
}

  