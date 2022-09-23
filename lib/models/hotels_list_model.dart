// ignore_for_file: unnecessary_getters_setters

import 'hotel_data_model.dart';

class HotelsListModel {
  String? _code;
  List<HotelData>? _data;
  String? _message;

  HotelsListModel({String? code, List<HotelData>? data, String? message}) {
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
  List<HotelData>? get data => _data;
  set data(List<HotelData>? data) => _data = data;
  String? get message => _message;
  set message(String? message) => _message = message;

  HotelsListModel.fromJson(Map<String, dynamic> json) {
    _code = json['code'];
    if (json['data'] != null) {
      _data = <HotelData>[];
      json['data'].forEach((v) {
        _data!.add(HotelData.fromJson(v));
      });
    }
    _message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = _code;
    if (_data != null) {
      data['data'] = _data!.map((v) => v.toJson()).toList();
    }
    data['message'] = _message;
    return data;
  }
}
