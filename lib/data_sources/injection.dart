
import 'package:hotel_service/data_sources/repositories/hotel/hotel_repository.dart';
import 'package:hotel_service/data_sources/repositories/hotel/hotel_repository_iml.dart';
import 'package:hotel_service/data_sources/repositories/register/register_repository.dart';
import 'package:hotel_service/data_sources/repositories/register/register_repository_iml.dart';

class Injector {
  static final Injector _singleton = Injector._internal();
  factory Injector() {
    return _singleton;
  }
  Injector._internal();
  HotelRepository handleData() => HotelRepositoryIml();
  RegisterRepository register() => RegisterRepositoryIml();
}