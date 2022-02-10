import 'package:auto_size_text/auto_size_text.dart';
import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nureab/cubit/patient_details/patient_details_cubit.dart';
import 'package:nureab/cubit/patient_details/patient_details_states.dart';
import 'package:nureab/screens/bottomNavigation.dart';
import 'package:nureab/screens/program_setup_screen.dart';
import 'package:nureab/shared/constants.dart';
import 'package:nureab/shared/widgets/back_bar.dart';
import 'package:nureab/shared/widgets/select_drop_list.dart';

class PatientListDetails extends StatefulWidget {
  const PatientListDetails({Key key}) : super(key: key);

  @override
  _PatientListDetailsState createState() => _PatientListDetailsState();
}

class _PatientListDetailsState extends State<PatientListDetails> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => PatientDetailsCubit(),
        child: BlocConsumer<PatientDetailsCubit, PatientDetailsStates>(
            listener: (context, state) {},
            builder: (context, state) {
              var cubit = PatientDetailsCubit.get(context);

              return Scaffold(
                backgroundColor: Colors.white,
                body: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BackBar(
                        destination: BottomNavigation(
                          comingIndex: 1,
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(top: 18.0.h, right: 16.0.w),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    child: defaultButton(
                                      function: () {
                                        cubit.navigate(
                                            context, ProgramSetupScreen());
                                      },
                                      text: "Start New Program",
                                      background: lightSecondaryColor,
                                      borderColor: lightSecondaryColor,
                                      isUpperCase: false,
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: ScreenUtil().setSp(14,
                                              allowFontScalingSelf: true),
                                          color: Colors.white),
                                    ),
                                    width: 200.w,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(top: 18.0.h, left: 18.0.w),
                                child: AutoSizeText(
                                  'Patient’s Information',
                                  style: TextStyle(
                                      color: darkBlueColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: ScreenUtil().setSp(18,
                                          allowFontScalingSelf: true)),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 180.h,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Card(
                                      color: darkBlueColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      elevation: 4,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(14),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                AutoSizeText(
                                                  'Karim Mahdi',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                      fontSize: ScreenUtil().setSp(
                                                          16,
                                                          allowFontScalingSelf:
                                                              true)),
                                                ),
                                                AutoSizeText('Started:2/4/2021',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: ScreenUtil()
                                                            .setSp(16,
                                                                allowFontScalingSelf:
                                                                    true)))
                                              ],
                                            ),
                                          ),
                                          Spacer(),
                                          Padding(
                                            padding: const EdgeInsets.all(14.0),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.male,
                                                  color: orangeColor,
                                                  size: 30,
                                                ),
                                                SizedBox(
                                                  width: 16.w,
                                                ),
                                                AutoSizeText('42',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white,
                                                        fontSize: ScreenUtil()
                                                            .setSp(16,
                                                                allowFontScalingSelf:
                                                                    true))),
                                                Expanded(child: Container()),
                                                AutoSizeText('3 Sessions',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white,
                                                        fontSize: ScreenUtil()
                                                            .setSp(16,
                                                                allowFontScalingSelf:
                                                                    true))),
                                              ],
                                            ),
                                          )
                                        ],
                                      )),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: defaultButtonWithIcon(
                                          function: () {
                                            if (!cubit.firstView) {
                                              cubit.changeView();
                                            }
                                          },
                                          radius: 25,
                                          background: cubit.firstView
                                              ? orangeColor
                                              : greyFiveColor,
                                          borderColor: cubit.firstView
                                              ? orangeColor
                                              : greyFiveColor,
                                          text: "Past Programs",
                                          isUpperCase: false,
                                          isSvg: false,
                                          textStyle: TextStyle(
                                            color: darkBlueColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: ScreenUtil().setSp(12,
                                                allowFontScalingSelf: true),
                                          ),
                                          icon: FontAwesomeIcons.solidHandPaper,
                                          iconColor: secondaryColor),
                                    ),
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: defaultButtonWithIcon(
                                          function: () {
                                            if (cubit.firstView) {
                                              cubit.changeView();
                                            }
                                          },
                                          radius: 25,
                                          background: cubit.firstView
                                              ? greyFiveColor
                                              : orangeColor,
                                          borderColor: cubit.firstView
                                              ? greyFiveColor
                                              : orangeColor,
                                          text: "Patients's Stats",
                                          isUpperCase: false,
                                          isSvg: false,
                                          textStyle: TextStyle(
                                            color: darkBlueColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: ScreenUtil().setSp(12,
                                                allowFontScalingSelf: true),
                                          ),
                                          icon: Icons.assessment_outlined,
                                          iconColor: secondaryColor),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 12.h,
                              ),
                              BuildCondition(
                                condition: cubit.firstView,
                                fallback: (context) {
                                  return Stack(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Container(
                                            height: 600.h,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: SvgPicture.asset(
                                              'assets/images/Frame.svg',
                                              fit: BoxFit.fill,
                                            )),
                                      ),
                                      Positioned(
                                        top: 25,
                                        right: 25,
                                        left: 160,
                                        child: SelectDropList(
                                            cubit.idOptionItemSelected,
                                            cubit.idDropListModel,
                                            (optionItem) {
                                          cubit.changeGraphIndex(optionItem);
                                        }, null),
                                      ),
                                    ],
                                  );
                                },
                                builder: (context) {
                                  return ListView.builder(
                                    physics: BouncingScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return InkWell(
                                        onTap: () {
                                          //navigateTo(context, PatientListDetails());
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8, right: 8, bottom: 8),
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            elevation: 4,
                                            color: greyFiveColor,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(12.0),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 4),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        AutoSizeText(
                                                          'Done 6/4/2021',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  darkBlueColor,
                                                              fontSize: ScreenUtil()
                                                                  .setSp(16,
                                                                      allowFontScalingSelf:
                                                                          true)),
                                                        ),
                                                        AutoSizeText(
                                                            'PIP Program',
                                                            style: TextStyle(
                                                                color:
                                                                    darkBlueColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: ScreenUtil()
                                                                    .setSp(16,
                                                                        allowFontScalingSelf:
                                                                            true)))
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 6),
                                                    child: Divider(
                                                      thickness: 2,
                                                      color: Color(0xFFD4DDE8),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 8.h,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      RichText(
                                                        text: TextSpan(
                                                          style: TextStyle(
                                                            fontSize: ScreenUtil()
                                                                .setSp(16,
                                                                    allowFontScalingSelf:
                                                                        true),
                                                            fontFamily:
                                                                "Open Sans",
                                                            color: Colors.white,
                                                          ),
                                                          children: <TextSpan>[
                                                            TextSpan(
                                                              text: "40 ",
                                                              style: TextStyle(
                                                                color:
                                                                    darkBlueColor,
                                                                fontFamily:
                                                                    "Open Sans",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: ScreenUtil()
                                                                    .setSp(16,
                                                                        allowFontScalingSelf:
                                                                            true),
                                                              ),
                                                            ),
                                                            TextSpan(
                                                              text: "MIN",
                                                              style: TextStyle(
                                                                  color:
                                                                      darkBlueColor,
                                                                  fontSize: ScreenUtil().setSp(
                                                                      16,
                                                                      allowFontScalingSelf:
                                                                          true),
                                                                  fontFamily:
                                                                      "Open Sans",
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      RichText(
                                                        text: TextSpan(
                                                          style: TextStyle(
                                                            fontSize: ScreenUtil()
                                                                .setSp(16,
                                                                    allowFontScalingSelf:
                                                                        true),
                                                            fontFamily:
                                                                "Open Sans",
                                                            color: Colors.white,
                                                          ),
                                                          children: <TextSpan>[
                                                            TextSpan(
                                                              text: "2x ",
                                                              style: TextStyle(
                                                                color:
                                                                    darkBlueColor,
                                                                fontFamily:
                                                                    "Open Sans",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: ScreenUtil()
                                                                    .setSp(16,
                                                                        allowFontScalingSelf:
                                                                            true),
                                                              ),
                                                            ),
                                                            TextSpan(
                                                              text: "repeat",
                                                              style: TextStyle(
                                                                  color:
                                                                      darkBlueColor,
                                                                  fontSize: ScreenUtil().setSp(
                                                                      16,
                                                                      allowFontScalingSelf:
                                                                          true),
                                                                  fontFamily:
                                                                      "Open Sans",
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      AutoSizeText(
                                                        'With vibration',
                                                        style: TextStyle(
                                                            color:
                                                                darkBlueColor,
                                                            fontSize: ScreenUtil()
                                                                .setSp(16,
                                                                    allowFontScalingSelf:
                                                                        true),
                                                            fontFamily:
                                                                "Open Sans",
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 8.h,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      RichText(
                                                        text: TextSpan(
                                                          style: TextStyle(
                                                            fontSize: ScreenUtil()
                                                                .setSp(16,
                                                                    allowFontScalingSelf:
                                                                        true),
                                                            fontFamily:
                                                                "Open Sans",
                                                            color: Colors.white,
                                                          ),
                                                          children: <TextSpan>[
                                                            TextSpan(
                                                              text:
                                                                  "Angle From ",
                                                              style: TextStyle(
                                                                color:
                                                                    darkBlueColor,
                                                                fontFamily:
                                                                    "Open Sans",
                                                                fontSize: ScreenUtil()
                                                                    .setSp(16,
                                                                        allowFontScalingSelf:
                                                                            true),
                                                              ),
                                                            ),
                                                            TextSpan(
                                                              text: "30 ",
                                                              style: TextStyle(
                                                                  color:
                                                                      darkBlueColor,
                                                                  fontSize: ScreenUtil().setSp(
                                                                      16,
                                                                      allowFontScalingSelf:
                                                                          true),
                                                                  fontFamily:
                                                                      "Open Sans",
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis),
                                                            ),
                                                            TextSpan(
                                                              text: "to ",
                                                              style: TextStyle(
                                                                  color:
                                                                      darkBlueColor,
                                                                  fontSize: ScreenUtil().setSp(
                                                                      16,
                                                                      allowFontScalingSelf:
                                                                          true),
                                                                  fontFamily:
                                                                      "Open Sans",
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis),
                                                            ),
                                                            TextSpan(
                                                              text: "90 ",
                                                              style: TextStyle(
                                                                  color:
                                                                      darkBlueColor,
                                                                  fontSize: ScreenUtil().setSp(
                                                                      16,
                                                                      allowFontScalingSelf:
                                                                          true),
                                                                  fontFamily:
                                                                      "Open Sans",
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: () {},
                                                        child: AutoSizeText(
                                                          "Start Program",
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xFF219653),
                                                              fontSize: ScreenUtil()
                                                                  .setSp(16,
                                                                      allowFontScalingSelf:
                                                                          true),
                                                              fontFamily:
                                                                  "Open Sans",
                                                              decoration:
                                                                  TextDecoration
                                                                      .underline,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    itemCount: 8,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
    );
  }
}
