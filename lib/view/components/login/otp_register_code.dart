// ignore_for_file: deprecated_member_use, non_constant_identifier_names, use_build_context_synchronously
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_service/data_sources/init.dart';
import 'package:hotel_service/data_sources/routes.dart';
import 'package:hotel_service/presenters/register_view_contract.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import '../../../provider/register_provider.dart';
import '../global/dialog_window.dart';

class OTPRegisterCode extends StatefulWidget {
  const OTPRegisterCode({Key? key, required this.timer}) : super(key: key);
  final Timer timer;

  @override
  State<OTPRegisterCode> createState() => _OTPRegisterCodeState();
}

class _OTPRegisterCodeState extends State<OTPRegisterCode>
    implements RegisterViewContract {
  RegisterPresenter? _registerPresenter;

  @override
  onLoadError(String error) {
    showDialog(
        context: context, builder: (context) => DialogWindow(code: error));
  }

  @override
  onResponseRegister(String response) {
    if (response == "Success") {
      Get.toNamed(RoutesClass.getSearchHomeRoute());
    } else {
      showDialog(
          context: context, builder: (context) => DialogWindow(code: response));
    }
  }

  @override
  Widget build(BuildContext context) {
    // BUILD CODE CONFIRM OTP REGISTER
    return Form(
      child: PinCodeTextField(
        enabled: context.read<RegisterInfoProvider>().pause ? false : true,
        autoFocus: true,
        showCursor: false,
        onChanged: (value) {},
        appContext: context,
        length: 6,
        textStyle: const TextStyle(color: colorPrimary),
        blinkWhenObscuring: true,
        animationType: AnimationType.fade,
        pinTheme: PinTheme(
          borderRadius: BorderRadius.circular(5),
          borderWidth: 2,
          shape: PinCodeFieldShape.underline,
          activeFillColor: colorWhite,
          activeColor: Colors.black,
          selectedFillColor: colorWhite,
          inactiveFillColor: colorWhite,
          disabledColor: colorWhite,
        ),
        animationDuration: const Duration(milliseconds: 300),
        enableActiveFill: true,
        keyboardType: TextInputType.number,
        onCompleted: (value) {
          sendCode(context, value);
        },
      ),
    );
  }

  // SHOW MESSAGE RESPONSE
  void sendCode(BuildContext context, String codeOTP) async {
    _registerPresenter = RegisterPresenter(this);
    _registerPresenter!
        .confirmOTPCode(context.read<RegisterInfoProvider>().phone, codeOTP);
  }
}
