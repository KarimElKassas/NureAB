import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nureab/cubit/treat_programs/treat_programs_cubit.dart';
import 'package:nureab/cubit/treat_programs/treat_programs_states.dart';
import 'package:nureab/screens/home_screens/home/treatNewPatient_screen.dart';
import 'package:nureab/screens/home_screens/home/tutorials_screen.dart';
import 'package:nureab/shared/constants.dart';
import 'package:nureab/shared/widgets/back_bar.dart';

import '../../bottomNavigation.dart';
import 'internal_wearDevice.dart';

class TreatmentProgramsScreen extends StatelessWidget {
  var radioSelected = 1;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TreatProgramsCubit(),
      child: BlocConsumer<TreatProgramsCubit, TreatProgramsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = TreatProgramsCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: greyFiveColor,
                statusBarIconBrightness: Brightness.dark,
                // For Android (dark icons)
                statusBarBrightness: Brightness.light, // For iOS (dark icons)
              ),
              toolbarHeight: 0,
              elevation: 0,
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackBar(),
                SizedBox(
                  height: 24.0.h,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: AutoSizeText(
                            "Treatment Programs",
                            style: TextStyle(
                                color: darkBlueColor,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 1.0,
                                fontSize: ScreenUtil()
                                    .setSp(26, allowFontScalingSelf: true),
                                overflow: TextOverflow.ellipsis),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 5,
                          ),
                        ),
                        SizedBox(
                          height: 24.0.h,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 10.0.w,
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  defaultButtonOnlyIcon(
                                    function: () {
                                      if (!cubit.isPIP) {
                                        cubit.changePIP();
                                      }
                                    },
                                    isSvg: true,
                                    svgPath: cubit.isPIP
                                        ? "assets/images/whiteHandPIP.svg"
                                        : "assets/images/darkHandPIP.svg",
                                    background: cubit.isPIP
                                        ? darkBlueColor
                                        : greyFiveColor,
                                    borderColor: cubit.isPIP
                                        ? darkBlueColor
                                        : greyFiveColor,
                                  ),
                                  SizedBox(
                                    height: 8.0.h,
                                  ),
                                  AutoSizeText(
                                    "PIP",
                                    style: TextStyle(
                                      color: darkBlueColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: ScreenUtil().setSp(16,
                                          allowFontScalingSelf: true),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 6.0.w,
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  defaultButtonOnlyIcon(
                                    function: () {
                                      if (!cubit.isMCP) {
                                        cubit.changeMCP();
                                      }
                                    },
                                    isSvg: true,
                                    svgPath: cubit.isMCP
                                        ? "assets/images/whiteHandMCP.svg"
                                        : "assets/images/darkHandMCP.svg",
                                    background: cubit.isMCP
                                        ? darkBlueColor
                                        : greyFiveColor,
                                    borderColor: cubit.isMCP
                                        ? darkBlueColor
                                        : greyFiveColor,
                                  ),
                                  SizedBox(
                                    height: 8.0.h,
                                  ),
                                  AutoSizeText(
                                    "MCP",
                                    style: TextStyle(
                                      color: darkBlueColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: ScreenUtil().setSp(16,
                                          allowFontScalingSelf: true),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 6.0.w,
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  defaultButtonOnlyIcon(
                                    function: () {
                                      if (!cubit.isThumb) {
                                        cubit.changeThumb();
                                      }
                                    },
                                    isSvg: true,
                                    svgPath: cubit.isThumb
                                        ? "assets/images/whiteHandThumb.svg"
                                        : "assets/images/darkHandThumb.svg",
                                    background: cubit.isThumb
                                        ? darkBlueColor
                                        : greyFiveColor,
                                    borderColor: cubit.isThumb
                                        ? darkBlueColor
                                        : greyFiveColor,
                                  ),
                                  SizedBox(
                                    height: 8.0.h,
                                  ),
                                  AutoSizeText(
                                    "Thumb",
                                    style: TextStyle(
                                      color: darkBlueColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: ScreenUtil().setSp(16,
                                          allowFontScalingSelf: true),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 6.0.w,
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  defaultButtonOnlyIcon(
                                    function: () {
                                      if (!cubit.isStroke) {
                                        cubit.changeStroke();
                                      }
                                    },
                                    isSvg: true,
                                    svgPath: cubit.isStroke
                                        ? "assets/images/yellowStroke.svg"
                                        : "assets/images/darkStroke.svg",
                                    background: cubit.isStroke
                                        ? darkBlueColor
                                        : greyFiveColor,
                                    borderColor: cubit.isStroke
                                        ? darkBlueColor
                                        : greyFiveColor,
                                  ),
                                  SizedBox(
                                    height: 8.0.h,
                                  ),
                                  AutoSizeText(
                                    "Stroke",
                                    style: TextStyle(
                                      color: darkBlueColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: ScreenUtil().setSp(16,
                                          allowFontScalingSelf: true),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 10.0.w,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 24.0.h,
                        ),
                        Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                  height: 250.h,
                                  width: MediaQuery.of(context).size.width,
                                  child: Image.asset(
                                    'assets/images/videoThumbnail.png',
                                    fit: BoxFit.fill,
                                  )),
                            ),
                            Positioned(
                                top: 120.h,
                                right: 0,
                                left: 0,
                                child: SvgPicture.asset(
                                  'assets/images/play.svg',
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 16.0.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText(
                                cubit.programDescriptionHead,
                                style: TextStyle(
                                    color: darkBlueColor,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 1.0,
                                    fontSize: ScreenUtil()
                                        .setSp(18, allowFontScalingSelf: true),
                                    overflow: TextOverflow.ellipsis),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 5,
                              ),
                              SizedBox(
                                height: 8.0.h,
                              ),
                              AutoSizeText(
                                cubit.programDescription,
                                style: TextStyle(
                                    color: Colors.grey,
                                    letterSpacing: 1.0,
                                    fontSize: ScreenUtil()
                                        .setSp(16, allowFontScalingSelf: true),
                                    overflow: TextOverflow.ellipsis),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 5,
                              ),
                              SizedBox(
                                height: 36.0.h,
                              ),
                              defaultButton(
                                function: () {




                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return StatefulBuilder(
                                        builder: (context, setState) {
                                          return Dialog(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 20.h,
                                                ),
                                                Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 20),
                                                    child: AutoSizeText(
                                                      "Patient's Type",
                                                      style: TextStyle(
                                                          fontSize: ScreenUtil()
                                                              .setSp(16,
                                                                  allowFontScalingSelf:
                                                                      true),
                                                          color:
                                                              darkBlueColor,
                                                          fontWeight:
                                                              FontWeight
                                                                  .bold),
                                                      textAlign:
                                                          TextAlign.center,
                                                    )),
                                                SizedBox(
                                                  height: 8.h,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 16),
                                                  child: Divider(
                                                    thickness: 2,
                                                    color: greyColor,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 8.h,
                                                ),
                                                InkWell(
                                                  onTap: (){
                                                    setState((){
                                                      radioSelected = 1;
                                                    });
                                                  },
                                                  child: Row(
                                                    children: [
                                                      Radio(
                                                          value: 1,
                                                          groupValue:
                                                              radioSelected,
                                                          activeColor:
                                                              darkBlueColor,
                                                          onChanged: (val) {
                                                            setState(() {
                                                              radioSelected =
                                                                  val;
                                                            });
                                                          }),
                                                      AutoSizeText(
                                                        "New Patient",
                                                        style: TextStyle(
                                                            fontSize: ScreenUtil()
                                                                .setSp(14,
                                                                    allowFontScalingSelf:
                                                                        true),
                                                            color:
                                                                darkBlueColor,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: (){
                                                    setState((){
                                                      radioSelected = 2;
                                                    });
                                                  },
                                                  child: Row(
                                                    children: [
                                                      Radio(
                                                          value: 2,
                                                          groupValue:
                                                              radioSelected,
                                                          activeColor:
                                                              darkBlueColor,
                                                          onChanged: (val) {
                                                            setState(() {
                                                              radioSelected =
                                                                  val;
                                                            });
                                                          }),
                                                      AutoSizeText(
                                                        "Exiting Patient",
                                                        style: TextStyle(
                                                            fontSize: ScreenUtil()
                                                                .setSp(14,
                                                                    allowFontScalingSelf:
                                                                        true),
                                                            color:
                                                                darkBlueColor,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ],
                                                  ),
                                                ),

                                                SizedBox(
                                                  height: 8.h,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 8),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        flex: 1,
                                                        child: defaultButton(
                                                          function: () {

                                                            showDialog(
                                                              context: context,
                                                              builder: (context) {
                                                                return StatefulBuilder(
                                                                  builder: (context, setState) {
                                                                    return Dialog(
                                                                      shape: RoundedRectangleBorder(
                                                                        borderRadius:
                                                                        BorderRadius.circular(15.0),
                                                                      ),
                                                                      child: Column(
                                                                        mainAxisSize: MainAxisSize.min,
                                                                        crossAxisAlignment:
                                                                        CrossAxisAlignment.start,
                                                                        children: [
                                                                          SizedBox(
                                                                            height: 20.h,
                                                                          ),
                                                                          Padding(
                                                                              padding: const EdgeInsets
                                                                                  .symmetric(
                                                                                  horizontal: 16),
                                                                              child: AutoSizeText(
                                                                                "Is the patient wearing the device?",
                                                                                style: TextStyle(
                                                                                    fontSize: ScreenUtil()
                                                                                        .setSp(14,
                                                                                        allowFontScalingSelf:
                                                                                        true),
                                                                                    color:
                                                                                    darkBlueColor,
                                                                                    fontWeight:
                                                                                    FontWeight
                                                                                        .bold),
                                                                                textAlign:
                                                                                TextAlign.start,
                                                                              )),
                                                                          SizedBox(
                                                                            height: 8.h,
                                                                          ),
                                                                          Padding(
                                                                            padding: const EdgeInsets
                                                                                .symmetric(
                                                                                horizontal: 16),
                                                                            child: Divider(
                                                                              thickness: 2,
                                                                              color: greyColor,
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                            height: 8.h,
                                                                          ),
                                                                          InkWell(
                                                                            onTap: (){
                                                                              setState((){
                                                                                radioSelected = 1;
                                                                              });
                                                                            },
                                                                            child: Padding(
                                                                              padding: const EdgeInsets.symmetric(horizontal: 16),
                                                                              child: Text("For the device to operate correctly we need the make sure the patient is wearing the device"),
                                                                            ),
                                                                          ),


                                                                          SizedBox(
                                                                            height: 8.h,
                                                                          ),
                                                                          Padding(
                                                                            padding: const EdgeInsets
                                                                                .symmetric(
                                                                                horizontal: 8),
                                                                            child: Row(
                                                                              mainAxisAlignment:
                                                                              MainAxisAlignment
                                                                                  .spaceBetween,
                                                                              children: [
                                                                                Expanded(
                                                                                  flex: 1,
                                                                                  child: defaultButton(
                                                                                    function: () {     navigateAndFinish(context, TreatNewPatientScreen());
                                                                                 /*     if (Navigator.canPop(context)) {
                                                                                        Navigator.pop(context);
                                                                                      } else {
                                                                                        SystemNavigator.pop();
                                                                                      }*/
                                                                                    },
                                                                                    text:
                                                                                    "Yes",
                                                                                    background:
                                                                                    lightSecondaryColor,
                                                                                    borderColor:
                                                                                    lightSecondaryColor,
                                                                                    isUpperCase: false,
                                                                                    textStyle: TextStyle(
                                                                                        fontSize: ScreenUtil()
                                                                                            .setSp(14,
                                                                                            allowFontScalingSelf:
                                                                                            true),
                                                                                        fontWeight:
                                                                                        FontWeight
                                                                                            .w800,
                                                                                        color: Colors
                                                                                            .white),
                                                                                  ),
                                                                                ),
                                                                                SizedBox(
                                                                                  width: 8.0.w,
                                                                                ),
                                                                                Expanded(
                                                                                  flex: 1,
                                                                                  child: defaultButton(
                                                                                    function: () {
                                                                                      navigateAndFinish(context, InternalWearDevice());
                                                                                 /*     if (Navigator.canPop(context)) {
                                                                                        Navigator.pop(context);
                                                                                      } else {
                                                                                        SystemNavigator.pop();
                                                                                      }*/
                                                                                    },
                                                                                    text:
                                                                                    "Device Wearing Settings",
                                                                                    background:
                                                                                    greyFiveColor,
                                                                                    textColor:
                                                                                    darkBlueColor,
                                                                                    borderColor:
                                                                                    greyFiveColor,
                                                                                    isUpperCase: false,
                                                                                    textStyle: TextStyle(
                                                                                        fontSize: ScreenUtil()
                                                                                            .setSp(10,
                                                                                            allowFontScalingSelf:
                                                                                            true),
                                                                                        fontWeight:
                                                                                        FontWeight
                                                                                            .w800,
                                                                                        color: Color(
                                                                                            0xff0F2644)),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                            height: 8.0.w,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                              },
                                                            );
                                                       /*     if (Navigator.canPop(context)) {
                                                              Navigator.pop(context);
                                                            } else {
                                                              SystemNavigator.pop();
                                                            }*/
                                                          },
                                                          text:
                                                              "Continue",
                                                          background:
                                                              lightSecondaryColor,
                                                          borderColor:
                                                              lightSecondaryColor,
                                                          isUpperCase: false,
                                                          textStyle: TextStyle(
                                                              fontSize: ScreenUtil()
                                                                  .setSp(14,
                                                                      allowFontScalingSelf:
                                                                          true),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                              color: Colors
                                                                  .white),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 8.0.w,
                                                      ),
                                                      Expanded(
                                                        flex: 1,
                                                        child: defaultButton(
                                                          function: () {
                                                            if (Navigator.canPop(context)) {
                                                              Navigator.pop(context);
                                                            } else {
                                                              SystemNavigator.pop();
                                                            }
                                                          },
                                                          text:
                                                              "Cancel",
                                                          background:
                                                              greyFiveColor,
                                                          textColor:
                                                              darkBlueColor,
                                                          borderColor:
                                                              greyFiveColor,
                                                          isUpperCase: false,
                                                          textStyle: TextStyle(
                                                              fontSize: ScreenUtil()
                                                                  .setSp(14,
                                                                      allowFontScalingSelf:
                                                                          true),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                              color: Color(
                                                                  0xff0F2644)),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 8.0.w,
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  );
                                },
                                text: "Start Program",
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.0,
                                  fontSize: ScreenUtil()
                                      .setSp(18, allowFontScalingSelf: true),
                                ),
                                isUpperCase: false,
                                background: lightSecondaryColor,
                                borderColor: lightSecondaryColor,
                              ),
                              SizedBox(
                                height: 36.0.h,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: Stack(
                            children: [
                              InkWell(
                                child: Container(
                                  height: 180.h,
                                  child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      elevation: 3,
                                      child: Image.asset(
                                        "assets/images/base.png",
                                        fit: BoxFit.fill,
                                      )),
                                ),
                                onTap: () {
                                  cubit.navigate(context, TutorialsScreen());
                                },
                              ),
                              Positioned(
                                top: 90.h,
                                left: 30.w,
                                child: Column(
                                  children: [
                                    AutoSizeText(
                                      "Tutorials",
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                          fontSize: ScreenUtil().setSp(24,
                                              allowFontScalingSelf: true),
                                          color: Colors.white),
                                    ),
                                    SizedBox(
                                      height: 4.h,
                                    ),
                                    AutoSizeText(
                                      "Here To help you",
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                          fontSize: ScreenUtil().setSp(18,
                                              allowFontScalingSelf: true),
                                          color: Colors.orange),
                                    )
                                  ],
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 36.0.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
