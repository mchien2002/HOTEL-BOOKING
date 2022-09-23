import 'package:flutter/material.dart';
import '../../../data_sources/init.dart';
import '../../../data_sources/repositories/hotel/hotel_repository_iml.dart';
import 'card_mini.dart';

class MoreHotelWidget extends StatefulWidget {
  const MoreHotelWidget({
    Key? key,
    required this.itemWidth,
    required this.itemHeight,
  }) : super(key: key);
  // SIZE OF CARD MINI
  final double itemWidth;
  final double itemHeight;
  
  @override
  State<MoreHotelWidget> createState() => _MoreHotelWidgetState();
} 

class _MoreHotelWidgetState extends State<MoreHotelWidget> {
  // LIST HOTEL DATA
  var _hotelData = [];
  // GET LIST HOTEL DATA 
  getHotelData()async{
    _hotelData = await HotelRepositoryIml().fetchHotelList();
    setState(() {});
  }

  @override
  void initState() {
    getHotelData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      // BUILD GRID VIEW FOR CARD MINI
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: (widget.itemWidth / widget.itemHeight),
        crossAxisSpacing: 0
      ),
      delegate: SliverChildBuilderDelegate((context, index){
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: paddingLR),
          child: CardMiniItem(hotelData: _hotelData[index],)
        );
      },
      childCount: _hotelData.length,
      )
    );
  }
}