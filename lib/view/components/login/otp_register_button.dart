import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hotel_service/view/register_screens/otp_register_screen.dart';
import 'package:provider/provider.dart';
import '../../../data_sources/init.dart';
import '../../../provider/register_provider.dart';
import '../../register_screens/hotel_login_screen.dart';

class OTPRegisterButton extends StatefulWidget {
  const OTPRegisterButton({
    Key? key, required this.timer,
  }) : super(key: key);
  final Timer timer;

  @override
  State<OTPRegisterButton> createState() => _OTPRegisterButtonState();
}

class _OTPRegisterButtonState extends State<OTPRegisterButton> {
  @override
  Widget build(BuildContext context) {
    // BUILD BUTTON FOR REGISTER SCREEN
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            context.read<RegisterInfoProvider>().returnLogin(widget.timer);
            Navigator.push(context, MaterialPageRoute(builder: (context) => const OTPRegisterScreen()));
          },
          child: Container(
            height: 40,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              border: Border.all(color: colorPrimary, width: 2)
            ),
            child: const Center(
              child: Text(
                "Gửi lại mã", 
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: color929394),
              )
            ),
          ),
        ),

        InkWell(
          onTap: () {
            widget.timer.cancel();
            Navigator.push(context, MaterialPageRoute(builder: (context) => const HotelLoginScreen()));
          },
          child: const Text(
            "Đổi số điện thọai",
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: color929394)
          ),
        ),
      ],
    );
  }
}


