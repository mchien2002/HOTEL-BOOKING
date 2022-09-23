// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hotel_service/view/components/search/search_component.dart';
import 'package:hotel_service/data_sources/init.dart';
import 'package:hotel_service/view/register_screens/hotel_login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data_sources/repositories/local/local_storage_repository_iml.dart';

class SearchAppBar extends StatefulWidget {
  const SearchAppBar({
    Key? key, required this.isTop
  }) : super(key: key);
  final bool isTop;

  @override
  State<SearchAppBar> createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> {
  final LocalStorageRepositoryIml _localStorageRepository = LocalStorageRepositoryIml();

  @override
  Widget build(BuildContext context) {
    // BUILD SEARCH APP BAR
    return SliverAppBar(
      leading: Image.asset(
        "assets/images/img_back.png", 
        color: widget.isTop ? colorWhite : colorB2B2B2, 
        scale: 2,
      ),
      actions: [
        IconButton(
          onPressed: () => logOut(context), 
          icon: Image.asset(
            "assets/images/img_icon_logout.png", 
            scale: 1.5, 
            color: colorWhite,
          )
        )
      ],
      expandedHeight: 650,
      pinned: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            Column(
                children: [
                  Image.asset(
                    "assets/images/img_searchappbar.jpg", 
                    fit: BoxFit.cover,
                  ),
                  const Expanded(
                    child: SizedBox(
                      width: double.infinity, 
                      height: double.infinity,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                        ),
                      ),
                    ),
                  ),
                ]
              ),
            const Positioned(
              top: 170,
              left: 20,
              child: Text(
              "Tìm kiếm khách sạn",
              style: TextStyle(color: colorWhite, fontSize: 20, fontWeight: FontWeight.bold),
              )
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(paddingLR, 200, paddingLR, 15),
              child: SearchComponent(),
            ),
          ],
        ),
      )
    );
  }

  logOut(BuildContext context) async{
    SharedPreferences storage = await SharedPreferences.getInstance();
    storage.clear();
    Box box1 = await _localStorageRepository.openBox(LocalStorageRepositoryIml.boxHotel);
    Box box2 = await _localStorageRepository.openBox(LocalStorageRepositoryIml.boxHodelDetail);
    _localStorageRepository.clearWishList(box1);
    _localStorageRepository.clearWishList(box2);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HotelLoginScreen())
    );
  }
}


