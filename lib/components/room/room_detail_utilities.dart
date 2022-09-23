// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../data_sources/init.dart';

class RoomUtilities extends StatefulWidget {
  const RoomUtilities({
    Key? key, required this.facilities,
  }) : super(key: key);
  final facilities;

  @override
  State<RoomUtilities> createState() => _RoomUtilitiesState();
}

class _RoomUtilitiesState extends State<RoomUtilities> {
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
    // DETAIL UTILITIES
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      width: MediaQuery.of(context).size.width * .5 - 2 * paddingLR,
      child: Row(
        children: [
          error ? Image.asset(
            "assets/images/img_error.jpg",
            height: 30, 
            width: 30,
          ) 
          : SvgPicture.network(
            widget.facilities.image!, 
            height: 30, 
            width: 30,
          ),
          const SizedBox(width: 10,),
          Expanded(
            child: Text(
              widget.facilities.name!, 
              style: const TextStyle(fontSize: 12), 
              overflow: TextOverflow.clip,
            )
          ),
        ],
      ),
    );
  }
}