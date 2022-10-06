// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:hotel_service/data_sources/init.dart';
import 'package:hotel_service/view/components/search/search_location_appbar.dart';
import '../components/search/search_location_body.dart';

class SearchLocationScreen extends StatelessWidget {
  const SearchLocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      appBar: const SearchLocationAppBar(),
      body: const SearchLocationBody(),
    );
  }
}
