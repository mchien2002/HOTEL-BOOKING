// ignore_for_file: deprecated_member_use, non_constant_identifier_names, prefer_typing_uninitialized_variables, use_build_context_synchronously
import 'package:flutter/material.dart';
import '../../models/hotel_data_model.dart';
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
  const RoomDetailScreen({Key? key, required this.hotelData}) : super(key: key);
  final HotelData hotelData;

  @override
  // ignore: library_private_types_in_public_api
  _RoomDetailScreenState createState() => _RoomDetailScreenState();
}

class _RoomDetailScreenState extends State<RoomDetailScreen> {
  bool isTop = true;
  late ScrollController scrollController;
  final dataKey = List.generate(7, (index) => GlobalKey());

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(() {
      final isTopNow = scrollController.position.pixels <= 270;
      if (isTopNow) {
        setState(() {
          isTop = true;
        });
      } else {
        setState(() {
          isTop = false;
        });
      }
    });
    super.initState();
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
              hotelData: widget.hotelData,
              listDataKey: dataKey,
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: paddingLR, vertical: 10),
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RoomDetailOverview(
                      key: dataKey[0],
                      hotelData: widget.hotelData,
                      listRoomData: widget.hotelData.roomTypes!,
                    ),
                    TitleWidget(
                      key: dataKey[1],
                      title: "Vui l??ng ch???n ph??ng",
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        height: 25,
                        width: MediaQuery.of(context).size.width * .6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: colorD67402,
                        ),
                        child: const Center(
                            child: Text(
                          "Gi?? ph??ng t??? ng??y: 16-8-2022 - 30-8-2022",
                          style: TextStyle(color: colorWhite, fontSize: 12),
                        )),
                      ),
                    ),
                    Column(
                      children: List.generate(
                          widget.hotelData.roomTypes!.length,
                          (index) => RoomCardItem(
                                roomTypeData:
                                    widget.hotelData.roomTypes![index],
                              )),
                    ),
                    TitleWidget(
                      key: dataKey[2],
                      title: "????nh gi?? g???n ????y",
                    ),
                    const RoomDetailFeedBack(),
                    TitleWidget(
                      key: dataKey[3],
                      title: "??i???m tham quan g???n ????",
                    ),
                    const RoomDetailAttractions(),
                    TitleWidget(
                      key: dataKey[4],
                      title: "Ch??nh s??ch ch??? l??u tr??",
                    ),
                    const RoomDetailPolicy(),
                    TitleWidget(
                      key: dataKey[5],
                      title: "Li??n h??? v???i ch??ng t??i",
                    ),
                    const RoomDetailSupport(),
                    TitleWidget(
                      key: dataKey[6],
                      title: "Ch??? l??u tr?? g???n ????",
                    ),
                  ],
                ),
              ),
            ),
            MoreHotelWidget(itemWidth: itemWidth, itemHeight: itemHeight)
          ],
        ),
      ),
    );
  }
}
