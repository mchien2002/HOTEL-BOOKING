// ignore_for_file: prefer_typing_uninitialized_variables, library_private_types_in_public_api
import  'package:flutter/material.dart';
import 'package:hotel_service/data_sources/init.dart';
import 'package:hotel_service/views/system_screen/error_screen.dart';
import '../../components/global/card_mini.dart';
import '../../presenters/hotellist_view_contract.dart';
import '../system_screen/loading_screen.dart';

class SearchShowMoreScreen extends StatefulWidget {
  const SearchShowMoreScreen({ Key? key, required this.title }) : super(key: key);
  final String title;

  @override
  _SearchShowMoreScreenState createState() => _SearchShowMoreScreenState();
}

class _SearchShowMoreScreenState extends State<SearchShowMoreScreen> implements HotelListViewContract{
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
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight) / 2.8;
    final double itemWidth = size.width / 2;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: colorWhite,
        title: Text(
          widget.title, 
          style: const TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Image.asset(
            "assets/images/img_back.png", 
            scale: 2,
          )
        ),
      ),
      body: _isError ? ErrorScreen(errorMessage: _errorMessage) : _isLoading ? const LoadingScreen() : Container(
        padding: const EdgeInsets.all(paddingLR),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: (itemWidth / itemHeight),
            crossAxisSpacing: 0  
          ),
          itemCount: _hotelData.length,
          itemBuilder: (context, index){
            return CardMiniItem(hotelData: _hotelData[index]);
          },
        )
      ),
    );
  }
}