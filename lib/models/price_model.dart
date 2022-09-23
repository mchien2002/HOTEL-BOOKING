// ignore_for_file: unnecessary_getters_setters
import 'package:hive/hive.dart';
part 'price_model.g.dart';

@HiveType(typeId: 4)
class Price {
  @HiveField(0)
  int? _additionalChildrenFee;

  @HiveField(1)
  int? _additionalGuestsFee;

  @HiveField(2)
  int? _additionalInfantsFee;

  @HiveField(3)
  String? _checkinTime;

  @HiveField(4)
  String? _checkoutTime;

  @HiveField(5)
  int? _cleaningFee;

  @HiveField(6)
  String? _currencyCode;

  @HiveField(7)
  int? _monthlyPrice;

  @HiveField(8)
  int? _nightlyPrice;

  @HiveField(9)
  String? _note;

  @HiveField(10)
  int? _securityFee;

  @HiveField(11)
  int? _standardChildren;

  @HiveField(12)
  int? _standardGuests;

  @HiveField(13)
  int? _standardInfants;

  @HiveField(14)
  int? _weekendPrice;
  
  Price(
      {int? additionalChildrenFee,
      int? additionalGuestsFee,
      int? additionalInfantsFee,
      String? checkinTime,
      String? checkoutTime,
      int? cleaningFee,
      String? currencyCode,
      int? monthlyPrice,
      int? nightlyPrice,
      String? note,
      int? securityFee,
      int? standardChildren,
      int? standardGuests,
      int? standardInfants,
      int? weekendPrice}) {
    if (additionalChildrenFee != null) {
      _additionalChildrenFee = additionalChildrenFee;
    }
    if (additionalGuestsFee != null) {
      _additionalGuestsFee = additionalGuestsFee;
    }
    if (additionalInfantsFee != null) {
      _additionalInfantsFee = additionalInfantsFee;
    }
    if (checkinTime != null) {
      _checkinTime = checkinTime;
    }
    if (checkoutTime != null) {
      _checkoutTime = checkoutTime;
    }
    if (cleaningFee != null) {
      _cleaningFee = cleaningFee;
    }
    if (currencyCode != null) {
      _currencyCode = currencyCode;
    }
    if (monthlyPrice != null) {
      _monthlyPrice = monthlyPrice;
    }
    if (nightlyPrice != null) {
      _nightlyPrice = nightlyPrice;
    }
    if (note != null) {
      _note = note;
    }
    if (securityFee != null) {
      _securityFee = securityFee;
    }
    if (standardChildren != null) {
      _standardChildren = standardChildren;
    }
    if (standardGuests != null) {
      _standardGuests = standardGuests;
    }
    if (standardInfants != null) {
      _standardInfants = standardInfants;
    }
    if (weekendPrice != null) {
      _weekendPrice = weekendPrice;
    }
  }

  int? get additionalChildrenFee => _additionalChildrenFee;
  set additionalChildrenFee(int? additionalChildrenFee) =>
      _additionalChildrenFee = additionalChildrenFee;
  int? get additionalGuestsFee => _additionalGuestsFee;
  set additionalGuestsFee(int? additionalGuestsFee) =>
      _additionalGuestsFee = additionalGuestsFee;
  int? get additionalInfantsFee => _additionalInfantsFee;
  set additionalInfantsFee(int? additionalInfantsFee) =>
      _additionalInfantsFee = additionalInfantsFee;
  String? get checkinTime => _checkinTime;
  set checkinTime(String? checkinTime) => _checkinTime = checkinTime;
  String? get checkoutTime => _checkoutTime;
  set checkoutTime(String? checkoutTime) => _checkoutTime = checkoutTime;
  int? get cleaningFee => _cleaningFee;
  set cleaningFee(int? cleaningFee) => _cleaningFee = cleaningFee;
  String? get currencyCode => _currencyCode;
  set currencyCode(String? currencyCode) => _currencyCode = currencyCode;
  int? get monthlyPrice => _monthlyPrice;
  set monthlyPrice(int? monthlyPrice) => _monthlyPrice = monthlyPrice;
  int? get nightlyPrice => _nightlyPrice;
  set nightlyPrice(int? nightlyPrice) => _nightlyPrice = nightlyPrice;
  String? get note => _note;
  set note(String? note) => _note = note;
  int? get securityFee => _securityFee;
  set securityFee(int? securityFee) => _securityFee = securityFee;
  int? get standardChildren => _standardChildren;
  set standardChildren(int? standardChildren) =>
      _standardChildren = standardChildren;
  int? get standardGuests => _standardGuests;
  set standardGuests(int? standardGuests) => _standardGuests = standardGuests;
  int? get standardInfants => _standardInfants;
  set standardInfants(int? standardInfants) =>
      _standardInfants = standardInfants;
  int? get weekendPrice => _weekendPrice;
  set weekendPrice(int? weekendPrice) => _weekendPrice = weekendPrice;

  Price.fromJson(Map<String, dynamic> json) {
    _additionalChildrenFee = json['additionalChildrenFee'];
    _additionalGuestsFee = json['additionalGuestsFee'];
    _additionalInfantsFee = json['additionalInfantsFee'];
    _checkinTime = json['checkinTime'];
    _checkoutTime = json['checkoutTime'];
    _cleaningFee = json['cleaningFee'];
    _currencyCode = json['currencyCode'];
    _monthlyPrice = json['monthlyPrice'];
    _nightlyPrice = json['nightlyPrice'];
    _note = json['note'];
    _securityFee = json['securityFee'];
    _standardChildren = json['standardChildren'];
    _standardGuests = json['standardGuests'];
    _standardInfants = json['standardInfants'];
    _weekendPrice = json['weekendPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['additionalChildrenFee'] = _additionalChildrenFee;
    data['additionalGuestsFee'] = _additionalGuestsFee;
    data['additionalInfantsFee'] = _additionalInfantsFee;
    data['checkinTime'] = _checkinTime;
    data['checkoutTime'] = _checkoutTime;
    data['cleaningFee'] = _cleaningFee;
    data['currencyCode'] = _currencyCode;
    data['monthlyPrice'] = _monthlyPrice;
    data['nightlyPrice'] = _nightlyPrice;
    data['note'] = _note;
    data['securityFee'] = _securityFee;
    data['standardChildren'] = _standardChildren;
    data['standardGuests'] = _standardGuests;
    data['standardInfants'] = _standardInfants;
    data['weekendPrice'] = _weekendPrice;
    return data;
  }
}