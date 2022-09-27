import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_service/provider/search_provider.dart';
import 'package:provider/provider.dart';
import '../../../data_sources/init.dart';

class SearchLocationBody extends StatefulWidget {
  const SearchLocationBody({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchLocationBody> createState() => _SearchLocationBodyState();
}

class _SearchLocationBodyState extends State<SearchLocationBody> {
  @override
  Widget build(BuildContext context) {
    // SEARCH LOCATION BODY
    return Container(
      padding: const EdgeInsets.only(top: 20),
      height: double.maxFinite,
      child: ListView(
        children: [
          buildBodySearchLocation("Hà Nội", "Hà Nội", "img_icon_location.png"),
          buildBodySearchLocation("Đà Nẵng", "Đà Nẵng", "img_icon_location.png"),
          buildBodySearchLocation("TP HCM", "TP HCM", "img_icon_location.png"),
          buildBodySearchLocation("Gia Lai", "Gia Lai", "img_icon_location.png"),
        ],
      ),
    );
  }

  Widget buildBodySearchLocation(String title, String content, String urlIcon){
    return InkWell(
      onTap: () => buildPress(context, title),
      child: Padding(
        padding: const EdgeInsets.only(left: paddingLR, bottom: 20,),
        child: Row(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: ExactAssetImage("assets/images/$urlIcon")
                )
              ),
            ),

            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,8,4,0),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        title, 
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                      )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,8,4,0),
                    child: Container(
                        alignment: Alignment.centerLeft,
                      child: Text(content)
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void buildPress(BuildContext context, String checkStr){
    context.read<SearchProvider>().updateLocation(checkStr);
    Get.back();
  }
}