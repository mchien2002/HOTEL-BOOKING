// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:hotel_service/data_sources/init.dart';
import '../../components/search/search_quantity_appbar.dart';
import '../../components/search/search_quantity_body.dart';
class SearchQuantityScreen extends StatefulWidget {
  const SearchQuantityScreen({ Key? key }) : super(key: key);

  @override
  _SearchQuantityScreenState createState() => _SearchQuantityScreenState();
}

class _SearchQuantityScreenState extends State<SearchQuantityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      appBar: const SearchQuantityAppBar(),
      body: const SearchQuantityBody(),
    );
  }
}