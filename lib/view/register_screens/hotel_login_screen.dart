// ignore_for_file: deprecated_member_use, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hotel_service/data_sources/init.dart';
import 'package:hotel_service/provider/register_provider.dart';
import 'package:hotel_service/view/register_screens/otp_register_screen.dart';
import 'package:hotel_service/data_sources/repositories/register/register_repository_iml.dart';
import 'package:provider/provider.dart';
import '../components/global/dialog_window.dart';

class HotelLoginScreen extends StatefulWidget {
   const HotelLoginScreen({ Key? key }) : super(key: key);

  @override
  State<HotelLoginScreen> createState() => _HotelLoginScreenState();
}

class _HotelLoginScreenState extends State<HotelLoginScreen> {
  final textController = TextEditingController();
  bool canPress = false;
  
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
            const SizedBox(height: 30,),
            RawKeyboardListener(
              focusNode: FocusNode(),
              onKey: (event){
                if (event is RawKeyDownEvent){
                  if (event.isKeyPressed(LogicalKeyboardKey.enter)){
                    builPress(context);
                  }
                }
              },
              child: TextFormField(
                controller: textController,
                onChanged: (text){
                  setState(() {
                    canPress = text.length >= 10;
                  });
                },
                decoration: InputDecoration(  
                  prefixIcon: Container(
                    width: MediaQuery.of(context).size.width * .15 ,
                    alignment: Alignment.center,
                    child: const Text(
                      "+84", 
                      style: TextStyle(fontSize: 20, color: color929394),
                    )
                  ),
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                keyboardType: TextInputType.number,
                maxLength: 15,
              ),
            ),
            const SizedBox(height: 30,),
            SizedBox(
              height: 50,
              child: RaisedButton(
                onPressed: canPress ? () => builPress(context) : null,
                color: colorPrimary,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                child: const Center(
                  child: Text(
                    "Tiếp tục", 
                    style: TextStyle(color: colorWhite, fontSize: 17),
                  )
                ),
              ),
            )
          ],
        ),
      )
    );
  }

  void builPress(BuildContext context) async{
      String? code = await RegisterRepositoryIml().register(textController.text, false);
      if (code == "Success"){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const OTPRegisterScreen())
        );
        context.read<RegisterInfoProvider>().updatePhone(textController.text);
      }
      else{
        DialogWindow(code: code,);
      }
    }
}