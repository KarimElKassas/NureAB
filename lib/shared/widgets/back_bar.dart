import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';import 'package:auto_size_text/auto_size_text.dart';

class BackBar extends StatelessWidget {
final Widget destination;
BackBar({this.destination});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: greyFiveColor,
      child: InkWell(
        onTap: () {

          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          } else {
            SystemNavigator.pop();
          }

          /*navigateTo(
              context,
              destination);*/
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Icon(
                Icons.arrow_back_outlined,
                size: 30,
              ),
              SizedBox(
                width: 16.w,
              ),
              AutoSizeText(
                'Back',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 18),
              )
            ],
          ),
        ),
      ),
    );
  }
}