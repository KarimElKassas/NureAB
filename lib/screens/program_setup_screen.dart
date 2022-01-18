import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nureab/cubit/setup_program/setup_program_cubit.dart';
import 'package:nureab/cubit/setup_program/setup_program_states.dart';
import 'package:nureab/screens/bottomNavigation.dart';
import 'package:nureab/shared/constants.dart';
import 'package:nureab/shared/widgets/back_bar.dart';
import 'package:nureab/shared/widgets/rectangle_number.dart';
import 'package:nureab/shared/widgets/select_drop_list.dart';

class ProgramSetupScreen extends StatefulWidget {
  const ProgramSetupScreen({Key key}) : super(key: key);

  @override
  State<ProgramSetupScreen> createState() => _ProgramSetupScreenState();
}

class _ProgramSetupScreenState extends State<ProgramSetupScreen> {
  final durationController = TextEditingController();
  final repetitionController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    durationController.text = "40 Min";
    repetitionController.text = "2 x";
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProgramSetupCubit(),
      child: BlocConsumer<ProgramSetupCubit, ProgramSetupStates>(
        listener: (context, state) {
          if (state is ProgramSetupChangeDurationState) {
            durationController.text = state.duration;
          } else if (state is ProgramSetupChangeRepetitionState) {
            repetitionController.text = state.repetition;
          }
        },
        builder: (context, state) {
          var cubit = ProgramSetupCubit.get(context);

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
            body: SafeArea(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BackBar(
                      destination: BottomNavigation(
                        comingIndex: 0,
                      ),
                    ),
                    Expanded(
                        child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: 16.h, left: 16.w, right: 16.w),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  height: 40.h,
                                  width: 40.w,
                                  child: Container(
                                    child: SvgPicture.asset(
                                        "assets/images/controls.svg"),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: greyFiveColor),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width - 70,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16.w),
                                        child: Text(
                                          "Program Setup",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: ScreenUtil().setSp(18,
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
                                        child: Text(
                                          "Specify how you want the program to work.",
                                          style: TextStyle(
                                            fontSize: ScreenUtil().setSp(14,
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
                            height: 8.h,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Divider(
                              thickness: 2,
                              color: greyColor,
                            ),
                          ),
                          SizedBox(
                            height: 24.0.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: Text(
                              "Current Program :",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: ScreenUtil()
                                    .setSp(18, allowFontScalingSelf: true),
                                overflow: TextOverflow.ellipsis,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 5,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 20.w, right: 20.w, top: 12.h),
                            child: SelectDropList(cubit.idOptionItemSelected,
                                cubit.idDropListModel, (optionItem) {
                              cubit.changeProgramIndex(optionItem);

                              if (optionItem.id == 4) {
                                cubit.showGripVisibility();
                              } else {
                                cubit.hideGripVisibility();
                              }
                            }, null),
                          ),
                          SizedBox(
                            height: 18.h,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Divider(
                              thickness: 2,
                              color: greyColor,
                            ),
                          ),
                          SizedBox(
                            height: 24.0.h,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                child: Text(
                                  "Program Duration",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: ScreenUtil()
                                        .setSp(18, allowFontScalingSelf: true),
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
                                child: Text(
                                  "How Much the program will last",
                                  style: TextStyle(
                                    fontSize: ScreenUtil()
                                        .setSp(16, allowFontScalingSelf: true),
                                    color: Colors.grey,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 5,
                                ),
                              ),
                              SizedBox(
                                height: 18.0.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 20.0.w, right: 8.0.w),
                                      child: Container(
                                        height: 60.0.h,
                                        child: TextFormField(
                                          controller: durationController,
                                          keyboardType: TextInputType.text,
                                          readOnly: true,
                                          style: TextStyle(
                                            color: darkBlueColor,
                                            fontFamily: "Open Sans",
                                            fontSize: ScreenUtil().setSp(18,
                                                allowFontScalingSelf: true),
                                            fontWeight: FontWeight.w600,
                                          ),
                                          textAlign: TextAlign.center,
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: greyFiveColor,
                                            hintText: "40 Min",
                                            hintStyle: TextStyle(
                                                color: darkBlueColor,
                                                fontFamily: "Open Sans",
                                                fontSize: ScreenUtil().setSp(16,
                                                    allowFontScalingSelf: true),
                                                fontWeight: FontWeight.w600),
                                            alignLabelWithHint: true,
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: greyBorderColor,
                                                    width: 0.0),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8.0))),
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: greyBorderColor,
                                                  width: 0.0),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8.0)),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: greyBorderColor,
                                                    width: 0.0),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8.0))),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 8.0.w),
                                      child: Container(
                                        height: 60.0.h,
                                        child: defaultButtonOnlyIcon(
                                          function: () {
                                            var durationValue =
                                                durationController.text
                                                    .toString();

                                            var parts =
                                                durationValue.split(" ");

                                            var minusValue = int.parse(parts[0]
                                                    .trim()
                                                    .toString()) -
                                                1;

                                            var newDuration =
                                                "${minusValue.toString()} Min";

                                            if (minusValue > 0) {
                                              cubit.changeDuration(newDuration);
                                            }
                                          },
                                          isSvg: true,
                                          svgPath: "assets/images/minus.svg",
                                          background: greyFiveColor,
                                          borderColor: greyFiveColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 12.0.w),
                                      child: Container(
                                        height: 60.0.h,
                                        child: defaultButtonOnlyIcon(
                                          function: () {
                                            var durationValue =
                                                durationController.text
                                                    .toString();

                                            var parts =
                                                durationValue.split(" ");

                                            var minusValue = int.parse(parts[0]
                                                    .trim()
                                                    .toString()) +
                                                1;

                                            var newDuration =
                                                "${minusValue.toString()} Min";

                                            cubit.changeDuration(newDuration);
                                          },
                                          isSvg: true,
                                          svgPath: "assets/images/add.svg",
                                          background: greyFiveColor,
                                          borderColor: greyFiveColor,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 18.h,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Divider(
                              thickness: 2,
                              color: greyColor,
                            ),
                          ),
                          SizedBox(
                            height: 24.0.h,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                child: Text(
                                  "Program Repetition",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: ScreenUtil()
                                        .setSp(18, allowFontScalingSelf: true),
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
                                child: Text(
                                  "How many the program will repeat",
                                  style: TextStyle(
                                    fontSize: ScreenUtil()
                                        .setSp(16, allowFontScalingSelf: true),
                                    color: Colors.grey,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 5,
                                ),
                              ),
                              SizedBox(
                                height: 18.0.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 20.0.w, right: 8.0.w),
                                      child: Container(
                                        height: 60.0.h,
                                        child: TextFormField(
                                          controller: repetitionController,
                                          keyboardType: TextInputType.text,
                                          readOnly: true,
                                          style: TextStyle(
                                            color: darkBlueColor,
                                            fontFamily: "Open Sans",
                                            fontSize: ScreenUtil().setSp(18,
                                                allowFontScalingSelf: true),
                                            fontWeight: FontWeight.w600,
                                          ),
                                          textAlign: TextAlign.center,
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: greyFiveColor,
                                            hintText: "2 x",
                                            hintStyle: TextStyle(
                                                color: darkBlueColor,
                                                fontFamily: "Open Sans",
                                                fontSize: ScreenUtil().setSp(16,
                                                    allowFontScalingSelf: true),
                                                fontWeight: FontWeight.w600),
                                            alignLabelWithHint: true,
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: greyBorderColor,
                                                    width: 0.0),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8.0))),
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: greyBorderColor,
                                                  width: 0.0),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8.0)),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: greyBorderColor,
                                                    width: 0.0),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8.0))),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 8.0.w),
                                      child: Container(
                                        height: 60.0.h,
                                        child: defaultButtonOnlyIcon(
                                          function: () {
                                            var repetitionValue =
                                                repetitionController.text
                                                    .toString();

                                            var parts =
                                                repetitionValue.split(" ");

                                            var minusValue = int.parse(parts[0]
                                                    .trim()
                                                    .toString()) -
                                                1;

                                            var newRepetition =
                                                "${minusValue.toString()} x";

                                            if (minusValue > 0) {
                                              cubit.changeRepetition(
                                                  newRepetition);
                                            }
                                          },
                                          isSvg: true,
                                          svgPath: "assets/images/minus.svg",
                                          background: greyFiveColor,
                                          borderColor: greyFiveColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 12.0.w),
                                      child: Container(
                                        height: 60.0.h,
                                        child: defaultButtonOnlyIcon(
                                          function: () {
                                            var repetitionValue =
                                                repetitionController.text
                                                    .toString();

                                            var parts =
                                                repetitionValue.split(" ");

                                            var minusValue = int.parse(parts[0]
                                                    .trim()
                                                    .toString()) +
                                                1;

                                            var newRepetition =
                                                "${minusValue.toString()} x";

                                            cubit.changeRepetition(
                                                newRepetition);
                                          },
                                          isSvg: true,
                                          svgPath: "assets/images/add.svg",
                                          background: greyFiveColor,
                                          borderColor: greyFiveColor,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 18.h,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Divider(
                              thickness: 2,
                              color: greyColor,
                            ),
                          ),
                          SizedBox(
                            height: 24.0.h,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                child: Text(
                                  "Vibration",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: ScreenUtil()
                                        .setSp(18, allowFontScalingSelf: true),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 5,
                                ),
                              ),
                              SizedBox(
                                height: 18.0.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 10.0.w, right: 8.0.w),
                                      child: defaultButtonWithIcon(
                                        function: () {
                                          if (!cubit.isVibration) {
                                            cubit.changeVibration();
                                          }
                                        },
                                        background: cubit.isVibration
                                            ? secondaryColor
                                            : greyFiveColor,
                                        borderColor: cubit.isVibration
                                            ? secondaryColor
                                            : greyFiveColor,
                                        text: "Vibration",
                                        isUpperCase: false,
                                        isSvg: true,
                                        svgPath: "assets/images/vibration.svg",
                                        textStyle: TextStyle(
                                          color: cubit.isVibration
                                              ? Colors.white
                                              : darkBlueColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: ScreenUtil().setSp(15,
                                              allowFontScalingSelf: true),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 10.0.w),
                                      child: defaultButtonWithIcon(
                                        function: () {
                                          if (cubit.isVibration) {
                                            cubit.changeVibration();
                                          }
                                        },
                                        background: !cubit.isVibration
                                            ? secondaryColor
                                            : greyFiveColor,
                                        borderColor: !cubit.isVibration
                                            ? secondaryColor
                                            : greyFiveColor,
                                        text: "No Vibration",
                                        isUpperCase: false,
                                        isSvg: true,
                                        svgPath:
                                            "assets/images/noVibration.svg",
                                        textStyle: TextStyle(
                                          color: !cubit.isVibration
                                              ? Colors.white
                                              : darkBlueColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: ScreenUtil().setSp(15,
                                              allowFontScalingSelf: true),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 18.h,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Divider(
                              thickness: 2,
                              color: greyColor,
                            ),
                          ),
                          SizedBox(
                            height: 24.0.h,
                          ),
                          Visibility(
                            visible: cubit.isGripVisible,
                            child: Column(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16.w),
                                      child: Text(
                                        "Grip Size",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: ScreenUtil().setSp(18,
                                              allowFontScalingSelf: true),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 5,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 18.0.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 10.0.w, right: 8.0.w),
                                            child: defaultButton(
                                              function: () {
                                                if (!cubit.isLargeGrip) {
                                                  cubit.changeGripSize();
                                                }
                                              },
                                              background: cubit.isLargeGrip
                                                  ? secondaryColor
                                                  : greyFiveColor,
                                              borderColor: cubit.isLargeGrip
                                                  ? secondaryColor
                                                  : greyFiveColor,
                                              text: "Large grip",
                                              isUpperCase: false,
                                              textStyle: TextStyle(
                                                color: cubit.isLargeGrip
                                                    ? Colors.white
                                                    : darkBlueColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: ScreenUtil().setSp(15,
                                                    allowFontScalingSelf: true),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Padding(
                                            padding:
                                                EdgeInsets.only(right: 10.0.w),
                                            child: defaultButton(
                                              function: () {
                                                if (cubit.isLargeGrip) {
                                                  cubit.changeGripSize();
                                                }
                                              },
                                              background: !cubit.isLargeGrip
                                                  ? secondaryColor
                                                  : greyFiveColor,
                                              borderColor: !cubit.isLargeGrip
                                                  ? secondaryColor
                                                  : greyFiveColor,
                                              text: "Small grip",
                                              isUpperCase: false,
                                              textStyle: TextStyle(
                                                color: !cubit.isLargeGrip
                                                    ? Colors.white
                                                    : darkBlueColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: ScreenUtil().setSp(15,
                                                    allowFontScalingSelf: true),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 18.h,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: Divider(
                                    thickness: 2,
                                    color: greyColor,
                                  ),
                                ),
                                SizedBox(
                                  height: 24.0.h,
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Program Angle",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: ScreenUtil().setSp(18,
                                            allowFontScalingSelf: true),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 5,
                                    ),
                                    SizedBox(
                                      height: 4.0.h,
                                    ),
                                    Text(
                                      "Adjust device angle ",
                                      style: TextStyle(
                                        fontSize: ScreenUtil().setSp(16,
                                            allowFontScalingSelf: true),
                                        color: Colors.grey,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 5,
                                    ),
                                    SizedBox(
                                      height: 18.0.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        RectangleNumber(num: '0'),
                                        Container(
                                          width: 270.w,
                                          child: RangeSlider(
                                              min: 0,
                                              max: 90,
                                              activeColor: secondaryColor,
                                              values: RangeValues(
                                                  cubit.programSmallAngle,
                                                  cubit.programBigAngle),
                                              onChanged: (values) {
                                                cubit.changeAngle(
                                                    values.start, values.end);
                                              }),
                                        ),
                                        RectangleNumber(num: '90'),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 18.h,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Divider(
                                  thickness: 2,
                                  color: greyColor,
                                ),
                              ),
                              SizedBox(
                                height: 24.0.h,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  children: [
                                    defaultButton(
                                      function: () {
                                        showToast(
                                          message: "Okay",
                                          length: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 3,
                                          backgroundColor: darkBlueColor,
                                          textColor: Colors.white,
                                        );
                                      },
                                      text: "Start",
                                      textStyle: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.0,
                                        fontSize: ScreenUtil().setSp(18,
                                            allowFontScalingSelf: true),
                                      ),
                                      isUpperCase: false,
                                      background: lightSecondaryColor,
                                      borderColor: lightSecondaryColor,
                                    ),
                                    SizedBox(
                                      height: 24.0.h,
                                    ),
                                    defaultButton(
                                      function: () {
                                        if (Navigator.canPop(context)) {
                                          Navigator.pop(context);
                                        } else {
                                          SystemNavigator.pop();
                                        }
                                      },
                                      text: "Cancel",
                                      textStyle: TextStyle(
                                        color: darkBlueColor,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.0,
                                        fontSize: ScreenUtil().setSp(16,
                                            allowFontScalingSelf: true),
                                      ),
                                      isUpperCase: false,
                                      background: greyFiveColor,
                                      borderColor: greyFiveColor,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 28.0.h,
                              ),
                            ],
                          )
                        ],
                      ),
                    ))
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
