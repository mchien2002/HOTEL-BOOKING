// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:hotel_service/data_sources/init.dart';
import 'package:hotel_service/presenters/hotellist_view_contract.dart';
import '../../components/search/search_filter_appbar.dart';
import '../../components/search/search_filter_body.dart';
import '../system_screen/error_screen.dart';
import '../system_screen/loading_screen.dart';

class SearchFilterScreen extends StatefulWidget {
  const SearchFilterScreen({ Key? key }) : super(key: key);

  @override
  _SearchFilterScreenState createState() => _SearchFilterScreenState();
}

class _SearchFilterScreenState extends State<SearchFilterScreen> implements HotelListViewContract{
  bool _isLoading = true;
  bool _isError = false;
  String _errorMessage = '';
  List _hotelData = [];
  HotelListPresenter? _hotelListPresenter;

  @override
  void initState() {
    _hotelListPresenter = HotelListPresenter(this);
    _hotelListPresenter!.loadHotelList();
    super.initState();
  }

  @override
  onLoadHotelComplete(List hotelList) {
    setState(() {
      _hotelData = hotelList;
      _isLoading = false;
    });
  }

  @override
  onLoadError(String error) {
    setState(() {
      _isError = true;
      _errorMessage = error;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorFFEFE5,
      appBar: SearchFilterAppBar(responseHotelList: _hotelData),
      body: _isError ? ErrorScreen(errorMessage: _errorMessage) : _isLoading ? const LoadingScreen() : SearchFilterBody(responseHotelList: _hotelData),
    );
  }
}