// ignore_for_file: unnecessary_getters_setters

import 'package:hotel_service/models/roomtype_model.dart';

class RoomTypesListModel {
  String? _code;
  String? _message;
  List<RoomType>? _data;

  RoomTypesListModel({String? code, String? message, List<RoomType>? data}) {
    if (code != null) {
      _code = code;
    }
    if (message != null) {
      _message = message;
    }
    if (data != null) {
      _data = data;
    }
  }

  String? get code => _code;
  set code(String? code) => _code = code;
  String? get message => _message;
  set message(String? message) => _message = message;
  List<RoomType>? get data => _data;
  set data(List<RoomType>? data) => _data = data;

  RoomTypesListModel.fromJson(Map<String, dynamic> json) {
    _code = json['code'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = <RoomType>[];
      json['data'].forEach((v) {
        _data!.add(RoomType.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = _code;
    data['message'] = _message;
    if (_data != null) {
      data['data'] = _data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
