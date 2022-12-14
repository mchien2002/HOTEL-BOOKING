// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_service/models/hotel_data_model.dart';
import '../../../data_sources/init.dart';

class RoomDetailAppbar extends StatefulWidget {
  const RoomDetailAppbar(
      {Key? key,
      required this.isTop,
      required this.hotelData,
      this.listDataKey})
      : super(key: key);
  final bool isTop;
  final HotelData hotelData;
  final listDataKey;

  @override
  State<RoomDetailAppbar> createState() => _RoomDetailAppbarState();
}

class _RoomDetailAppbarState extends State<RoomDetailAppbar> {
  bool _isError = false;

  @override
  void initState() {
    super.initState();
    FlutterError.onError = (FlutterErrorDetails detail) {
      setState(() {
        _isError = true;
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    // BUILD ROOM BOOKING APP BAR
    return SliverAppBar(
        backgroundColor: colorWhite,
        elevation: 0,
        pinned: true,
        expandedHeight: 350 * (1.2),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Image.asset(
              "assets/images/img_back.png",
              color: widget.isTop ? colorWhite : colorB2B2B2,
              scale: 1.6,
            )),
        actions: [
          Image.asset(
            "assets/images/img_icon_mess.png",
            color: widget.isTop ? colorWhite : colorB2B2B2,
            scale: 1.5,
          ),
          Image.asset(
            "assets/images/img_icon_like.png",
            color: widget.isTop ? colorWhite : colorB2B2B2,
            scale: 1.7,
          ),
          Image.asset(
            "assets/images/img_icon_more.png",
            color: widget.isTop ? colorWhite : colorB2B2B2,
            scale: 1.7,
          ),
        ],
        flexibleSpace: FlexibleSpaceBar(
          background: Column(
            children: [
              _isError
                  ? Image.asset("assets/images/img_error.jpg",
                      height: 350, fit: BoxFit.cover)
                  : Image.network(widget.hotelData.banner!,
                      height: 350, fit: BoxFit.cover),
              Expanded(
                child: SizedBox(
                  child: Row(
                    children: [
                      Row(
                        children: List.generate(
                            3,
                            (index) => MorePicture(
                                  context,
                                  widget.hotelData.roomTypes![index].photos![0],
                                )),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .25,
                        height: MediaQuery.of(context).size.height,
                        decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(width: 1, color: colorWhite),
                            bottom: BorderSide(width: 1, color: colorWhite),
                          ),
                          image: DecorationImage(
                              image: AssetImage("assets/images/img_error.jpg"),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                  Color.fromARGB(255, 126, 126, 126),
                                  BlendMode.modulate)),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: const Center(
                          child: Text(
                            "Xem t???t c??? h??nh ???nh",
                            style: TextStyle(color: colorWhite),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottom: widget.isTop == false
            ? PreferredSize(
                preferredSize: const Size.fromHeight(40),
                child: Container(
                  color: colorWhite,
                  child: TabBar(
                    onTap: (index) => widget.listDataKey != null
                        ? Scrollable.ensureVisible(
                            widget.listDataKey![index].currentContext,
                            duration: const Duration(seconds: 1),
                          )
                        : null,
                    isScrollable: true,
                    tabs: [
                      TabBarItem("T???ng quan"),
                      TabBarItem("Ch???n ph??ng"),
                      TabBarItem("????nh gi??"),
                      TabBarItem("?????a ??i???m th??m quan"),
                      TabBarItem("Ch??nh s??ch l??u tr???"),
                      TabBarItem("Li??n h???"),
                      TabBarItem("Ch??? l??u tr?? g???n ????"),
                    ],
                  ),
                ),
              )
            : PreferredSize(
                preferredSize: const Size.fromHeight(0),
                child: Container(),
              ));
  }

  Widget TabBarItem(String title) {
    return SizedBox(
      height: 35,
      child: Tab(
        child: Text(
          title,
          style: const TextStyle(
              color: color777777, fontSize: 12, fontWeight: FontWeight.normal),
        ),
      ),
    );
  }

  Widget MorePicture(BuildContext context, String picUrl) {
    return Container(
      width: MediaQuery.of(context).size.width * .25,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
          border: Border(
        top: BorderSide(width: 1.5, color: colorWhite),
        bottom: BorderSide(width: 1.5, color: colorWhite),
        right: BorderSide(width: 1.5, color: colorWhite),
      )),
      child: Image(
        image: _isError
            ? const AssetImage("assets/images/img_error.jpg") as ImageProvider
            : NetworkImage(picUrl),
        fit: BoxFit.cover,
      ),
    );
  }
}
