import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hotel_service/presenters/hotellist_view_contract.dart';
import '../../../data_sources/init.dart';
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

class _MoreHotelWidgetState extends State<MoreHotelWidget> implements HotelListViewContract{
  bool _isLoading = true;
  List _hotelData = [];
  HotelListPresenter? _hotelListPresenter;

  @override
  void initState(){
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
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading ? const SliverToBoxAdapter(child: SpinKitThreeInOut(color: colorB2B2B2,),) : SliverGrid(
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