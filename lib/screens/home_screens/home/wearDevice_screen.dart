import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nureab/cubit/wear_device/wear_device_cubit.dart';
import 'package:nureab/cubit/wear_device/wear_device_states.dart';
import 'package:nureab/shared/constants.dart';
import 'package:nureab/shared/widgets/rectangle_number.dart';
import 'package:auto_size_text/auto_size_text.dart';


class WearDevice extends StatefulWidget {
  const WearDevice({Key key}) : super(key: key);

  @override
  _WearDeviceState createState() => _WearDeviceState();
}

class _WearDeviceState extends State<WearDevice> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WearDeviceCubit(),
      child: BlocConsumer<WearDeviceCubit, WearDeviceStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = WearDeviceCubit.get(context);

          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  Container(
                    color: greyFiveColor,
                    child: InkWell(
                      onTap: () {
                        if (Navigator.canPop(context)) {
                          Navigator.pop(context);
                        } else {
                          SystemNavigator.pop();
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                            alignment: Alignment.topRight,
                            child: Icon(
                              Icons.close,
                              size: 40,
                            )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, top: 20),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: AutoSizeText(
                          'Adjust Device Wearing settings ',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: ScreenUtil()
                                  .setSp(18, allowFontScalingSelf: true),
                              color: darkBlueColor),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, top: 8, right: 16),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: AutoSizeText(
                          'Enter Patient’s current Hand angel to adjust the thedevice to be wearable.',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: ScreenUtil()
                                  .setSp(14, allowFontScalingSelf: true),
                              color: darkBlueColor),
                        )),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, top: 40, right: 16),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: AutoSizeText(
                          'PIP Angle',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: ScreenUtil()
                                  .setSp(14, allowFontScalingSelf: true),
                              color: Colors.black),
                        )),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RectangleNumber(num: '0'),
                      Container(
                        width: 270.w,
                        child: Slider(
                          value: cubit.PIP,
                          thumbColor: darkBlueColor,
                          onChanged: (newRating) {
                            cubit.changePIP(newRating);
                          },
                          min: 0,
                          max: 100,
                        ),
                      ),
                      RectangleNumber(num: cubit.PIP.round().toString()),
                    ],
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Divider(
                      thickness: 2,
                      color: greyColor,
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: AutoSizeText(
                          'MCP Angle',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: ScreenUtil()
                                  .setSp(14, allowFontScalingSelf: true),
                              color: Colors.black),
                        )),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RectangleNumber(num: '0'),
                      Container(
                        width: 270.w,
                        child: Slider(
                          value: cubit.MCP,
                          thumbColor: darkBlueColor,
                          onChanged: (newRating) {
                            cubit.changeMCP(newRating);
                          },
                          min: 0,
                          max: 90,
                        ),
                      ),
                      RectangleNumber(num: cubit.MCP.round().toString()),
                    ],
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Divider(
                      thickness: 2,
                      color: greyColor,
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: AutoSizeText(
                          'Thumb Angle',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: ScreenUtil()
                                  .setSp(14, allowFontScalingSelf: true),
                              color: Colors.black),
                        )),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RectangleNumber(num: '0'),
                      Container(
                        width: 270.w,
                        child: Slider(
                          value: cubit.Thumb,
                          thumbColor: darkBlueColor,
                          onChanged: (newRating) {
                            cubit.changeThumb(newRating);
                          },
                          min: 0,
                          max: 90,
                        ),
                      ),
                      RectangleNumber(num: cubit.Thumb.round().toString()),
                    ],
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Divider(
                      thickness: 2,
                      color: greyColor,
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: defaultButton(
                      function: () {
                        showDialog(
                          context: context,
                          builder: (dialogContext) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Container(
                                height: 430.h,
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 40.h,
                                    ),
                                    Container(
                                      width: 150.w,
                                      height: 150.h,
                                      child: SvgPicture.asset(
                                        "assets/images/checked.svg",
                                      ),
                                    ),
                                    SizedBox(
                                      height: 40.h,
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: AutoSizeText(
                                          "Your Patient Can now Wear\nthe Device",
                                          style: TextStyle(
                                              fontSize: ScreenUtil().setSp(18,
                                                  allowFontScalingSelf: true),
                                              color: darkBlueColor,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        )),
                                    SizedBox(
                                      height: 40.h,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      child: defaultButton(
                                        function: () {
                                          Navigator.pop(dialogContext);
                                          if (Navigator.canPop(context)) {
                                            Navigator.pop(context);
                                          } else {
                                            SystemNavigator.pop();
                                          }
                                        },
                                        text: "Done",
                                        background: lightSecondaryColor,
                                        borderColor: lightSecondaryColor,
                                        isUpperCase: false,
                                        textStyle: const TextStyle(
                                            fontWeight: FontWeight.w800,
                                            letterSpacing: 1.5,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      text: "Done",
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
                        if (Navigator.canPop(context)) {
                          Navigator.pop(context);
                        } else {
                          SystemNavigator.pop();
                        }                      },
                      text: "Later",
                      background: greySixColor,
                      borderColor: greyFiveColor,
                      isUpperCase: false,
                      textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: ScreenUtil()
                              .setSp(16, allowFontScalingSelf: true),
                          color: Colors.indigo),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
