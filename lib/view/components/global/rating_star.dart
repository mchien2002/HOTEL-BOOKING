// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import '../../../data_sources/init.dart';

class RatingStarWidget extends StatelessWidget {
  RatingStarWidget({ Key? key, this.rate }) : super(key: key);
  // NUMBER OF RATE
  double? rate;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:  [
        Icon(Icons.star, color: rate! ~/ 1 == 0 ? color777777 : colorD67402 , size: 15,),
        Icon(Icons.star, color: rate! ~/ 2 == 0 ? color777777 : colorD67402 , size: 15,),
        Icon(Icons.star, color: rate! ~/ 3 == 0 ? color777777 : colorD67402 , size: 15,),
        Icon(Icons.star, color: rate! ~/ 4 == 0 ? color777777 : colorD67402 , size: 15,),
        Icon(Icons.star, color: rate! ~/ 5 == 0 ? color777777 : colorD67402 , size: 15,),
      ],
    );
  }
}