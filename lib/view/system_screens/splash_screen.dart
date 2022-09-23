import 'package:flutter/material.dart';
import 'package:hotel_service/data_sources/init.dart';
import 'package:hotel_service/view/register_screens/hotel_login_screen.dart';
import 'package:hotel_service/view/search_screens/search_hotel_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: colorWhite,
                borderRadius: BorderRadius.circular(30)
              ),
              child: Image.asset(
                "assets/images/img_logo.png", 
                scale: 1.7,
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