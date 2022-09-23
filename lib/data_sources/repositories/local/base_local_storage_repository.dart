import 'package:hive/hive.dart';
import 'package:hotel_service/models/roomtype_model.dart';
import '../../../models/hotel_data_model.dart';

abstract class BaseLocalStorageRepository{
  Future<Box> openBox(String boxName);
  List<dynamic> getWishListHotelData(Box box);
  HotelData getHotelByID(Box box, String id);
  Future addData(Box box, HotelData hotelData);
  Future addRoomTypeData(Box box, List<RoomType> roomType);
  Future removeData(Box box, String id);
  Future clearWishList(Box box);
}