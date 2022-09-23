// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:hotel_service/components/room/room_detail_utilities.dart';
import '../../data_sources/init.dart';
import '../global/title.dart';


class RoomUtilitiesBody extends StatefulWidget {
  const RoomUtilitiesBody({
    Key? key, this.data,
  }) : super(key: key);
  final data;

  @override
  State<RoomUtilitiesBody> createState() => _RoomUtilitiesBodyState();
}

class _RoomUtilitiesBodyState extends State<RoomUtilitiesBody> {
  bool error = false;

  @override
  void initState() {
    super.initState();
    FlutterError.onError = (FlutterErrorDetails detail){
      setState(() {
        error = true;
      });
    };
  }

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
            widget.data.description!,
            textAlign: TextAlign.justify,
            style: const TextStyle(height: 1.6),
          ),
          const TitleWidget(title: "Tiện ích trong phòng"),
          Wrap(
            children: List.generate(
              widget.data.facilities.length, 
              (index) => RoomUtilities(facilities: widget.data.facilities[index],)
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
          image: error ? const AssetImage("assets/images/img_error.jpg") : NetworkImage(picUrl) as ImageProvider,
          fit: BoxFit.cover
        )
      ),
    );
  }

  String getUrl(){
    try{
      return widget.data.banner!;
    }
    catch(e){
      return widget.data.photos[0];
    }
  }
}
