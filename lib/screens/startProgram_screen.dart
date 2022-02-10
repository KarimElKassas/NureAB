import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nureab/screens/program_setup_screen.dart';
import 'package:nureab/shared/constants.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import 'bottomNavigation.dart';

class StartProgram extends StatefulWidget {
  final int duration;

  const StartProgram({Key key, @required this.duration}) : super(key: key);
  @override
  _StartProgramState createState() => _StartProgramState();
}

const TWO_PI = 3.14 * 2;

class _StartProgramState extends State<StartProgram>
    with SingleTickerProviderStateMixin {
  Color mColor = Color(0x2FF003D8C);
  String btnText = 'Pause';
  bool isChecked = false;
  AnimationController _animationController;

  @override
  void initState() {
    print('*********************  ${(widget.duration)}');
    _animationController =
        AnimationController(vsync: this, duration:  Duration(minutes: (widget.duration) ));
    _animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = 250.0;
    return Scaffold(
      body: SafeArea(
        child: WillPopScope(
          // ignore: missing_return
          onWillPop: () {
            if(Navigator.canPop(context)){
              Navigator.pop(context);
            }
          },
          child: Column(
            children: [
              Container(
                height: 40.h,
                color: greyFiveColor,
                child: Padding(
                    padding: const EdgeInsets.all(8.0), child: Container()),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16.h, left: 16.w, right: 16.w),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      height: 40.h,
                      width: 40.w,
                      child: Container(
                        child: Icon(Icons.play_arrow),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: greyFiveColor),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 80,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: AutoSizeText(
                              "Program Progress",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: ScreenUtil()
                                    .setSp(16, allowFontScalingSelf: true),
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
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: AutoSizeText(
                              "PIP Treatment Program",
                              style: TextStyle(
                                fontSize: ScreenUtil()
                                    .setSp(14, allowFontScalingSelf: true),
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
              SizedBox(
                height: 80.h,
              ),
              TweenAnimationBuilder(
                tween: Tween(begin: 0.0, end: 1.0),
                duration: Duration(minutes: (widget.duration)),
                builder: (context, value, child) {
                  int percentage = (value * 100).ceil();
                  //print(percentage);
                  if (percentage == 100) {
                    btnText = 'Repeat';
                  }
                  return Center(
                      child: Column(
                    children: [
                      Container(
                        width: size,
                        height: size,
                        child: Stack(
                          children: [
                            ShaderMask(
                              shaderCallback: (rect) {
                                return SweepGradient(
                                    startAngle: 0.0,
                                    endAngle: TWO_PI,
                                    stops: [value, value],
                                    center: Alignment.center,
                                    colors: [
                                      percentage == 100
                                          ? Colors.green
                                          : Color(0x2FF003D8C),
                                      Colors.grey.withAlpha(55)
                                    ]).createShader(rect);
                              },
                              child: Container(
                                width: size,
                                height: size,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white),
                              ),
                            ),
                            Center(
                              child: Container(
                                width: size - 25,
                                height: size - 25,
                                child: Center(
                                  child: RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                        fontSize: ScreenUtil().setSp(18,
                                            allowFontScalingSelf: true),
                                        fontFamily: "Open Sans",
                                        color: Colors.white,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: '$percentage %',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 40,
                                              color: Color(0x2FF003D8C)),
                                        ),
                                        TextSpan(
                                          text: "\n     ${widget.duration}:00",
                                          style: TextStyle(
                                              color: Color(0x2FF003D8C),
                                              fontSize: ScreenUtil().setSp(20,
                                                  allowFontScalingSelf: true),
                                              fontFamily: "Open Sans",
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 60.0.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: defaultButton(
                          function: () {
                            navigateTo(context, StartProgram(duration: widget.duration,));
                          },
                          text: percentage == 100 ? 'Repeat' : 'Pause',
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
                      ),
                      SizedBox(
                        height: 16.0.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: defaultButton(
                          function: () {
                            if (percentage == 100) {
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
                                        child: Container(
                                          height: 320.h,
                                          width: double.infinity,
                                          child: Column(
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
                                                    "Patient take off the device?",
                                                    style: TextStyle(
                                                        fontSize: ScreenUtil()
                                                            .setSp(16,
                                                                allowFontScalingSelf:
                                                                    true),
                                                        color: darkBlueColor,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    textAlign: TextAlign.center,
                                                  )),
                                              SizedBox(
                                                height: 8.h,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 16),
                                                child: Divider(
                                                  thickness: 2,
                                                  color: greyColor,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 8.h,
                                              ),
                                              Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 20),
                                                  child: AutoSizeText(
                                                    "To keep you patient’s hand safe we need a confirmation that he/she have taken the device off so the device return to it’s default postion",
                                                    style: TextStyle(
                                                      fontSize: ScreenUtil().setSp(
                                                          13,
                                                          allowFontScalingSelf:
                                                              true),
                                                      color: darkBlueColor,
                                                    ),
                                                    textAlign: TextAlign.start,
                                                  )),
                                              SizedBox(
                                                height: 8.h,
                                              ),
                                              Row(
                                                children: [
                                                  Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 20),
                                                      child: AutoSizeText(
                                                        "Take off the device",
                                                        style: TextStyle(
                                                            fontSize: ScreenUtil()
                                                                .setSp(14,
                                                                    allowFontScalingSelf:
                                                                        true),
                                                            color:
                                                                greySubTitleColor,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                        textAlign:
                                                            TextAlign.start,
                                                      )),
                                                  Checkbox(
                                                    value: isChecked,
                                                    onChanged: (newValue) {
                                                      setState(() {
                                                        isChecked = newValue;
                                                        print(
                                                            'is checked $isChecked');
                                                      });
                                                    },
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 16.h,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      flex: 1,
                                                      child: defaultButton(
                                                        function: ()async {

                                                          await writeProgramSettings();

                                                          navigateAndFinish(
                                                              context,
                                                              BottomNavigation(
                                                                comingIndex: 0,
                                                              ));
                                                        },
                                                        text: "Yes,Taken Off",
                                                        background:
                                                            lightSecondaryColor,
                                                        borderColor:
                                                            lightSecondaryColor,
                                                        isUpperCase: false,
                                                        textStyle: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            fontSize: ScreenUtil()
                                                                .setSp(14,
                                                                    allowFontScalingSelf:
                                                                        true),
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 8.0.w,
                                                    ),
                                                    Expanded(
                                                      flex: 1,
                                                      child: defaultButton(
                                                        function: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        text: "Keep Position",
                                                        background:
                                                            greyFiveColor,
                                                        textColor:
                                                            darkBlueColor,
                                                        borderColor:
                                                            greyFiveColor,
                                                        isUpperCase: false,
                                                        textStyle: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            fontSize: ScreenUtil()
                                                                .setSp(14,
                                                                    allowFontScalingSelf:
                                                                        true),
                                                            color: Color(
                                                                0xff0F2644)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              );
                            }else{
                              if (Navigator.canPop(context)) {
                                Navigator.pop(context);
                              } else {
                                SystemNavigator.pop();
                              }
                            }
                          },
                          text: percentage == 100 ? 'End Session' : 'Cancel',
                          textStyle: TextStyle(
                            color: darkBlueColor,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                            fontSize: ScreenUtil()
                                .setSp(16, allowFontScalingSelf: true),
                          ),
                          isUpperCase: false,
                          background: greyFiveColor,
                          borderColor: greyFiveColor,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      percentage == 100
                          ? InkWell(
                              onTap: () {
                                if (Navigator.canPop(context)) {
                                  Navigator.pop(context);
                                } else {
                                  SystemNavigator.pop();
                                }
                              },
                              child: RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    fontSize: ScreenUtil()
                                        .setSp(18, allowFontScalingSelf: true),
                                    fontFamily: "Open Sans",
                                    color: Colors.white,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Start ',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Color(0x2FF003D8C)),
                                    ),
                                    TextSpan(
                                      text: "New Program",
                                      style: TextStyle(
                                        color: secondaryColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: ScreenUtil().setSp(20,
                                            allowFontScalingSelf: true),
                                        decoration: TextDecoration.underline,
                                        fontFamily: "Open Sans",
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future<String> getLocalPath() async {
    var folder = await getApplicationDocumentsDirectory();
    return folder.path;
  }

  String path;

  Future<File> getLocalFile() async {
    path = await getLocalPath();
    print('path is $path');

    return File('$path/programSettings.txt');
  }

  Future<void> writeProgramSettings() async {
    File file = await getLocalFile();

    file.writeAsString(
        '10 \n 0 \n 0 \n 0 \n 0 \n 0 \n 0 \n 0 \n 0 ');
    await Share.shareFiles(['$path/programSettings.txt'],
        text: 'Program Settings');
  }
}

