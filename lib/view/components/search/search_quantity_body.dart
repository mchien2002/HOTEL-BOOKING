// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_service/provider/search_provider.dart';
import 'package:provider/provider.dart';
import '../../../data_sources/init.dart';

class SearchQuantityBody extends StatefulWidget {
  const SearchQuantityBody({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchQuantityBody> createState() => _SearchQuantityBodyState();
}

class _SearchQuantityBodyState extends State<SearchQuantityBody> {
  @override
  Widget build(BuildContext context) {
    // BUILD QUANTITY BODY
    return Padding(
        padding: const EdgeInsets.only(
          left: paddingLR,
          bottom: 20,
        ),
        child: ListView(
          children: [
            buildBoxQuantity("Phòng", 0),
            buildBoxQuantity("Người Lớn", 1),
            buildBoxQuantity("Trẻ Em", 2),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 200,
              height: 50,
              // ignore: deprecated_member_use
              child: RaisedButton(
                onPressed: () => Get.back(),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0)),
                padding: const EdgeInsets.all(0.0),
                child: Ink(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        Color(0xFF0D47A1),
                        Color(0xFF42A5F5),
                      ],
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  ),
                  child: Container(
                    constraints: const BoxConstraints(
                        minWidth: 88.0,
                        minHeight: 36.0), // min sizes for Material buttons
                    alignment: Alignment.center,
                    child: const Text(
                      'Xác nhận',
                      style: TextStyle(color: colorWhite, fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }

  Widget buildBoxQuantity(String value, int index) {
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          Text(
            value,
            style: const TextStyle(fontSize: 15),
          ),
          const Expanded(child: Divider()),
          IconButton(
              onPressed: () => buildQuantityPress(context, value, false),
              icon: Image.asset(
                "assets/images/ic_subtract.png",
              )),
          Text(context.watch<SearchProvider>().rooms[index].toString(),
              style: const TextStyle(fontSize: 15)),
          IconButton(
              onPressed: () => buildQuantityPress(context, value, true),
              icon: Image.asset(
                "assets/images/ic_plus.png",
              )),
        ],
      ),
    );
  }

  void buildQuantityPress(BuildContext context, String value, flag) {
    if (value == "Phòng") {
      context.read<SearchProvider>().updateRoom(flag);
    } else if (value == "Người Lớn") {
      context.read<SearchProvider>().updateAdult(flag);
    } else if (value == "Trẻ Em") {
      context.read<SearchProvider>().updateChild(flag);
    }
  }
}
