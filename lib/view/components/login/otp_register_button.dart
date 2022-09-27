import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_service/data_sources/routes.dart';
import 'package:hotel_service/view/components/global/dialog_window.dart';
import 'package:provider/provider.dart';
import '../../../data_sources/init.dart';
import '../../../presenters/register_view_contract.dart';
import '../../../provider/register_provider.dart';

class OTPRegisterButton extends StatefulWidget {
  const OTPRegisterButton({
    Key? key, required this.timer,
  }) : super(key: key);
  final Timer timer;

  @override
  State<OTPRegisterButton> createState() => _OTPRegisterButtonState();
}

class _OTPRegisterButtonState extends State<OTPRegisterButton> implements RegisterViewContract{
  RegisterPresenter? _registerPresenter;

  @override
  Widget build(BuildContext context) {
    // BUILD BUTTON FOR REGISTER SCREEN
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () => btnResendCode(context),
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
            Get.back();
          },
          child: const Text(
            "Đổi số điện thọai",
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: color929394)
          ),
        ),
      ],
    );
  }

  btnResendCode(BuildContext context){
    _registerPresenter = RegisterPresenter(this);
    _registerPresenter!.postPhoneRequest(context.read<RegisterInfoProvider>().phone, false);
    
  }
  
  @override
  onLoadError(String error) {
    showDialog(
      context: context, 
      builder: (context) => DialogWindow(code: error)
    );
  }
  
  @override
  onResponseRegister(String response) {
    context.read<RegisterInfoProvider>().returnLogin(widget.timer);
    Get.offAndToNamed(RoutesClass.getConfirmOTPRoute(context.read<RegisterInfoProvider>().phone));
  }
}


