import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return TextField(
      // SEARCH TEXT BOX WIDGET
      textAlignVertical: TextAlignVertical.center,
      style: const TextStyle(fontSize: 11, color: Colors.black),
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.search,
          size: 20,
        ),
        filled: true,
        fillColor: const Color.fromARGB(255, 226, 225, 225),
        hintText: title,
        isCollapsed: true,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(7),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(7),
        ),
      ),
    );
  }
}
