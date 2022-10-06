import 'package:flutter/material.dart';
import '../../../data_sources/init.dart';
import '../global/title.dart';

class RoomOtherRequirements extends StatefulWidget {
  const RoomOtherRequirements({
    Key? key,
    required this.textEditingController,
  }) : super(key: key);
  final TextEditingController textEditingController;

  @override
  State<RoomOtherRequirements> createState() => _RoomOtherRequirementsState();
}

class _RoomOtherRequirementsState extends State<RoomOtherRequirements> {
  bool clearButton = false;
  @override
  Widget build(BuildContext context) {
    // BUILD REQUIREMENTS WIDGET
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleWidget(title: "Yêu cầu đặt biệt khác"),
        const Text(
          "Không thể đảm bảo cho các yêu cầu đặt biệt, nhưng điểm lưu trú sẽ cố gắng đáp ứng các như cầu của bạn.",
          style: TextStyle(color: color777777),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Hãy cho chúng tôi biết yêu cầu của bạn",
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: paddingLR),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              border:
                  Border.all(color: const Color.fromARGB(255, 121, 120, 120))),
          child: TextFormField(
            controller: widget.textEditingController,
            keyboardType: TextInputType.text,
            maxLength: 200,
            maxLines: 8,
            onChanged: (text) {
              setState(() {
                clearButton = text.isNotEmpty;
              });
            },
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Vui lòng nhập yêu cầu của bạn ?",
                hintStyle: const TextStyle(
                    color: Color.fromARGB(255, 121, 120, 120), fontSize: 13),
                suffixIcon: clearButton
                    ? IconButton(
                        onPressed: () {
                          widget.textEditingController.clear();
                          setState(() {
                            clearButton = false;
                          });
                        },
                        icon: const Icon(
                          Icons.cancel,
                          color: color777777,
                          size: 20,
                        ))
                    : null),
          ),
        ),
      ],
    );
  }
}
