// ignore_for_file: constant_identifier_names
abstract class HotelRepository{
  static const HOTEL_DATA = "/v1/hotel";
  Future fetchHotelList();
  Future fetchHotelByID(String idHotel);
}