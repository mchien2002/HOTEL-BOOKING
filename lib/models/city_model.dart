// ignore_for_file: unnecessary_getters_setters
import 'package:hive/hive.dart';
part 'city_model.g.dart';

@HiveType(typeId: 0)
class City {
  @HiveField(0)
  String? _id;

  @HiveField(1)
  String? _name;

  City({String? id, String? name}) {
    if (id != null) {
      _id = id;
    }
    if (name != null) {
      _name = name;
    }
  }

  String? get id => _id;
  set id(String? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;

  City.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['name'] = _name;
    return data;
  }
}