// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hotel_service/presenters/hotellist_view_contract.dart';
import 'package:hotel_service/view/system_screens/error_screen.dart';
import 'package:hotel_service/data_sources/init.dart';
import '../components/search/search_filter_appbar.dart';
import '../components/search/search_filter_body.dart';

class SearchFilterScreen extends StatefulWidget {
  const SearchFilterScreen({Key? key}) : super(key: key);

  @override
  _SearchFilterScreenState createState() => _SearchFilterScreenState();
}

class _SearchFilterScreenState extends State<SearchFilterScreen>
    implements HotelListViewContract {
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
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isError
        ? ErrorScreen(errorMessage: _errorMessage)
        : Scaffold(
            backgroundColor: colorFFEFE5,
            appBar: SearchFilterAppBar(dataLenght: _hotelData.length),
            body: _isLoading
                ? const SpinKitThreeInOut(
                    color: colorB2B2B2,
                  )
                : SearchFilterBody(data: _hotelData),
          );
  }
}
