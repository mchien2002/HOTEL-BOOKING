import 'package:flutter/material.dart';

class SearchProvider with ChangeNotifier {
  String _location = "Hà Nội";
  // 0: Phong, 1: Nguoi lon, 2: Tre em
  final List _rooms = [2, 1, 1];
  late DateTimeRange _dateTimeRange = DateTimeRange(
    start: DateTime.now(),
    end: DateTime.now().add(const Duration(hours: 24 * 3)),
  );

  DateTimeRange get dateTimeRange => _dateTimeRange;
  String get location => _location;
  List get rooms => _rooms;

  void updateLocation(String locationStr) {
    _location = locationStr;
    notifyListeners();
  }

  void updateRoom(bool flag) {
    flag
        ? _rooms[0]++
        : _rooms[0] > 0
            ? _rooms[0]--
            : null;
    notifyListeners();
  }

  void updateAdult(bool flag) {
    flag
        ? _rooms[1]++
        : _rooms[1] > 0
            ? _rooms[1]--
            : null;
    notifyListeners();
  }

  void updateChild(bool flag) {
    flag
        ? _rooms[2]++
        : _rooms[2] > 0
            ? _rooms[2]--
            : null;
    notifyListeners();
  }

  Future pickDateRange(BuildContext context) async {
    final newDateRange = await showDateRangePicker(
      context: context,
      initialDateRange: _dateTimeRange,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (newDateRange == null) return;
    _dateTimeRange = newDateRange;
    notifyListeners();
  }
}
