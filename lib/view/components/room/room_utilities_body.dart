// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:hotel_service/view/components/room/room_detail_utilities.dart';
import '../../../data_sources/init.dart';
import '../global/title.dart';


class RoomUtilitiesBody extends StatelessWidget {
  const RoomUtilitiesBody({
    Key? key, this.data,
  }) : super(key: key);
  final data;

  @override
  Widget build(BuildContext context) {
    // BUILD UTILITIES BODY
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: paddingLR),
      child: ListView(
        children: [
          BannerPicture(getUrl()),
          const SizedBox(height: 10,),
          Text(
            data.description!,
            textAlign: TextAlign.justify,
            style: const TextStyle(height: 1.6),
          ),
          const TitleWidget(title: "Tiện ích trong phòng"),
          Wrap(
            children: List.generate(
              data.facilities.length, 
              (index) => RoomUtilities(facilities: data.facilities[index],)
            ),
          )
        ],
      ),
    );
  }

  Widget BannerPicture(String picUrl) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage(picUrl),
          fit: BoxFit.cover
        )
      ),
    );
  }

  String getUrl(){
    try{
      return data.banner!;
    }
    catch(e){
      return data.photos[0];
    }
  }
}
