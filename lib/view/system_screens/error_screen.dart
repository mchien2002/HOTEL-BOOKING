// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import '../../data_sources/init.dart';

class ErrorScreen extends StatefulWidget {
  const ErrorScreen({Key? key, required this.errorMessage}) : super(key: key);
  final String errorMessage;

  @override
  _ErrorScreenState createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/img_data_error.png"),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "SOME THING WENT WRONG!",
            style: TextStyle(color: color777777),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            widget.errorMessage,
            style: const TextStyle(color: color777777),
          ),
        ],
      ),
    );
  }
}
