import 'package:hive/hive.dart';
import 'package:hotel_service/models/roomtype_model.dart';
import 'base_local_storage_repository.dart';
import '../../../models/hotel_data_model.dart';

class LocalStorageRepositoryIml implements BaseLocalStorageRepository{
  static const String boxHotel = 'wishList_hotelData';
  static const String boxHodelDetail = "hotelDetail";
  static const String boxRoomType = 'wishList_roomType';

  @override
  Future<Box> openBox(String boxName) async{
    Box box = await Hive.openBox(boxName);
    return box;
  }
  
  @override
  List getWishListHotelData(Box box){
    return box.values.toList();
  }

  @override
  Future addData(Box box, storageData) async{
    await box.put(storageData.id, storageData);
  }

  @override
  Future removeData(Box box, String id) async{
    await box.delete(id);
  }

  @override
  Future clearWishList(Box box) async{
    await box.clear();
  }

  @override
Future addRoomTypeData(Box box, List<RoomType> roomType) {
    throw UnimplementedError();
  }
  
  @override
  HotelData getHotelByID(Box box, String id) {
    return box.get(id);
  }
}