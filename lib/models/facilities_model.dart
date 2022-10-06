// ignore_for_file: unnecessary_getters_setters

import 'package:hive/hive.dart';
part 'facilities_model.g.dart';

@HiveType(typeId: 1)
class Facilities {
  @HiveField(0)
  String? _id;

  @HiveField(1)
  String? _image;

  @HiveField(2)
  String? _name;

  Facilities({String? id, String? image, String? name}) {
    if (id != null) {
      _id = id;
    }
    if (image != null) {
      _image = image;
    }
    if (name != null) {
      _name = name;
    }
  }

  String? get id => _id;
  set id(String? id) => _id = id;
  String? get image => _image;
  set image(String? image) => _image = image;
  String? get name => _name;
  set name(String? name) => _name = name;

  Facilities.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _image = json['image'];
    _name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['image'] = _image;
    data['name'] = _name;
    return data;
  }
}
