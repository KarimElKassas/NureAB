import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nureab/cubit/patient_list/patient_list_cubit.dart';
import 'package:nureab/cubit/patient_list/patient_list_states.dart';
import 'package:nureab/shared/constants.dart';
import 'package:nureab/shared/widgets/select_drop_list.dart';

import 'home/internal_wearDevice.dart';
import 'home/patientListDetails.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'home/treatNewPatient_screen.dart';

var radioSelected = 1;
final startDateController = TextEditingController();

class PatientScreen extends StatelessWidget {
  const PatientScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PatientListCubit(),
      child: BlocConsumer<PatientListCubit, PatientListStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = PatientListCubit.get(context);

          return Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 16, left: 16, top: 16),
                      child: Container(
                        width: 300.w,
                        child: TextFormField(
                          textAlign: TextAlign.left,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          style: TextStyle(
                              color: greyThreeColor,
                              fontFamily: "Open Sans",
                              fontSize: ScreenUtil()
                                  .setSp(14, allowFontScalingSelf: true),
                              fontWeight: FontWeight.w600),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: greyFiveColor,
                            hintText: 'Search',
                            hintStyle: TextStyle(
                                color: greyThreeColor,
                                fontFamily: "Open Sans",
                                fontSize: ScreenUtil()
                                    .setSp(14, allowFontScalingSelf: true),
                                fontWeight: FontWeight.w600),
                            alignLabelWithHint: true,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: greyBorderColor, width: 1.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0))),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: greyBorderColor, width: 1.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: greyBorderColor, width: 1.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0))),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return StatefulBuilder(
                              builder: (context, setState) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
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
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              AutoSizeText(
                                                "Filter Patients",
                                                style: TextStyle(
                                                    fontSize: ScreenUtil().setSp(
                                                        16,
                                                        allowFontScalingSelf:
                                                            true),
                                                    color: darkBlueColor,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                textAlign: TextAlign.center,
                                              ),
                                              AutoSizeText(
                                                "Clear Filter",
                                                style: TextStyle(
                                                  fontSize: ScreenUtil().setSp(
                                                      14,
                                                      allowFontScalingSelf:
                                                          true),
                                                  color: darkBlueColor,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          )),
                                      SizedBox(
                                        height: 8.h,
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
                                        height: 8.h,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 16),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 16),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  AutoSizeText(
                                                    "From :",
                                                    style: TextStyle(
                                                      fontSize: ScreenUtil().setSp(
                                                          14,
                                                          allowFontScalingSelf:
                                                              true),
                                                      color: darkBlueColor,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  SizedBox(
                                                    height: 4.h,
                                                  ),
                                                  Row(
                                                    children: [

                                                      Container(
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
                                                          hintText: "4 April 2021",
                                                          hintStyle: TextStyle(
                                                              color: darkBlueColor,
                                                              fontFamily: "Open Sans",
                                                              fontSize: ScreenUtil().setSp(10,
                                                                  allowFontScalingSelf: true),
                                                              fontWeight: FontWeight.w600),
                                                          alignLabelWithHint: true,
                                                        )
                                                    ),width: 100.w,
                                                      )
                                            ,
                                                      SizedBox(
                                                        width: 10.w,
                                                      ),
                                                      Icon(
                                                        Icons.arrow_forward_ios,
                                                        size: 15,
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                            VerticalDivider(
                                              color: Colors.red,
                                              thickness: 2,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 16),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  AutoSizeText(
                                                    "To :",
                                                    style: TextStyle(
                                                      fontSize: ScreenUtil().setSp(
                                                          14,
                                                          allowFontScalingSelf:
                                                              true),
                                                      color: darkBlueColor,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  SizedBox(
                                                    height: 4.h,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Container(
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
                                                              hintText: "10 April 2021",
                                                              hintStyle: TextStyle(
                                                                  color: darkBlueColor,
                                                                  fontFamily: "Open Sans",
                                                                  fontSize: ScreenUtil().setSp(10,
                                                                      allowFontScalingSelf: true),
                                                                  fontWeight: FontWeight.w600),
                                                              alignLabelWithHint: true,
                                                            )
                                                        ),width: 100.w,
                                                      ),
                                                      SizedBox(
                                                        width: 20.w,
                                                      ),
                                                      Icon(
                                                        Icons.arrow_forward_ios,
                                                        size: 15,
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30.h,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 16),
                                        child: AutoSizeText(
                                          "Gender",
                                          style: TextStyle(
                                            fontSize: ScreenUtil().setSp(14,
                                                allowFontScalingSelf: true),
                                            color: darkBlueColor,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                radioSelected = 1;
                                              });
                                            },
                                            child: Row(
                                              children: [
                                                Radio(
                                                    value: 1,
                                                    groupValue: radioSelected,
                                                    activeColor: darkBlueColor,
                                                    onChanged: (val) {
                                                      setState(() {
                                                        radioSelected = val;
                                                      });
                                                    }),
                                                AutoSizeText(
                                                  "Male",
                                                  style: TextStyle(
                                                      fontSize: ScreenUtil().setSp(
                                                          14,
                                                          allowFontScalingSelf:
                                                              true),
                                                      color: darkBlueColor,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 8.w,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                radioSelected = 2;
                                              });
                                            },
                                            child: Row(
                                              children: [
                                                Radio(
                                                    value: 2,
                                                    groupValue: radioSelected,
                                                    activeColor: darkBlueColor,
                                                    onChanged: (val) {
                                                      setState(() {
                                                        radioSelected = val;
                                                      });
                                                    }),
                                                AutoSizeText(
                                                  "Female",
                                                  style: TextStyle(
                                                      fontSize: ScreenUtil().setSp(
                                                          14,
                                                          allowFontScalingSelf:
                                                              true),
                                                      color: darkBlueColor,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8.h,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 16),
                                        child: AutoSizeText(
                                          "Age",
                                          style: TextStyle(
                                            fontSize: ScreenUtil().setSp(14,
                                                allowFontScalingSelf: true),
                                            color: darkBlueColor,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 16.w, right: 16.w, top: 12.h),
                                        child: SelectDropList(
                                            cubit.idOptionItemSelected,
                                            cubit.idDropListModel,
                                            (optionItem) {
                                                setState((){
                                                  cubit.changeAgeIndex(optionItem);
                                                });

                                          }, null),
                                      ),
                                      SizedBox(
                                        height: 16.h,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: defaultButton(
                                                function: () {
                                                  if (Navigator.canPop(
                                                      context)) {
                                                    Navigator.pop(context);
                                                  } else {
                                                    SystemNavigator.pop();
                                                  }
                                                },
                                                text: "Apply",
                                                background: lightSecondaryColor,
                                                borderColor:
                                                    lightSecondaryColor,
                                                isUpperCase: false,
                                                textStyle: TextStyle(
                                                    fontSize: ScreenUtil().setSp(
                                                        14,
                                                        allowFontScalingSelf:
                                                            true),
                                                    fontWeight: FontWeight.w800,
                                                    color: Colors.white),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 8.0.w,
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: defaultButton(
                                                function: () {
                                                  if (Navigator.canPop(
                                                      context)) {
                                                    Navigator.pop(context);
                                                  } else {
                                                    SystemNavigator.pop();
                                                  }
                                                },
                                                text: "Cancel",
                                                background: greyFiveColor,
                                                textColor: darkBlueColor,
                                                borderColor: greyFiveColor,
                                                isUpperCase: false,
                                                textStyle: TextStyle(
                                                    fontSize: ScreenUtil().setSp(
                                                        14,
                                                        allowFontScalingSelf:
                                                            true),
                                                    fontWeight: FontWeight.w800,
                                                    color: Color(0xff0F2644)),
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
                      child: Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: SvgPicture.asset(
                          'assets/images/Filter.svg',
                          height: 60.h,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
/*
            Padding(
              padding: const EdgeInsets.only(top: 50,bottom: 26),
              child: SvgPicture.asset('assets/images/friends.svg',height: 220.h,),
            ),
                Text(
                  'Currently You Don’t have Patients',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: ScreenUtil().setSp(16, allowFontScalingSelf: true),
                      color: darkBlueColor),
                ),    SizedBox(
                  height: 16.h,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'You need to create at least one patient So you can start treating him / her with the device.',textAlign: TextAlign.center,
                    style: TextStyle(

                        fontSize: ScreenUtil().setSp(14, allowFontScalingSelf: true),
                        color: darkBlueColor),
                  ),
                ),
                SizedBox(height: 40 .h,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: defaultButton(
                    function: () {
                    //  cubit.navigate(context, WearDevice());
                    },
                    text: "Create New Patient",
                    background: greySixColor,
                    borderColor: greyFiveColor,
                    isUpperCase: false,
                    textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: ScreenUtil().setSp(16, allowFontScalingSelf: true),
                        color: darkBlueColor),
                  ),
                ),*/

                ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        navigateTo(context, PatientListDetails());
                      },
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      AutoSizeText(
                                        cubit.patientList[index].name,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.indigo,
                                            fontSize: 16),
                                      ),
                                      AutoSizeText(
                                          cubit.patientList[index].date,
                                          style: TextStyle(
                                              color: Colors.indigo,
                                              fontSize: 16))
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      cubit.patientList[index].gender == "M"
                                          ? Icons.male
                                          : Icons.female,
                                      color: Colors.indigo,
                                      size: 30,
                                    ),
                                    SizedBox(
                                      width: 16.w,
                                    ),
                                    AutoSizeText(
                                        cubit.patientList[index].age.toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.indigo,
                                            fontSize: 16)),
                                    Expanded(child: Container()),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.blue,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: cubit.patientList.length,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
