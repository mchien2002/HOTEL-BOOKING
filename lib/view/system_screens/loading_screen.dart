import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // BUILD LOADING SCREEN WHEN GET DATA FROM INTERNET
    return Center(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: const CircularProgressIndicator( 
          valueColor:  AlwaysStoppedAnimation<Color>(Colors.grey),
        ),
      )
    );
  }
}