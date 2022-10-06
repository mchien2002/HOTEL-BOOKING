// ignore_for_file: prefer_const_constructors
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hotel_service/data_sources/routes.dart';
import 'package:hotel_service/models/city_model.dart';
import 'package:hotel_service/models/facilities_model.dart';
import 'package:hotel_service/models/hotel_data_model.dart';
import 'package:hotel_service/models/price_model.dart';
import 'package:hotel_service/models/room_model.dart';
import 'package:hotel_service/models/roomtype_model.dart';
import 'package:hotel_service/provider/booking_provider.dart';
import 'package:hotel_service/provider/register_provider.dart';
import 'package:hotel_service/provider/search_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  // ĐỔI MÀU STATUS BAR
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));
  // IN ORDER TO ENABLE THIS OPTION BLOBALLY IN YOUR PROJECT,
  HttpOverrides.global = MyHttpOverrides();
  // INIT HIVE FLUTTER
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(CityAdapter());
  Hive.registerAdapter(HotelDataAdapter());
  Hive.registerAdapter(FacilitiesAdapter());
  Hive.registerAdapter(RoomTypeAdapter());
  Hive.registerAdapter(RoomsAdapter());
  Hive.registerAdapter(PriceAdapter());
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => SearchProvider()),
      ChangeNotifierProvider(create: (_) => RegisterInfoProvider()),
      ChangeNotifierProvider(create: (_) => BookingProvider()),
    ],
    child: MyApp(),
  ));
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
  // ..customAnimation = CustomAnimation();
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Google Sans',
        ),
        builder: EasyLoading.init(),
        initialRoute: RoutesClass.getHomeRoute(),
        getPages: RoutesClass.routes);
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
