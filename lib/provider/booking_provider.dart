import 'package:flutter/cupertino.dart';

class BookingProvider with ChangeNotifier {
  bool _pressBookingButton = false;
  TextEditingController textRequirements = TextEditingController();
  Map<String, TextEditingController> textControllers = {
    "roomTypeName": TextEditingController(),
    "firstName": TextEditingController(),
    "lastName": TextEditingController(),
    "email": TextEditingController(),
    "phone": TextEditingController(),
    "CCCD": TextEditingController(),
    "country": TextEditingController(),
  };
  bool get pressBookingButton => _pressBookingButton;

  checkButton() {
    for (var item in textControllers.values) {
      if (item.text.isEmpty) {
        _pressBookingButton = false;
        notifyListeners();
        return;
      }
    }
    _pressBookingButton = true;
    notifyListeners();
  }

  clearTextController() {
    for (TextEditingController itemText in textControllers.values) {
      itemText.clear();
    }
    notifyListeners();
  }
}
