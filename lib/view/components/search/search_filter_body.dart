// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import '../global/card.dart';

class SearchFilterBody extends StatelessWidget {
  const SearchFilterBody({
    Key? key,
    this.data,
  }) : super(key: key);
  final data;

  @override
  Widget build(BuildContext context) {
    // BUILD SEARCH FILTER BODY
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) => Column(
              children: [
                CardLarge(
                  hotelData: data[index],
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ));
  }
}
