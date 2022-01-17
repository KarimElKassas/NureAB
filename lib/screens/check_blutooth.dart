import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nureab/screens/bottomNavigation.dart';
import 'package:nureab/shared/constants.dart';

class CheckBlutooth extends StatelessWidget {
  const CheckBlutooth({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                  alignment: Alignment.topRight,
                  child: Icon(
                    Icons.close,
                    size: 40,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 20),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Activate Bluetooth',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize:
                            ScreenUtil().setSp(18, allowFontScalingSelf: true),
                        color: darkBlueColor),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 8, right: 16),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'To connect to your nureab device you need to activate the device bluetooth & connect it to your phone bluetooth.',
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize:
                            ScreenUtil().setSp(14, allowFontScalingSelf: true),
                        color: darkBlueColor),
                  )),
            ),
            SizedBox(
              height: 60.h,
            ),
            Image.asset('assets/images/bluetooth.png'),
            SizedBox(
              height: 60.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: defaultButton(
                function: () {
                  // cubit.navigate(context, RegistrationScreen());
                },
                text: "Activate Bluetooth",
                background: lightSecondaryColor,
                borderColor: lightSecondaryColor,
                isUpperCase: false,
                textStyle: const TextStyle(
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.5,
                    color: Colors.white),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: defaultButton(
                function: () {
                  navigateTo(context, BottomNavigation(comingIndex: 0,));
                },
                text: "Later",
                background: greySixColor,
                borderColor: greyFiveColor,
                isUpperCase: false,
                textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize:
                        ScreenUtil().setSp(16, allowFontScalingSelf: true),
                    color: Colors.indigo),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
