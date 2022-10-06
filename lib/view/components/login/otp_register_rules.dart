import 'package:flutter/material.dart';
import '../../../data_sources/init.dart';

class OTPRegisterRules extends StatelessWidget {
  const OTPRegisterRules({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // BUILD RULES WIDGET
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: paddingLR * 2),
          child: RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
                style: TextStyle(fontSize: 14, color: color929394),
                children: <TextSpan>[
                  TextSpan(
                    text: "Hoàn thành bước này nghĩa là bạn đồng ý với ",
                  ),
                  TextSpan(
                      text: "Điều khoản ",
                      style: TextStyle(
                          color: color777777,
                          fontWeight: FontWeight.bold,
                          fontSize: 15)),
                  TextSpan(
                    text: "sử dụng của ",
                  ),
                  TextSpan(
                      text: "Sàn du lịch",
                      style: TextStyle(
                          color: color777777,
                          fontWeight: FontWeight.bold,
                          fontSize: 15))
                ]),
          ),
        ),
      ],
    );
  }
}
