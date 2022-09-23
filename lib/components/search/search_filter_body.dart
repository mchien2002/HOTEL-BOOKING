// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import '../global/card.dart';

class SearchFilterBody extends StatelessWidget {
  const SearchFilterBody({
    Key? key,
    required  responseHotelList,
  }) : _responseHotelList = responseHotelList, super(key: key);
  final _responseHotelList;

  @override
  Widget build(BuildContext context) {
    // BUILD SEARCH FILTER BODY
    return ListView.builder(
      itemCount: _responseHotelList.length,
      itemBuilder: (context, index) => Column(
        children: [
          CardLarge(hotelData: _responseHotelList[index],),
          const SizedBox(height: 10,)
        ],
      )
    );
  }
}