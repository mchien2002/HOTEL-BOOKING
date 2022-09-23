import 'package:hotel_service/data_sources/repository/hotel/hotel_repository.dart';
import 'package:hotel_service/data_sources/repository/hotel/hotel_repository_iml.dart';

class Injector {
  static final Injector _singleton = Injector._internal();
  factory Injector() {
    return _singleton;
  }
  Injector._internal();
  HotelRepository getData() => HotelRepositoryIml();
}