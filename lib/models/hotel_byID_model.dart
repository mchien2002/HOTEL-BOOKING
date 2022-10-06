// ignore_for_file: file_names, unnecessary_getters_setters

import 'hotel_data_model.dart';

class HotelByID {
  String? _code;
  HotelData? _data;
  String? _message;

  HotelByID({String? code, HotelData? data, String? message}) {
    if (code != null) {
      _code = code;
    }
    if (data != null) {
      _data = data;
    }
    if (message != null) {
      _message = message;
    }
  }

  String? get code => _code;
  set code(String? code) => _code = code;
  HotelData? get data => _data;
  set data(HotelData? data) => _data = data;
  String? get message => _message;
  set message(String? message) => _message = message;

  HotelByID.fromJson(Map<String, dynamic> json) {
    _code = json['code'];
    _data = json['data'] != null ? HotelData.fromJson(json['data']) : null;
    _message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = _code;
    if (_data != null) {
      data['data'] = _data!.toJson();
    }
    data['message'] = _message;
    return data;
  }
}
