import 'package:flutter/material.dart';
import 'package:hotel_service/data_sources/init.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../register_screen/hotel_login_screen.dart';
import '../search_screen/search_hotel_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool login = false;

  checkLogin()async{
    SharedPreferences storage = await SharedPreferences.getInstance();
    setState(() {
      login = storage.getString('data') != null;
    });
  }

  @override
  void initState() {
    super.initState();
    checkLogin();
    _navigaToHome();
  }

  _navigaToHome(){
    Future.delayed(const Duration(seconds: 5),(){
      Navigator.pushReplacement(
        context, 
        MaterialPageRoute(
          builder: (context) => login ? const SearchHotelScreen() : const HotelLoginScreen())
        );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorPrimary,
      child: Padding(
        padding: const EdgeInsets.only(top: 150),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: colorWhite,
                borderRadius: BorderRadius.circular(30)
              ),
              child: Image.asset(
                "assets/images/img_logo.png", 
                scale: 1.5,
              )
            ),
            const SizedBox(height: 30,),
            const Text(
              "Sàn du lịch",
              style: TextStyle(color: colorWhite, fontSize: 30, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}