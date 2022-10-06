import 'package:flutter/material.dart';
import 'package:hotel_service/provider/booking_provider.dart';
import 'package:provider/provider.dart';
import '../../../data_sources/init.dart';

// ignore: must_be_immutable
class TextBox extends StatefulWidget {
  const TextBox(
      {Key? key,
      required this.title,
      required this.hintText,
      this.readOnly = false,
      required this.textEditingController})
      : super(key: key);
  // TITLE AND HINT TEXT FOR TEXT BOX
  final String title;
  final String hintText;
  final bool? readOnly;
  final TextEditingController textEditingController;
  @override
  State<TextBox> createState() => _TextBoxState();
}

class _TextBoxState extends State<TextBox> {
  bool clearButton = false;
  @override
  Widget build(BuildContext context) {
    if (widget.readOnly!) {
      widget.textEditingController.text = widget.hintText;
    }
    // BUILD TEXT BOX
    return Column(
      children: [
        Row(
          children: [
            Text(
              widget.title,
              style: const TextStyle(fontSize: 13),
            ),
            const Text(
              " *",
              style: TextStyle(color: Colors.red),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 45,
          child: TextField(
            controller: widget.textEditingController,
            onChanged: (text) {
              setState(() {
                clearButton = text.isNotEmpty;
              });
              context.read<BookingProvider>().checkButton();
            },
            readOnly: widget.readOnly!,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                hintText: widget.hintText,
                hintStyle: const TextStyle(
                    color: Color.fromARGB(255, 121, 120, 120), fontSize: 13),
                suffixIcon: clearButton
                    ? IconButton(
                        icon: const Icon(Icons.cancel,
                            color: color777777, size: 20),
                        onPressed: () {
                          widget.textEditingController.clear();
                          context.read<BookingProvider>().checkButton();
                          setState(() {
                            clearButton = false;
                          });
                        })
                    : null),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
