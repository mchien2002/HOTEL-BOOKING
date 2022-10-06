// ignore_for_file: constant_identifier_names
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hotel_service/view/components/global/dialog_window.dart';
import 'package:hotel_service/data_sources/repositories/hotel/booking_repository.dart';
import 'package:hotel_service/data_sources/repositories/hotel/hotel_repository.dart';
import 'package:hotel_service/data_sources/repositories/hotel/roomtype_repository.dart';
import 'package:hotel_service/models/hotel_byID_model.dart';
import 'package:hotel_service/models/hotels_list_model.dart';
import 'package:hotel_service/models/roomtypes_list_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../models/booking_model.dart';
import '../../../models/hotel_data_model.dart';
import '../../../models/roomtype_model.dart';
import '../../../models/api_response.dart';
import '../local/local_storage_repository_iml.dart';

class HotelRepositoryIml
    implements HotelRepository, RoomTypeRepository, BookingRepository {
  static const HOST = "http://157.245.57.162:3000";
  static const ACCESS_TOKEN_HEADER = "Authorization";
  final LocalStorageRepositoryIml _localStorageRepository =
      LocalStorageRepositoryIml();
  Dio _dio = Dio();

  HotelRepositoryIml() {
    _dio = Dio(BaseOptions(
      baseUrl: HOST,
      receiveDataWhenStatusError: true,
    ))
      ..interceptors
          .add(LogInterceptor(responseBody: true, requestBody: false));
  }

  setToken(String token) {
    _dio.options.headers[ACCESS_TOKEN_HEADER] = "Bearer $token";
  }

  callError(BuildContext context, error) {
    if (error is String) {
      showDialog(
          context: context, builder: (context) => DialogWindow(code: error));
    }
  }

  @override
  Future setDataLocal() async {
    Box boxHotel = await _localStorageRepository
        .openBox(LocalStorageRepositoryIml.boxHotel);
    Box boxHotelID = await _localStorageRepository
        .openBox(LocalStorageRepositoryIml.boxHodelDetail);
    List<HotelData> hotelsListModel = await fetchHotelList();
    for (HotelData item in hotelsListModel) {
      _localStorageRepository.addData(boxHotel, item);
      HotelData? hotelTemp = await fetchHotelByID(item.id!);
      _localStorageRepository.addData(boxHotelID, hotelTemp!);
    }
  }

  @override
  Future fetchHotelList() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    Box boxHotel = await _localStorageRepository
        .openBox(LocalStorageRepositoryIml.boxHotel);
    // Box boxHotelID = await _localStorageRepository.openBox(LocalStorageRepositoryIml.boxHodelDetail);
    setToken(storage.getString('data')!);
    try {
      Response response = await _dio.get(
        HotelRepository.HOTEL_DATA,
        queryParameters: {
          "limit": 10,
          "page": 1,
        },
      );
      if (response.statusCode == 200) {
        List<HotelData>? hotelsListModel =
            HotelsListModel.fromJson(response.data).data;
        return hotelsListModel;
      }
    } on DioError catch (error) {
      List<dynamic> hotelsListModel =
          _localStorageRepository.getWishListHotelData(boxHotel);
      if (hotelsListModel.isNotEmpty) {
        return hotelsListModel;
      } else {
        throw DioExceptions.fromDioError(error).toString();
      }
    }
  }

  @override
  Future fetchRoomList(String idHotel) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    setToken(storage.getString('data')!);
    try {
      Response response = await _dio.get(
        RoomTypeRepository.ROOM_DATA,
        queryParameters: {"limit": 5, "page": 1, "hotel_eq": idHotel},
      );
      if (response.statusCode == 200) {
        List<RoomType>? roomsListModel =
            RoomTypesListModel.fromJson(response.data).data;
        return roomsListModel;
      } else {
        return null;
      }
    } on DioError catch (e) {
      throw DioExceptions.fromDioError(e).toString();
    }
  }

  @override
  Future fetchHotelByID(String idHotel) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    Box box = await _localStorageRepository
        .openBox(LocalStorageRepositoryIml.boxHodelDetail);
    setToken(storage.getString('data')!);
    try {
      Response response = await _dio.get(
        "${HotelRepository.HOTEL_DATA}/$idHotel",
        queryParameters: {'id': idHotel},
      );
      if (response.statusCode == 200) {
        HotelData hotelByID = HotelByID.fromJson(response.data).data!;
        return hotelByID;
      }
    } on DioError catch (error) {
      try {
        HotelData hotelData =
            _localStorageRepository.getHotelByID(box, idHotel);
        return hotelData;
      } catch (e) {
        throw DioExceptions.fromDioError(error).toString();
      }
    }
  }

  @override
  Future<String?> postBooking(BookingModel bookingModel) async {
    EasyLoading.show();
    SharedPreferences storage = await SharedPreferences.getInstance();
    setToken(storage.getString('data')!);
    var data = jsonEncode(bookingModel.toJson());
    Response response;
    try {
      response = await _dio.post(BookingRepository.BOOKING_POST, data: data);
      if (response.statusCode == 200) {
        EasyLoading.dismiss();
        return response.data['message'];
      } else {
        return null;
      }
    } on DioError catch (error) {
      EasyLoading.dismiss();
      final errorMessage = DioExceptions.fromDioError(error).toString();
      throw errorMessage;
    }
  }
}
