// ignore_for_file: deprecated_member_use, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hotel_service/data_sources/init.dart';
import 'package:hotel_service/data_sources/routes.dart';
import 'package:hotel_service/presenters/register_view_contract.dart';
import 'package:hotel_service/provider/register_provider.dart';
import 'package:provider/provider.dart';
import '../components/global/dialog_window.dart';

class HotelLoginScreen extends StatefulWidget {
  const HotelLoginScreen({Key? key}) : super(key: key);

  @override
  State<HotelLoginScreen> createState() => _HotelLoginScreenState();
}

class _HotelLoginScreenState extends State<HotelLoginScreen>
    implements RegisterViewContract {
  final textPhoneController = TextEditingController();
  bool canPress = false;
  RegisterPresenter? _registerPresenter;

  @override
  onLoadError(String error) {
    showDialog(
        context: context, builder: (context) => DialogWindow(code: error));
  }

  @override
  onResponseRegister(String response) {
    if (response == "Success") {
      context
          .read<RegisterInfoProvider>()
          .updatePhone(textPhoneController.text);
      Get.toNamed(RoutesClass.getConfirmOTPRoute(textPhoneController.text));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: colorWhite,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: paddingLR * 2),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                child: Center(
                  child: Image.asset(
                    "assets/images/img_logo.png",
                    scale: 1.5,
                  ),
                ),
              ),
              TextField(
                readOnly: true,
                decoration: InputDecoration(
                  hintText: "Việt Nam",
                  suffixIcon: Image.asset(
                    "assets/images/img_arrow_bottom.png",
                    scale: 2,
                  ),
                  prefixIcon: Image.asset(
                    "assets/images/img_vietnam.png",
                    scale: 1.5,
                    width: 60,
                    height: 0,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              RawKeyboardListener(
                focusNode: FocusNode(),
                onKey: (event) {
                  if (event is RawKeyDownEvent) {
                    if (event.isKeyPressed(LogicalKeyboardKey.enter)) {
                      builPress(textPhoneController.text, false);
                    }
                  }
                },
                child: TextFormField(
                  controller: textPhoneController,
                  onChanged: (text) {
                    setState(() {
                      canPress = text.length >= 10;
                    });
                  },
                  decoration: InputDecoration(
                    prefixIcon: Container(
                        width: MediaQuery.of(context).size.width * .15,
                        alignment: Alignment.center,
                        child: const Text(
                          "+84",
                          style: TextStyle(fontSize: 20, color: color929394),
                        )),
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  keyboardType: TextInputType.number,
                  maxLength: 15,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 50,
                child: RaisedButton(
                  onPressed: canPress
                      ? () => builPress(textPhoneController.text, false)
                      : null,
                  color: colorPrimary,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  child: const Center(
                      child: Text(
                    "Tiếp tục",
                    style: TextStyle(color: colorWhite, fontSize: 17),
                  )),
                ),
              )
            ],
          ),
        ));
  }

  void builPress(String phoneStr, bool resend) async {
    _registerPresenter = RegisterPresenter(this);
    _registerPresenter!.postPhoneRequest(phoneStr, resend);
  }
}
