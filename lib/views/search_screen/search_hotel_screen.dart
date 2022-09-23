// ignore_for_file: deprecated_member_use, non_constant_identifier_names, prefer_typing_uninitialized_variables, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:hotel_service/data_sources/init.dart';
import 'package:hotel_service/presenters/hotellist_view_contract.dart';
import '../../components/global/card.dart';
import '../../components/global/more_hotel_widget.dart';
import '../../components/global/title.dart';
import '../../components/search/search_appbar.dart';
import '../../components/search/search_notification_component.dart';
import '../system_screen/error_screen.dart';
import '../system_screen/loading_screen.dart';

class SearchHotelScreen extends StatefulWidget {
  const SearchHotelScreen({ Key? key, this.hotelData, this.errorMessage,}) : super(key: key);
  final List? hotelData;
  final String? errorMessage;
  @override
  State<SearchHotelScreen> createState() => _SearchHotelScreenState();
}

class _SearchHotelScreenState extends State<SearchHotelScreen> implements HotelListViewContract{
  bool _isTop = true;
  bool _isLoading = true;
  bool _isError = false;
  String _errorMessage = '';
  late ScrollController scrollController; 
  List _hotelData = [];
  HotelListPresenter? _hotelListPresenter;

  @override
  void initState(){
    scrollController = ScrollController();
    scrollController.addListener(() {
      final isTopNow = scrollController.position.pixels <= 550;
      if (isTopNow){
        setState(() {
          _isTop = true;
        });
      }
      else{
        setState(() {
          _isTop = false;
        });
      } 
    });
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
    final double itemHeight = (size.height - kToolbarHeight) / 3;
    final double itemWidth = size.width / 2;
    
    return WillPopScope(
      onWillPop: () async{
        return false;
      },
      child: Scaffold(
        backgroundColor: colorF2F9FE,
        body: _isError ? ErrorScreen(errorMessage: _errorMessage) : _isLoading ? const LoadingScreen() : CustomScrollView(
          controller: scrollController,
          slivers: [
            SearchAppBar(isTop: _isTop,),
            const SliverToBoxAdapter(
              child: NotificationComponent(),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: paddingLR),
                child: Column(
                  children: [
                    const TitleWidget(
                      title: "Ưu đãi dành cho bạn",
                      more: "Xem thêm",
                    ),
                    SizedBox(
                      height: 450,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _hotelData.length,
                        itemBuilder: (context, index){
                          return Row(
                            children: [
                              CardLarge(hotelData: _hotelData[index],),
                              const SizedBox(width: 10,),
                            ],
                          );
                        },
                      ),
                    ),
                    const TitleWidget(
                      title: "Combo giá tốt", 
                      more: "Xem thêm"
                    ),
                    SizedBox(
                      height: 450,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _hotelData.length,
                        itemBuilder: (context, index){
                          return Row(
                            children: [
                              CardLarge(hotelData: _hotelData[index],),
                              const SizedBox(width: 10,),
                            ],
                          );
                        },
                      ),
                    ),
                    const TitleWidget(
                      title: "Mới nhất", 
                      more: "Tất cả"
                    ),
                  ],
                )
              )
            ),
            MoreHotelWidget(
              itemWidth: itemWidth, 
              itemHeight: itemHeight
            )
          ],
        )
      ),
    );
  }
}