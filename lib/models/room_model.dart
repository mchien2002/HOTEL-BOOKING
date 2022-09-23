// ignore_for_file: unnecessary_getters_setters
import 'package:hive/hive.dart';
import 'package:hotel_service/models/price_model.dart';
import 'facilities_model.dart';
part 'room_model.g.dart';

@HiveType(typeId: 3)
class Rooms {
  @HiveField(0)
  String? _cancelPolicy;

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
  String? _id;

  @HiveField(7)
  int? _maximumGuests;

  @HiveField(8) 
  String? _name;

  @HiveField(9)
  String? _paymentPolicy;

  @HiveField(10)
  Price? _price;

  @HiveField(11)
  String? _roomType;

  Rooms(
      {String? cancelPolicy,
      String? content,
      String? createdAt,
      int? currentPrice,
      String? description,
      List<Facilities>? facilities,
      String? id,
      int? maximumGuests,
      String? name,
      String? paymentPolicy,
      Price? price,
      String? roomType}) {
    if (cancelPolicy != null) {
      _cancelPolicy = cancelPolicy;
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
    if (id != null) {
      _id = id;
    }
    if (maximumGuests != null) {
      _maximumGuests = maximumGuests;
    }
    if (name != null) {
      _name = name;
    }
    if (paymentPolicy != null) {
      _paymentPolicy = paymentPolicy;
    }
    if (price != null) {
      _price = price;
    }
    if (roomType != null) {
      _roomType = roomType;
    }
  }

  String? get cancelPolicy => _cancelPolicy;
  set cancelPolicy(String? cancelPolicy) => _cancelPolicy = cancelPolicy;
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
  String? get id => _id;
  set id(String? id) => _id = id;
  int? get maximumGuests => _maximumGuests;
  set maximumGuests(int? maximumGuests) => _maximumGuests = maximumGuests;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get paymentPolicy => _paymentPolicy;
  set paymentPolicy(String? paymentPolicy) => _paymentPolicy = paymentPolicy;
  Price? get price => _price;
  set price(Price? price) => _price = price;
  String? get roomType => _roomType;
  set roomType(String? roomType) => _roomType = roomType;

  Rooms.fromJson(Map<String, dynamic> json) {
    _cancelPolicy = json['cancelPolicy'];
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
    _id = json['id'];
    _maximumGuests = json['maximumGuests'];
    _name = json['name'];
    _paymentPolicy = json['paymentPolicy'];
    _price = json['price'] != null ? Price.fromJson(json['price']) : null;
    _roomType = json['roomType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cancelPolicy'] = _cancelPolicy;
    data['content'] = _content;
    data['createdAt'] = _createdAt;
    data['currentPrice'] = _currentPrice;
    data['description'] = _description;
    if (_facilities != null) {
      data['facilities'] = _facilities!.map((v) => v.toJson()).toList();
    }
    data['id'] = _id;
    data['maximumGuests'] = _maximumGuests;
    data['name'] = _name;
    data['paymentPolicy'] = _paymentPolicy;
    if (_price != null) {
      data['price'] = _price!.toJson();
    }
    data['roomType'] = _roomType;
    return data;
  }
}