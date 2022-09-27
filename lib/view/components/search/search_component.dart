// ignore_for_file: deprecated_member_use, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_service/data_sources/routes.dart';
import 'package:hotel_service/provider/search_provider.dart';
import 'package:hotel_service/data_sources/init.dart';
import 'package:provider/provider.dart';

class SearchComponent extends StatefulWidget {
  const SearchComponent({ Key? key, }) : super(key: key);

  @override
  State<SearchComponent> createState() => _SearchComponentState();
}

class _SearchComponentState extends State<SearchComponent> {
  @override
  Widget build(BuildContext context) {
    var searchProvider = context.watch<SearchProvider>();
    return Container(
      padding: const EdgeInsets.only(left: 25, top: 20, right: 25, bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: colorWhite,
      ),

      child: Align(
        alignment: Alignment.centerLeft,
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextBoxFieldSearch("Bạn muốn nghỉ dưỡng ở đâu?", searchProvider.location, RoutesClass.getSearchLocation(), const Icon(Icons.location_on)),
            const DateTimeBooking(),
            TextBoxFieldSearch("Số phòng", "${searchProvider.rooms[0]} Người lớn - ${searchProvider.rooms[1]} Phòng - ${searchProvider.rooms[2]} Trẻ em", RoutesClass.getSearchQuantity(), const Icon(Icons.home)),
            const SizedBox(height: 20,),
            SizedBox(
              width: 300,
              height: 50,
              child: RaisedButton(
                onPressed: () => Get.toNamed(RoutesClass.getSearchFilterRoute(searchProvider.location, searchProvider.rooms[0].toString())),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                padding: const EdgeInsets.all(0.0),
                child: Ink(
                  decoration: const BoxDecoration(
                    color: colorPrimary,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Container(
                    constraints: const BoxConstraints(minWidth: 88.0, minHeight: 36.0), // min sizes for Material buttons
                    alignment: Alignment.center,
                    child: const Text(
                      'Tìm kiếm', 
                      style: TextStyle(color: colorWhite, fontSize: 16, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );

  }

  Widget TextBoxFieldSearch(String label, String hintText, screen, Icon iconBox){
    return Column(
      children: [
        Row(
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 17, height: 2),
            ),
            const Text(
              " *",
              style: TextStyle(fontSize: 20, color: Colors.red, height: 2),
            ),
          ],
        ),
        const SizedBox(height: 10,), 
        SizedBox(
          height: 50,
          child: TextField(
            onTap: () => buildPress(screen),
            readOnly: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              hintText: hintText,
              hintStyle: const TextStyle(color: Colors.black, fontSize: 13),
              prefixIcon: iconBox
            ),
          ),
        ),
      ],
    );
  }

  void buildPress(screen){
    Get.toNamed(screen);
  }
}

class DateTimeBooking extends StatefulWidget {
  const DateTimeBooking({ Key? key }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DateTimeBookingState createState() => _DateTimeBookingState();
}

class _DateTimeBookingState extends State<DateTimeBooking> {

  String getTextDateTimeRange(searchProvider){
    return "${searchProvider.dateTimeRange.start.day}/${searchProvider.dateTimeRange.start.month}/${searchProvider.dateTimeRange.start.year} - ${searchProvider.dateTimeRange.end.day}/${searchProvider.dateTimeRange.end.month}/${searchProvider.dateTimeRange.end.year}";
  }
  
  @override
  Widget build(BuildContext context) {
    var searchProvider = context.watch<SearchProvider>();
    return Column(
      children: [
        Row(
          children: const [
            Text(
              "Ngày nhận trả phòng",
              style: TextStyle(fontSize: 17, height: 2),
            ),
            Text(
              " *",
              style: TextStyle(fontSize: 20, color: Colors.red, height: 2),
            ),
          ],
        ),
        const SizedBox(height: 10,), 
        SizedBox(
          height: 50,
          child: TextField(
            readOnly: true,
            onTap: () => context.read<SearchProvider>().pickDateRange(context),
            decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            prefixIcon: const Icon(Icons.calendar_month),
            hintText: getTextDateTimeRange(searchProvider),
            hintStyle: const TextStyle(color: Colors.black, fontSize: 13),
            ),
          ),
        ),
      ],
    );
  }
}