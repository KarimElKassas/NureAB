import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nureab/cubit/wear_device/wear_device_cubit.dart';
import 'package:nureab/cubit/wear_device/wear_device_states.dart';
import 'package:nureab/shared/constants.dart';
import 'package:nureab/shared/widgets/back_bar.dart';
import 'package:nureab/shared/widgets/rectangle_number.dart';

import '../../bottomNavigation.dart';

class InternalWearDevice extends StatefulWidget {
  const InternalWearDevice({Key key}) : super(key: key);

  @override
  _InternalWearDeviceState createState() => _InternalWearDeviceState();
}

class _InternalWearDeviceState extends State<InternalWearDevice> {
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
         BackBar(),

                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16, top: 20),
                          child: Container(
                            height: 40.h,
                            width: 40.w,
                            child: Container(
                              child: Icon(
                                FontAwesomeIcons.solidHandPaper,
                                size: 25,
                                color: secondaryColor,
                              ),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: greyFiveColor),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 80.w,
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.w),
                                child: AutoSizeText(
                                  "Adjust Device Wearing settings ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: ScreenUtil().setSp(17,
                                        allowFontScalingSelf: true),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 5,
                                ),
                              ),
                              SizedBox(
                                height: 4.0.h,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.w),
                                child: AutoSizeText(
                                  "Enter Patient’s current Hand angel to adjust the thedevice to be wearable.",
                                  style: TextStyle(
                                    fontSize: ScreenUtil().setSp(13,
                                        allowFontScalingSelf: true),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 5,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
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
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, top: 16, right: 16),
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
                      RectangleNumber(num: '100'),
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
                          max: 100,
                        ),
                      ),
                      RectangleNumber(num: '90'),
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
                          max: 100,
                        ),
                      ),
                      RectangleNumber(num: '90'),
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
                          builder: (context) {
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
                                          cubit.navigate(
                                              context,
                                              BottomNavigation(
                                                comingIndex: 0,
                                              ));
                                        },
                                        text: "Next",
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
                      text: "Next",
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
      ),
    );
  }
}
