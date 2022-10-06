// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_service/data_sources/routes.dart';
import 'package:provider/provider.dart';
import '../../../data_sources/init.dart';
import '../../../provider/search_provider.dart';

class SearchFilterAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const SearchFilterAppBar({
    Key? key,
    required this.dataLenght,
  }) : super(key: key);
  final int dataLenght;

  @override
  Widget build(BuildContext context) {
    // BUILD SEARCH FILTER APP BAR
    return AppBar(
      elevation: 0,
      titleSpacing: 0,
      leading: IconButton(
          icon: Image.asset("assets/images/ic_icon_back.png"),
          onPressed: () =>
              Get.until((route) => Get.currentRoute == RoutesClass.search)),
      actions: [
        IconButton(
          onPressed: () => Get.toNamed(RoutesClass.getReSearchFilterRoute()),
          icon: const Icon(Icons.create_outlined, size: 30),
        )
      ],
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(context.watch<SearchProvider>().location),
          Row(
            children: [
              Image.asset(
                "assets/images/ic_calender.png",
              ),
              Text(
                "${context.watch<SearchProvider>().dateTimeRange.start.day}/${context.watch<SearchProvider>().dateTimeRange.start.month}/${context.watch<SearchProvider>().dateTimeRange.start.year} - ${context.watch<SearchProvider>().dateTimeRange.end.day}/${context.watch<SearchProvider>().dateTimeRange.end.month}/${context.watch<SearchProvider>().dateTimeRange.end.year}",
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(
                width: 10,
              ),
              Image.asset(
                "assets/images/img_search_room.png",
                color: colorWhite,
                scale: 2,
              ),
              Text(
                "${context.watch<SearchProvider>().rooms[0]} phòng",
                style: const TextStyle(fontSize: 14),
              ),
            ],
          )
        ],
      ),
      bottom: PreferredSize(
          preferredSize: const Size.fromHeight(130),
          child: Column(
            children: [
              Container(
                height: 50,
                color: colorWhite,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          decoration: const BoxDecoration(
                              border: Border(
                                  right: BorderSide(
                                      width: 0.5,
                                      color:
                                          Color.fromARGB(255, 196, 193, 193)))),
                          child: Row(
                            children: [
                              Image.asset("assets/images/img_icon_filter.png"),
                              const Text(
                                "Bộ lọc",
                                style: TextStyle(color: color777777),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          decoration: const BoxDecoration(
                              border: Border(
                                  left: BorderSide(
                                      width: 0.5,
                                      color:
                                          Color.fromARGB(255, 196, 193, 193)))),
                          child: Row(
                            children: [
                              Image.asset("assets/images/img_icon_sort.png"),
                              const Text("Sắp xếp",
                                  style: TextStyle(color: color777777)),
                            ],
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.map_outlined,
                          color: colorPrimary,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Xem bản đồ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: colorPrimary),
                        ),
                        SizedBox(
                          width: 10,
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: paddingLR),
                height: 70,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: colorFFEFE5,
                    border: Border(
                        bottom: BorderSide(color: colorFFEFE5, width: 1))),
                child: Text(
                  "Tìm thấy $dataLenght kết quả",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 130);
}
