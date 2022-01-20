import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nureab/cubit/add_patient/add_patient_cubit.dart';
import 'package:nureab/cubit/add_patient/add_patient_states.dart';
import 'package:nureab/screens/bottomNavigation.dart';
import 'package:nureab/screens/program_setup_screen.dart';
import 'package:nureab/shared/constants.dart';
import 'package:nureab/shared/widgets/back_bar.dart';
import 'package:nureab/shared/widgets/select_drop_list.dart';

class TreatNewPatientScreen extends StatefulWidget {
  const TreatNewPatientScreen({Key key}) : super(key: key);

  @override
  State<TreatNewPatientScreen> createState() => _TreatNewPatientScreenState();
}

String selectedItem = "Injury Name";

class _TreatNewPatientScreenState extends State<TreatNewPatientScreen> {
  final patientNameController = TextEditingController();
  final patientAgeController = TextEditingController();
  final descriptionCaseController = TextEditingController();
  final startDateController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        navigateTo(
            context,
            BottomNavigation(
              comingIndex: 0,
            ));
      },
      child: BlocProvider(
        create: (context) => AddPatientCubit(),
        child: BlocConsumer<AddPatientCubit, AddPatientStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = AddPatientCubit.get(context);

            return Scaffold(
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
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    height: 40.h,
                                    width: 40.w,
                                    child: Container(
                                      child: Icon(
                                        Icons.person,
                                        size: 30,
                                        color: secondaryColor,
                                      ),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: greyFiveColor),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width - 80,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 16.w),
                                          child: AutoSizeText(
                                            "New Patient Infromations",
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
                                          child: AutoSizeText(
                                            "To Start a Program You Need To Create a Patient.",
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Divider(
                                thickness: 2,
                                color: greyColor,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 8.h, left: 26.w),
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
                                      text: "Patient’s name ",
                                      style: TextStyle(
                                        color: Color(0xff0F2644),
                                        fontFamily: "Open Sans",
                                        fontSize: ScreenUtil().setSp(18,
                                            allowFontScalingSelf: true),
                                      ),
                                    ),
                                    TextSpan(
                                      text: "*",
                                      style: TextStyle(
                                          color: orangeColor,
                                          fontSize: ScreenUtil().setSp(18,
                                              allowFontScalingSelf: true),
                                          fontFamily: "Open Sans",
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 20.w, right: 20.w, top: 12.h),
                              child: TextFormField(
                                controller: patientNameController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                style: TextStyle(
                                    color: greyThreeColor,
                                    fontFamily: "Open Sans",
                                    fontSize: ScreenUtil()
                                        .setSp(14, allowFontScalingSelf: true),
                                    fontWeight: FontWeight.w600),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'Enter Name',
                                  hintStyle: TextStyle(
                                      color: greyThreeColor,
                                      fontFamily: "Open Sans",
                                      fontSize: ScreenUtil().setSp(14,
                                          allowFontScalingSelf: true),
                                      fontWeight: FontWeight.w600),
                                  alignLabelWithHint: true,
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xffD4DDE8), width: 1.0),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0))),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xffD4DDE8), width: 1.0),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xffD4DDE8), width: 1.0),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0))),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 8.h, left: 26.w),
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
                                      text: "Age ",
                                      style: TextStyle(
                                        color: Color(0xff0F2644),
                                        fontFamily: "Open Sans",
                                        fontSize: ScreenUtil().setSp(18,
                                            allowFontScalingSelf: true),
                                      ),
                                    ),
                                    TextSpan(
                                      text: "*",
                                      style: TextStyle(
                                          color: orangeColor,
                                          fontSize: ScreenUtil().setSp(18,
                                              allowFontScalingSelf: true),
                                          fontFamily: "Open Sans",
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 20.w, right: 20.w, top: 12.h),
                              child: TextFormField(
                                controller: patientAgeController,
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.next,
                                style: TextStyle(
                                    color: greyThreeColor,
                                    fontFamily: "Open Sans",
                                    fontSize: ScreenUtil()
                                        .setSp(14, allowFontScalingSelf: true),
                                    fontWeight: FontWeight.w600),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'Enter age',
                                  hintStyle: TextStyle(
                                      color: greyThreeColor,
                                      fontFamily: "Open Sans",
                                      fontSize: ScreenUtil().setSp(14,
                                          allowFontScalingSelf: true),
                                      fontWeight: FontWeight.w600),
                                  alignLabelWithHint: true,
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xffD4DDE8), width: 1.0),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0))),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xffD4DDE8), width: 1.0),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xffD4DDE8), width: 1.0),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0))),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20.h, left: 26.w),
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
                                      text: "Patient's Case ",
                                      style: TextStyle(
                                        color: Color(0xff0F2644),
                                        fontFamily: "Open Sans",
                                        fontSize: ScreenUtil().setSp(18,
                                            allowFontScalingSelf: true),
                                      ),
                                    ),
                                    TextSpan(
                                      text: "*",
                                      style: TextStyle(
                                          color: orangeColor,
                                          fontSize: ScreenUtil().setSp(18,
                                              allowFontScalingSelf: true),
                                          fontFamily: "Open Sans",
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 20.w, right: 20.w, top: 12.h),
                              child: SelectDropList(cubit.idOptionItemSelected,
                                  cubit.idDropListModel, (optionItem) {
                                cubit.changeInjuryIndex(optionItem);
                              }, Icons.personal_injury_rounded),
                            ),
                            SizedBox(
                              height: 12.0.h,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 8.h, left: 26.w),
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
                                      text: "Description Case ",
                                      style: TextStyle(
                                        color: Color(0xff0F2644),
                                        fontFamily: "Open Sans",
                                        fontSize: ScreenUtil().setSp(18,
                                            allowFontScalingSelf: true),
                                      ),
                                    ),
                                    TextSpan(
                                      text: "*",
                                      style: TextStyle(
                                          color: orangeColor,
                                          fontSize: ScreenUtil().setSp(18,
                                              allowFontScalingSelf: true),
                                          fontFamily: "Open Sans",
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 20.w, right: 20.w, top: 12.h),
                              child: TextFormField(
                                controller: descriptionCaseController,
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                minLines: 5,
                                textInputAction: TextInputAction.newline,
                                style: TextStyle(
                                    color: greyThreeColor,
                                    fontFamily: "Open Sans",
                                    fontSize: ScreenUtil()
                                        .setSp(16, allowFontScalingSelf: true),
                                    fontWeight: FontWeight.w600),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: "Write Description",
                                  hintStyle: TextStyle(
                                      color: greyThreeColor,
                                      fontFamily: "Open Sans",
                                      fontSize: ScreenUtil().setSp(16,
                                          allowFontScalingSelf: true),
                                      fontWeight: FontWeight.w600),
                                  alignLabelWithHint: true,
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: greyBorderColor, width: 1.0),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0))),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: greyBorderColor, width: 1.0),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: greyBorderColor, width: 1.0),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0))),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 12.0.h,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 8.h, left: 26.w),
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
                                      text: "Starting Date ",
                                      style: TextStyle(
                                        color: Color(0xff0F2644),
                                        fontFamily: "Open Sans",
                                        fontSize: ScreenUtil().setSp(18,
                                            allowFontScalingSelf: true),
                                      ),
                                    ),
                                    TextSpan(
                                      text: "*",
                                      style: TextStyle(
                                          color: orangeColor,
                                          fontSize: ScreenUtil().setSp(18,
                                              allowFontScalingSelf: true),
                                          fontFamily: "Open Sans",
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 20.w, right: 20.w, top: 12.h),
                              child: TextFormField(
                                controller: startDateController,
                                keyboardType: TextInputType.datetime,
                                readOnly: true,
                                onTap: () {
                                  showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate:
                                              DateTime.parse('2010-01-01'),
                                          lastDate:
                                              DateTime.parse('2030-12-31'))
                                      .then((value) {
                                    if (value == null) {
                                      startDateController.text = '';
                                    } else {
                                      startDateController.text =
                                          DateUtil.formatDate(value).toString();
                                      print(
                                          "Date Time Value : ${value.toString()}\n");
                                    }
                                  });
                                },
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'you must enter date';
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                  suffixIcon: Icon(
                                    IconlyBroken.calendar,
                                    color: secondaryColor,
                                  ),
                                  hintText: "Today's Date",
                                  hintStyle: TextStyle(
                                      color: darkBlueColor,
                                      fontFamily: "Open Sans",
                                      fontSize: ScreenUtil().setSp(16,
                                          allowFontScalingSelf: true),
                                      fontWeight: FontWeight.w600),
                                  alignLabelWithHint: true,
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: greyBorderColor, width: 1.0),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0))),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: greyBorderColor, width: 1.0),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: greyBorderColor, width: 1.0),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0))),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 24.0.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 26.0.w),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                style: TextStyle(
                                                  fontSize: ScreenUtil().setSp(
                                                      18,
                                                      allowFontScalingSelf:
                                                          true),
                                                  fontFamily: "Open Sans",
                                                  color: Colors.white,
                                                ),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text: "Gender ",
                                                    style: TextStyle(
                                                      color: Color(0xff0F2644),
                                                      fontFamily: "Open Sans",
                                                      fontSize: ScreenUtil().setSp(
                                                          18,
                                                          allowFontScalingSelf:
                                                              true),
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: "*",
                                                    style: TextStyle(
                                                        color: orangeColor,
                                                        fontSize: ScreenUtil()
                                                            .setSp(18,
                                                                allowFontScalingSelf:
                                                                    true),
                                                        fontFamily: "Open Sans",
                                                        overflow: TextOverflow
                                                            .ellipsis),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8.0,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 20.0.w, right: 8.0.w),
                                        child: defaultButtonWithIcon(
                                            function: () {
                                              if (!cubit.isMale) {
                                                cubit.changeGender();
                                              }
                                            },
                                            background: cubit.isMale
                                                ? secondaryColor
                                                : greyFiveColor,
                                            borderColor: cubit.isMale
                                                ? secondaryColor
                                                : greyFiveColor,
                                            text: "Male",
                                            isUpperCase: false,
                                            isSvg: false,
                                            textStyle: TextStyle(
                                              color: cubit.isMale
                                                  ? Colors.white
                                                  : darkBlueColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: ScreenUtil().setSp(16,
                                                  allowFontScalingSelf: true),
                                            ),
                                            icon: Icons.male_rounded,
                                            iconColor: cubit.isMale
                                                ? Colors.white
                                                : secondaryColor),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 26.0.w),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                style: TextStyle(
                                                  fontSize: ScreenUtil().setSp(
                                                      18,
                                                      allowFontScalingSelf:
                                                          true),
                                                  fontFamily: "Open Sans",
                                                  color: Colors.transparent,
                                                ),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text: "Gender ",
                                                    style: TextStyle(
                                                      color: Colors.transparent,
                                                      fontFamily: "Open Sans",
                                                      fontSize: ScreenUtil().setSp(
                                                          18,
                                                          allowFontScalingSelf:
                                                              true),
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: "*",
                                                    style: TextStyle(
                                                        color:
                                                            Colors.transparent,
                                                        fontSize: ScreenUtil()
                                                            .setSp(18,
                                                                allowFontScalingSelf:
                                                                    true),
                                                        fontFamily: "Open Sans",
                                                        overflow: TextOverflow
                                                            .ellipsis),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8.0,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 20.0.w),
                                        child: defaultButtonWithIcon(
                                            function: () {
                                              if (cubit.isMale) {
                                                cubit.changeGender();
                                              }
                                            },
                                            background: !cubit.isMale
                                                ? secondaryColor
                                                : greyFiveColor,
                                            borderColor: !cubit.isMale
                                                ? secondaryColor
                                                : greyFiveColor,
                                            text: "Female",
                                            isUpperCase: false,
                                            isSvg: false,
                                            textStyle: TextStyle(
                                              color: !cubit.isMale
                                                  ? Colors.white
                                                  : darkBlueColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: ScreenUtil().setSp(16,
                                                  allowFontScalingSelf: true),
                                            ),
                                            icon: Icons.female_rounded,
                                            iconColor: !cubit.isMale
                                                ? Colors.white
                                                : secondaryColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 24.0.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 26.0.w),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                style: TextStyle(
                                                  fontSize: ScreenUtil().setSp(
                                                      18,
                                                      allowFontScalingSelf:
                                                          true),
                                                  fontFamily: "Open Sans",
                                                  color: Colors.white,
                                                ),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text: "Which Hand ? ",
                                                    style: TextStyle(
                                                      color: Color(0xff0F2644),
                                                      fontFamily: "Open Sans",
                                                      fontSize: ScreenUtil().setSp(
                                                          18,
                                                          allowFontScalingSelf:
                                                              true),
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: "*",
                                                    style: TextStyle(
                                                        color: orangeColor,
                                                        fontSize: ScreenUtil()
                                                            .setSp(18,
                                                                allowFontScalingSelf:
                                                                    true),
                                                        fontFamily: "Open Sans",
                                                        overflow: TextOverflow
                                                            .ellipsis),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8.0,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 20.0.w, right: 8.0.w),
                                        child: defaultButtonWithIcon(
                                            function: () {
                                              if (!cubit.isLeftHand) {
                                                cubit.changeHand();
                                              }
                                            },
                                            background: cubit.isLeftHand
                                                ? secondaryColor
                                                : greyFiveColor,
                                            borderColor: cubit.isLeftHand
                                                ? secondaryColor
                                                : greyFiveColor,
                                            text: "Left Hand",
                                            isUpperCase: false,
                                            isSvg: true,
                                            svgPath:
                                                "assets/images/left_hand.svg",
                                            textStyle: TextStyle(
                                              color: cubit.isLeftHand
                                                  ? Colors.white
                                                  : darkBlueColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: ScreenUtil().setSp(16,
                                                  allowFontScalingSelf: true),
                                            ),
                                            icon: Icons.male_rounded,
                                            iconColor: cubit.isLeftHand
                                                ? Colors.white
                                                : secondaryColor),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 26.0.w),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                style: TextStyle(
                                                  fontSize: ScreenUtil().setSp(
                                                      18,
                                                      allowFontScalingSelf:
                                                          true),
                                                  fontFamily: "Open Sans",
                                                  color: Colors.transparent,
                                                ),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text: "Gender ",
                                                    style: TextStyle(
                                                      color: Colors.transparent,
                                                      fontFamily: "Open Sans",
                                                      fontSize: ScreenUtil().setSp(
                                                          18,
                                                          allowFontScalingSelf:
                                                              true),
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: "*",
                                                    style: TextStyle(
                                                        color:
                                                            Colors.transparent,
                                                        fontSize: ScreenUtil()
                                                            .setSp(18,
                                                                allowFontScalingSelf:
                                                                    true),
                                                        fontFamily: "Open Sans",
                                                        overflow: TextOverflow
                                                            .ellipsis),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8.0,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 20.0.w),
                                        child: defaultButtonWithIcon(
                                            function: () {
                                              if (cubit.isLeftHand) {
                                                cubit.changeHand();
                                              }
                                            },
                                            background: !cubit.isLeftHand
                                                ? secondaryColor
                                                : greyFiveColor,
                                            borderColor: !cubit.isLeftHand
                                                ? secondaryColor
                                                : greyFiveColor,
                                            text: "Right Hand",
                                            isUpperCase: false,
                                            isSvg: true,
                                            svgPath:
                                                "assets/images/right_hand.svg",
                                            textStyle: TextStyle(
                                              color: !cubit.isLeftHand
                                                  ? Colors.white
                                                  : darkBlueColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: ScreenUtil().setSp(16,
                                                  allowFontScalingSelf: true),
                                            ),
                                            icon: Icons.female_rounded,
                                            iconColor: !cubit.isLeftHand
                                                ? Colors.white
                                                : secondaryColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 36.0.h,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                              child: defaultButton(
                                function: () {
                                  cubit.navigate(context, ProgramSetupScreen());
                                },
                                text: "Proceed To Program Settings",
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.0,
                                  fontSize: ScreenUtil()
                                      .setSp(16, allowFontScalingSelf: true),
                                ),
                                isUpperCase: false,
                                background: lightSecondaryColor,
                                borderColor: lightSecondaryColor,
                              ),
                            ),
                            SizedBox(
                              height: 24.0.h,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                              child: defaultButton(
                                function: () {
                                  if (Navigator.canPop(context)) {
                                    Navigator.pop(context);
                                  } else {
                                    SystemNavigator.pop();
                                  }
                                },
                                text: "Just Save Patient",
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
                              height: 24.0.h,
                            ),
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
      ),
    );
  }
}
