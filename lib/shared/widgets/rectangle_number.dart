import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';

import '../constants.dart';

class RectangleNumber extends StatelessWidget {
  final String num;
  RectangleNumber({this.num});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: 50.w,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: greyFiveColor,
          borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Text(num,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: darkBlueColor,
                fontSize: 18)),
      ),
    );
  }
}