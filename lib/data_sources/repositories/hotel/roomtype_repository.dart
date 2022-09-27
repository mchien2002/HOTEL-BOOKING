// ignore_for_file: constant_identifier_names

abstract class RoomTypeRepository{
  static const ROOM_DATA = "/v1/roomtype";
  Future fetchRoomList(String idHotel);
}