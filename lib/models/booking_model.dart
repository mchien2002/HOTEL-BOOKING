// ignore_for_file: unnecessary_getters_setters

class BookingModel {
  String? _dateCheckin;
  String? _dateCheckout;
  String? _description;
  Info? _info;
  List<RoomsBooking>? _rooms;

  BookingModel(
      {String? dateCheckin,
      String? dateCheckout,
      String? description,
      Info? info,
      List<RoomsBooking>? rooms}) {
    if (dateCheckin != null) {
      _dateCheckin = dateCheckin;
    }
    if (dateCheckout != null) {
      _dateCheckout = dateCheckout;
    }
    if (description != null) {
      _description = description;
    }
    if (info != null) {
      _info = info;
    }
    if (rooms != null) {
      _rooms = rooms;
    }
  }

  String? get dateCheckin => _dateCheckin;
  set dateCheckin(String? dateCheckin) => _dateCheckin = dateCheckin;
  String? get dateCheckout => _dateCheckout;
  set dateCheckout(String? dateCheckout) => _dateCheckout = dateCheckout;
  String? get description => _description;
  set description(String? description) => _description = description;
  Info? get info => _info;
  set info(Info? info) => _info = info;
  List<RoomsBooking>? get rooms => _rooms;
  set rooms(List<RoomsBooking>? rooms) => _rooms = rooms;

  BookingModel.fromJson(Map<String, dynamic> json) {
    _dateCheckin = json['dateCheckin'];
    _dateCheckout = json['dateCheckout'];
    _description = json['description'];
    _info = json['info'] != null ? Info.fromJson(json['info']) : null;
    if (json['rooms'] != null) {
      _rooms = <RoomsBooking>[];
      json['rooms'].forEach((v) {
        _rooms!.add(RoomsBooking.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dateCheckin'] = _dateCheckin;
    data['dateCheckout'] = _dateCheckout;
    data['description'] = _description;
    if (_info != null) {
      data['info'] = _info!.toJson();
    }
    if (_rooms != null) {
      data['rooms'] = _rooms!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Info {
  String? _cardId;
  String? _country;
  String? _email;
  String? _name;
  String? _phone;

  Info(
      {String? cardId,
      String? country,
      String? email,
      String? name,
      String? phone}) {
    if (cardId != null) {
      _cardId = cardId;
    }
    if (country != null) {
      _country = country;
    }
    if (email != null) {
      _email = email;
    }
    if (name != null) {
      _name = name;
    }
    if (phone != null) {
      _phone = phone;
    }
  }

  String? get cardId => _cardId;
  set cardId(String? cardId) => _cardId = cardId;
  String? get country => _country;
  set country(String? country) => _country = country;
  String? get email => _email;
  set email(String? email) => _email = email;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get phone => _phone;
  set phone(String? phone) => _phone = phone;

  Info.fromJson(Map<String, dynamic> json) {
    _cardId = json['cardId'];
    _country = json['country'];
    _email = json['email'];
    _name = json['name'];
    _phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cardId'] = _cardId;
    data['country'] = _country;
    data['email'] = _email;
    data['name'] = _name;
    data['phone'] = _phone;
    return data;
  }
}

class RoomsBooking {
  int? _children;
  String? _hotel;
  String? _id;
  int? _infants;
  int? _price;
  String? _roomType;

  RoomsBooking(
      {int? children,
      String? hotel,
      String? id,
      int? infants,
      int? price,
      String? roomType}) {
    if (children != null) {
      _children = children;
    }
    if (hotel != null) {
      _hotel = hotel;
    }
    if (id != null) {
      _id = id;
    }
    if (infants != null) {
      _infants = infants;
    }
    if (price != null) {
      _price = price;
    }
    if (roomType != null) {
      _roomType = roomType;
    }
  }

  int? get children => _children;
  set children(int? children) => _children = children;
  String? get hotel => _hotel;
  set hotel(String? hotel) => _hotel = hotel;
  String? get id => _id;
  set id(String? id) => _id = id;
  int? get infants => _infants;
  set infants(int? infants) => _infants = infants;
  int? get price => _price;
  set price(int? price) => _price = price;
  String? get roomType => _roomType;
  set roomType(String? roomType) => _roomType = roomType;

  RoomsBooking.fromJson(Map<String, dynamic> json) {
    _children = json['children'];
    _hotel = json['hotel'];
    _id = json['id'];
    _infants = json['infants'];
    _price = json['price'];
    _roomType = json['roomType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['children'] = _children;
    data['hotel'] = _hotel;
    data['id'] = _id;
    data['infants'] = _infants;
    data['price'] = _price;
    data['roomType'] = _roomType;
    return data;
  }
}
