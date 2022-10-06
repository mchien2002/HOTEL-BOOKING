import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterInfoProvider with ChangeNotifier {
  bool _pause = false;
  int _maxseconds = 60;
  int _seconds = 0;
  int _minutes = 1;
  String _phone = '';
  String _codeOTP = '';
  String _token = '';

  bool get pause => _pause;
  int get seconds => _seconds;
  int get minutes => _minutes;
  String get phone => _phone;
  String get codeOTP => _codeOTP;
  String get token => _token;

  updatePhone(String phoneStr) {
    _phone = phoneStr;
    notifyListeners();
  }

  decrease() {
    if (_maxseconds > 0) {
      _maxseconds--;
    } else {
      _pause = true;
    }
    _minutes = _maxseconds ~/ 60;
    _seconds = _maxseconds - minutes * 60;
    notifyListeners();
  }

  resetTimer() {
    _maxseconds = 60;
    _pause = false;
    _minutes = 1;
    _seconds = 0;
    notifyListeners();
  }

  getOTP(String code) {
    _codeOTP = '';
    _pause = true;
    _codeOTP = code;
    notifyListeners();
  }

  tryAgaint() {
    _pause = false;
    notifyListeners();
  }

  returnLogin(Timer timer) {
    timer.cancel();
    notifyListeners();
  }

  Future<String> getToken() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    _token = storage.getString("data")!;
    return _token;
  }
}
