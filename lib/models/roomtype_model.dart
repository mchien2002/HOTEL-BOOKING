// ignore_for_file: unnecessary_getters_setters
import 'package:hive/hive.dart';
import 'package:hotel_service/models/room_model.dart';
import 'facilities_model.dart';
part 'roomtype_model.g.dart';

@HiveType(typeId: 2)
class RoomType {
  @HiveField(0)
  int? _area;

  @HiveField(1)
  String? _content;

  @HiveField(2)
  String? _createdAt;

  @HiveField(3)
  int? _currentPrice;

  @HiveField(4)
  String? _description;

  @HiveField(5)
  List<Facilities>? _facilities;

  @HiveField(6)
  String? _hotel;

  @HiveField(7)
  String? _id;

  @HiveField(8)
  String? _name;

  @HiveField(9)
  String? _numberOfBed;

  @HiveField(10)
  List<String>? _photos;

  @HiveField(11)
  List<Rooms>? _rooms;

  RoomType(
      {int? area,
      String? content,
      String? createdAt,
      int? currentPrice,
      String? description,
      List<Facilities>? facilities,
      String? hotel,
      String? id,
      String? name,
      String? numberOfBed,
      List<String>? photos,
      List<Rooms>? rooms}) {
    if (area != null) {
      _area = area;
    }
    if (content != null) {
      _content = content;
    }
    if (createdAt != null) {
      _createdAt = createdAt;
    }
    if (currentPrice != null) {
      _currentPrice = currentPrice;
    }
    if (description != null) {
      _description = description;
    }
    if (facilities != null) {
      _facilities = facilities;
    }
    if (hotel != null) {
      _hotel = hotel;
    }
    if (id != null) {
      _id = id;
    }
    if (name != null) {
      _name = name;
    }
    if (numberOfBed != null) {
      _numberOfBed = numberOfBed;
    }
    if (photos != null) {
      _photos = photos;
    }
    if (rooms != null) {
      _rooms = rooms;
    }
  }

  int? get area => _area;
  set area(int? area) => _area = area;
  String? get content => _content;
  set content(String? content) => _content = content;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  int? get currentPrice => _currentPrice;
  set currentPrice(int? currentPrice) => _currentPrice = currentPrice;
  String? get description => _description;
  set description(String? description) => _description = description;
  List<Facilities>? get facilities => _facilities;
  set facilities(List<Facilities>? facilities) => _facilities = facilities;
  String? get hotel => _hotel;
  set hotel(String? hotel) => _hotel = hotel;
  String? get id => _id;
  set id(String? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get numberOfBed => _numberOfBed;
  set numberOfBed(String? numberOfBed) => _numberOfBed = numberOfBed;
  List<String>? get photos => _photos;
  set photos(List<String>? photos) => _photos = photos;
  List<Rooms>? get rooms => _rooms;
  set rooms(List<Rooms>? rooms) => _rooms = rooms;

  RoomType.fromJson(Map<String, dynamic> json) {
    _area = json['area'];
    _content = json['content'];
    _createdAt = json['createdAt'];
    _currentPrice = json['currentPrice'];
    _description = json['description'];
    if (json['facilities'] != null) {
      _facilities = <Facilities>[];
      json['facilities'].forEach((v) {
        _facilities!.add(Facilities.fromJson(v));
      });
    }
    _hotel = json['hotel'];
    _id = json['id'];
    _name = json['name'];
    _numberOfBed = json['numberOfBed'];
    _photos = json['photos'].cast<String>();
    if (json['rooms'] != null) {
      _rooms = <Rooms>[];
      json['rooms'].forEach((v) {
        _rooms!.add(Rooms.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['area'] = _area;
    data['content'] = _content;
    data['createdAt'] = _createdAt;
    data['currentPrice'] = _currentPrice;
    data['description'] = _description;
    if (_facilities != null) {
      data['facilities'] = _facilities!.map((v) => v.toJson()).toList();
    }
    data['hotel'] = _hotel;
    data['id'] = _id;
    data['name'] = _name;
    data['numberOfBed'] = _numberOfBed;
    data['photos'] = _photos;
    if (_rooms != null) {
      data['rooms'] = _rooms!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
