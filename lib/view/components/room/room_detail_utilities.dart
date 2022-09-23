// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../data_sources/init.dart';

class RoomUtilities extends StatelessWidget {
  const RoomUtilities({
    Key? key, required this.facilities,
  }) : super(key: key);
  final facilities;

  @override
  Widget build(BuildContext context) {
    // DETAIL UTILITIES
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      width: MediaQuery.of(context).size.width * .5 - 2 * paddingLR,
      child: Row(
        children: [
          SvgPicture.network(facilities.image!, height: 30, width: 30,),
          const SizedBox(width: 10,),
          Expanded(
            child: Text(
              facilities.name!, 
              style: const TextStyle(fontSize: 12), 
              overflow: TextOverflow.clip,
            )
          ),
        ],
      ),
    );
  }
}