// ignore_for_file: unnecessary_getters_setters

import 'package:hive/hive.dart';
import 'package:hotel_service/models/roomtype_model.dart';
import 'city_model.dart';
import 'facilities_model.dart';
part 'hotel_data_model.g.dart';

@HiveType(typeId: 9)
class HotelData {
  @HiveField(0)
  String? _address;

  @HiveField(1)
  String? _banner;

  @HiveField(2)
  City? _city;

  @HiveField(3)
  String? _content;

  @HiveField(4)
  String? _createdAt;

  @HiveField(5)
  int? _currentPrice;

  @HiveField(6)
  String? _description;

  @HiveField(7)
  String? _email;

  @HiveField(8)
  List<Facilities>? _facilities;

  @HiveField(9)
  String? _id;

  @HiveField(10)
  bool? _isFavorite;

  @HiveField(11)
  String? _name;

  @HiveField(12)
  int? _numberOfFavorite;

  @HiveField(13)
  String? _phone;

  @HiveField(14)
  List<String>? _photos;

  @HiveField(15)
  int? _ratings;

  @HiveField(16)
  List<RoomType>? _roomTypes;

  HotelData(
      {String? address,
      String? banner,
      City? city,
      String? content,
      String? createdAt,
      int? currentPrice,
      String? description,
      String? email,
      List<Facilities>? facilities,
      String? id,
      bool? isFavorite,
      String? name,
      int? numberOfFavorite,
      String? phone,
      List<String>? photos,
      int? ratings,
      List<RoomType>? roomTypes}) {
    if (address != null) {
      _address = address;
    }
    if (banner != null) {
      _banner = banner;
    }
    if (city != null) {
      _city = city;
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
    if (email != null) {
      _email = email;
    }
    if (facilities != null) {
      _facilities = facilities;
    }
    if (id != null) {
      _id = id;
    }
    if (isFavorite != null) {
      _isFavorite = isFavorite;
    }
    if (name != null) {
      _name = name;
    }
    if (numberOfFavorite != null) {
      _numberOfFavorite = numberOfFavorite;
    }
    if (phone != null) {
      _phone = phone;
    }
    if (photos != null) {
      _photos = photos;
    }
    if (ratings != null) {
      _ratings = ratings;
    }
    if (roomTypes != null) {
      _roomTypes = roomTypes;
    }
  }

  String? get address => _address;
  set address(String? address) => _address = address;
  String? get banner => _banner;
  set banner(String? banner) => _banner = banner;
  City? get city => _city;
  set city(City? city) => _city = city;
  String? get content => _content;
  set content(String? content) => _content = content;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  int? get currentPrice => _currentPrice;
  set currentPrice(int? currentPrice) => _currentPrice = currentPrice;
  String? get description => _description;
  set description(String? description) => _description = description;
  String? get email => _email;
  set email(String? email) => _email = email;
  List<Facilities>? get facilities => _facilities;
  set facilities(List<Facilities>? facilities) => _facilities = facilities;
  String? get id => _id;
  set id(String? id) => _id = id;
  bool? get isFavorite => _isFavorite;
  set isFavorite(bool? isFavorite) => _isFavorite = isFavorite;
  String? get name => _name;
  set name(String? name) => _name = name;
  int? get numberOfFavorite => _numberOfFavorite;
  set numberOfFavorite(int? numberOfFavorite) =>
      _numberOfFavorite = numberOfFavorite;
  String? get phone => _phone;
  set phone(String? phone) => _phone = phone;
  List<String>? get photos => _photos;
  set photos(List<String>? photos) => _photos = photos;
  int? get ratings => _ratings;
  set ratings(int? ratings) => _ratings = ratings;
  List<RoomType>? get roomTypes => _roomTypes;
  set roomTypes(List<RoomType>? roomTypes) => _roomTypes = roomTypes;

  HotelData.fromJson(Map<String, dynamic> json) {
    _address = json['address'];
    _banner = json['banner'];
    _city = json['city'] != null ? City.fromJson(json['city']) : null;
    _content = json['content'];
    _createdAt = json['createdAt'];
    _currentPrice = json['currentPrice'];
    _description = json['description'];
    _email = json['email'];
    if (json['facilities'] != null) {
      _facilities = <Facilities>[];
      json['facilities'].forEach((v) {
        _facilities!.add(Facilities.fromJson(v));
      });
    }
    _id = json['id'];
    _isFavorite = json['isFavorite'];
    _name = json['name'];
    _numberOfFavorite = json['numberOfFavorite'];
    _phone = json['phone'];
    _photos = json['photos'].cast<String>();
    _ratings = json['ratings'];
    if (json['roomTypes'] != null) {
      _roomTypes = <RoomType>[];
      json['roomTypes'].forEach((v) {
        _roomTypes!.add(RoomType.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address'] = _address;
    data['banner'] = _banner;
    if (_city != null) {
      data['city'] = _city!.toJson();
    }
    data['content'] = _content;
    data['createdAt'] = _createdAt;
    data['currentPrice'] = _currentPrice;
    data['description'] = _description;
    data['email'] = _email;
    if (_facilities != null) {
      data['facilities'] = _facilities!.map((v) => v.toJson()).toList();
    }
    data['id'] = _id;
    data['isFavorite'] = _isFavorite;
    data['name'] = _name;
    data['numberOfFavorite'] = _numberOfFavorite;
    data['phone'] = _phone;
    data['photos'] = _photos;
    data['ratings'] = _ratings;
    if (_roomTypes != null) {
      data['roomTypes'] = _roomTypes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
