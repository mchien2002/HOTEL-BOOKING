// ignore_for_file: deprecated_member_use, non_constant_identifier_names, prefer_typing_uninitialized_variables, use_build_context_synchronously
import 'package:flutter/material.dart';
import '../../models/hotel_data_model.dart';
import '../../presenters/hotelid_view_contract.dart';
import '../components/global/more_hotel_widget.dart';
import '../components/global/title.dart';
import '../components/room/room_detail_appbar.dart';
import '../components/room/room_detail_attractions.dart';
import '../components/room/room_detail_card.dart';
import '../components/room/room_detail_feedback.dart';
import '../components/room/room_detail_overview.dart';
import '../components/room/room_detail_policy.dart';
import '../components/room/room_detail_support.dart';
import '../../data_sources/init.dart';

class RoomDetailScreen extends StatefulWidget {
  const RoomDetailScreen({ Key? key, required this.idHotel}) : super(key: key);
  final String idHotel;

  @override
  // ignore: library_private_types_in_public_api
  _RoomDetailScreenState createState() => _RoomDetailScreenState();
}

class _RoomDetailScreenState extends State<RoomDetailScreen> implements HotelByIDViewContract{
  bool _isLoading = true;
  bool isTop = true;
  bool _isError = false;
  String _errorMessage = '';
  HotelData _hotelData = HotelData();
  HotelByIDPresenter? _hotelByIDPresenter;
  late ScrollController scrollController;
  final dataKey = List.generate(7, (index) => GlobalKey());

  @override
  void initState(){
    scrollController = ScrollController();
    scrollController.addListener(() {
        final isTopNow = scrollController.position.pixels <= 270;
        if (isTopNow){
          setState(() {
            isTop = true;
          });
        }
        else{
          setState(() {
            isTop = false;
          });
        }
    });      
    super.initState();
    _hotelByIDPresenter = HotelByIDPresenter(this);
    _hotelByIDPresenter!.loadHotelID(widget.idHotel);
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
  onLoadHotelIDComplete(hotelData) {
    setState(() {
      _hotelData = hotelData;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight) / 3;
    final double itemWidth = size.width / 2;
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        body: CustomScrollView(
          controller: scrollController,
          slivers: [
            RoomDetailAppbar(
              isTop: isTop, 
              hotelData: _hotelData, 
              listDataKey: dataKey,
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: paddingLR, vertical: 10),
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, 
                  children: [
                    RoomDetailOverview(
                      key: dataKey[0],
                      hotelData: _hotelData, 
                      listRoomData: _hotelData.roomTypes!, 
                    ),
                    TitleWidget(
                      key: dataKey[1],
                      title: "Vui lòng chọn phòng", 
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        height: 25,
                        width: MediaQuery.of(context).size.width *.6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: colorD67402,
                        ),
                        child: const Center(
                          child: Text(
                            "Giá phòng từ ngày: 16-8-2022 - 30-8-2022", 
                            style: TextStyle(color: colorWhite, fontSize: 12),
                          )
                        ),
                      ),
                    ),
                    Column(
                      children: List.generate(
                        _hotelData.roomTypes!.length, 
                        (index) => RoomCardItem(roomTypeData: _hotelData.roomTypes![index],)
                      ),
                    ),
                    TitleWidget(
                      key: dataKey[2],
                      title: "Đánh giá gần đây", 
                    ),
                    const RoomDetailFeedBack(),
                    TitleWidget(
                      key: dataKey[3],
                      title: "Điểm tham quan gần đó", 
                    ),
                    const RoomDetailAttractions(),
                    TitleWidget(
                      key: dataKey[4],
                      title: "Chính sách chỗ lưu trú", 
                    ),
                    const RoomDetailPolicy(), 
                    TitleWidget(
                      key: dataKey[5],
                      title: "Liên hệ với chúng tôi", 
                    ),
                    const RoomDetailSupport(),
                    TitleWidget(
                      key: dataKey[6],
                      title: "Chỗ lưu trú gần đó", 
                    ),
                  ],
                ),
              ),
            ),
            MoreHotelWidget(
              itemWidth: itemWidth, 
              itemHeight: itemHeight
            )
          ],
        ),
      ),
    ); 
  }
}


