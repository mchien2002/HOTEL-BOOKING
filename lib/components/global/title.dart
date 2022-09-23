import 'package:flutter/material.dart';
import 'package:hotel_service/data_sources/init.dart';

import '../../views/search_screen/search_showmore_screen.dart';

class TitleWidget extends StatefulWidget {
  const TitleWidget({
    Key? key,
    required this.title, this.more
  }) : super(key: key);
  // TITLE FOR LIST HOTEL 
  // BUILD BUTTON TO SHOW MORE HOTEL
  final String title;
  final String? more;

  @override
  State<TitleWidget> createState() => _TitleWidgetState();
}

class _TitleWidgetState extends State<TitleWidget> {
  @override
  Widget build(BuildContext context) {
    // BUILD TITLE WIDGET 
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
      child: Row(
        children: [
          Text(
            widget.title, 
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          const Expanded(child: Divider()),
          widget.more != null ? InkWell(
            onTap: () => buildPress(widget.title),
            child: Text(
              widget.more!, 
              style: const TextStyle(color: color929394,)
            )
          ) : Container(),
        ],
      ),
    );
  }
  // FUNCTION ENFORCEMENT EVENT WHEN WE CLICK
  void buildPress(String title){
    Navigator.push(
      context, 
      MaterialPageRoute(builder: (context) => SearchShowMoreScreen(title: title))
    );
  }
}