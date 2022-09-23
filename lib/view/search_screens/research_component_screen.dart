import 'package:flutter/material.dart';
import 'package:hotel_service/data_sources/init.dart';

import '../components/search/search_component.dart';

class ReSearchComponentScreen extends StatelessWidget {
  const ReSearchComponentScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chỉnh sửa tìm kiếm", style: TextStyle(color: Colors.black),),
        backgroundColor: colorWhite,
        centerTitle: true,
        elevation: 0,
        leading: Container(),
      ),
      body: const SearchComponent(),
    );
  }
}