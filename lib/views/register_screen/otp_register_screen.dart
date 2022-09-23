// ignore_for_file: library_private_types_in_public_api
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hotel_service/components/login/otp_register_code.dart';
import 'package:hotel_service/data_sources/init.dart';
import 'package:provider/provider.dart';
import '../../components/login/otp_register_button.dart';
import '../../components/login/otp_register_confirm.dart';
import '../../components/login/otp_register_rules.dart';
import '../../providers/register_provider.dart';

class OTPRegisterScreen extends StatefulWidget {
  const OTPRegisterScreen({ Key? key}) : super(key: key);
  
  @override
  _OTPRegisterScreenState createState() => _OTPRegisterScreenState();
}

class _OTPRegisterScreenState extends State<OTPRegisterScreen> {
  late Timer timer =  Timer(const Duration(seconds: 0), (){return;});

  @override
  void initState(){
    Future.delayed(Duration.zero).then((value){
      context.read<RegisterInfoProvider>().resetTimer();
      timer = Timer.periodic(const Duration(seconds: 1), (_){
        setState((){
          context.read<RegisterInfoProvider>().decrease();
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,  
        color: colorWhite,
        padding: const EdgeInsets.only(
          right: paddingLR * 2,
          left: paddingLR * 2,
          top: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            OTPRegisterConfirm(timer: timer,),
            OTPRegisterCode(timer: timer,),
            const SizedBox(height: 100,),
            OTPRegisterButton(timer: timer,),
            const Expanded(child: Divider()),
            const OTPRegisterRules(),
            const SizedBox(height: 30,),
          ],
        ),
      )
    );
  }
}




