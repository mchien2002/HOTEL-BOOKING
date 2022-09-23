
// ignore_for_file: constant_identifier_names, non_constant_identifier_names, body_might_complete_normally_nullable

import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hotel_service/data_sources/repositories/register/register_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../models/api_response.dart';

class RegisterRepositoryIml extends RegisterRepository{
  static const HOST = "http://157.245.57.162:3000";
  Dio _dio = Dio();
  
  RegisterRepositoryIml(){
    _dio = Dio(BaseOptions(
      baseUrl: HOST,
      receiveDataWhenStatusError: true
    ))..interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
  }
  
  @override
  Future<String?>register(String phoneStr, bool resend) async{
    EasyLoading.show();
    var data = {
      'phone': phoneStr,
      'resend': resend
    };

    try{
      Response response;
      response = await _dio.post(RegisterRepository.LOGIN_BY_PHONE, data: data);
      if (response.statusCode == 200){
        EasyLoading.dismiss();
        return response.data['code'];
      }
    }
    on DioError catch(error){
      final errorMessage = DioExceptions.fromDioError(error).toString();
      return errorMessage;
    }
  }
  
  @override
  Future<String?> confirmOTP(String phone, String code) async{
    EasyLoading.show();
    Response responseUser;
    var data = {
      'code': code,
      'phone': phone,
    };
    try{
      responseUser = await _dio.post(RegisterRepository.CONFIRM_OTP, data: data);
      if (responseUser.statusCode == 200){
        EasyLoading.dismiss();
        SharedPreferences storage = await SharedPreferences.getInstance();
        storage.setString("data", responseUser.data['data']['access_token']);
        return responseUser.data['code'];
      }
    }
    on DioError catch(error){
      EasyLoading.dismiss();
      final errorMessage = DioExceptions.fromDioError(error).toString();
      return errorMessage;
    }
  }
}

