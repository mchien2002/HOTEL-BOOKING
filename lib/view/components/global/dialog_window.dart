// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../../data_sources/init.dart';
import '../../../provider/register_provider.dart';

class DialogWindow extends StatelessWidget {
  const DialogWindow({
    Key? key,
    required this.code,
  }) : super(key: key);
  // MESSAGE ERROR FOR DIALOG
  final String? code;

  @override
  Widget build(BuildContext context) {
    // BUILD DIALOG WINDOW TO SHOW ERROR MESSAGE
    return AlertDialog(
      title: const Center(
        child: Text(
          'Thông báo', 
          style: TextStyle(fontSize: 15),
        )
      ),
      content: Container(
        height: 40,
        alignment: Alignment.center,
        child: Text(code!),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      actions: <Widget>[
        Center(
          child: Container(
            margin: const EdgeInsets.only(bottom: 20),
            height: 40,
            width: 120,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              color: colorPrimary,
              onPressed: () {
                context.read<RegisterInfoProvider>().tryAgaint();
                Get.back();
              },
              child: const Center(
                child: Text(
                  "Đóng", 
                  style: TextStyle(color: colorWhite, fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}