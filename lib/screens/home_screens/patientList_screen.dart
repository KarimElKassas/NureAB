import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nureab/cubit/patient_list/patient_list_cubit.dart';
import 'package:nureab/cubit/patient_list/patient_list_states.dart';
import 'package:nureab/shared/constants.dart';

import 'home/patientListDetails.dart';

class PatientScreen extends StatelessWidget {
  const PatientScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PatientListCubit(),
      child: BlocConsumer<PatientListCubit, PatientListStates>(
        listener: (context, state){},
        builder: (context, state){

          var cubit = PatientListCubit.get(context);

          return Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 16, left: 16, top: 16),
                      child: Container(
                        width: 300.w,
                        child: TextFormField(
                          textAlign: TextAlign.left,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          style: TextStyle(
                              color: greyThreeColor,
                              fontFamily: "Open Sans",
                              fontSize: ScreenUtil().setSp(14,
                                  allowFontScalingSelf: true),
                              fontWeight: FontWeight.w600),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: greyFiveColor,
                            hintText: 'Search',
                            hintStyle: TextStyle(
                                color: greyThreeColor,
                                fontFamily: "Open Sans",
                                fontSize: ScreenUtil().setSp(14,
                                    allowFontScalingSelf: true),
                                fontWeight: FontWeight.w600),
                            alignLabelWithHint: true,
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: greyBorderColor, width: 1.0),
                                borderRadius:
                                BorderRadius.all(Radius.circular(8.0))),
                            border: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: greyBorderColor, width: 1.0),
                              borderRadius:
                              BorderRadius.all(Radius.circular(8.0)),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: greyBorderColor, width: 1.0),
                                borderRadius:
                                BorderRadius.all(Radius.circular(8.0))),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: SvgPicture.asset('assets/images/Filter.svg'),
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
                    return InkWell(onTap: (){
                      navigateTo(context, PatientListDetails());
                    },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
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
                                  padding: const EdgeInsets.symmetric(horizontal: 4),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        cubit.patientList[index].name,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.indigo,
                                            fontSize: 16),
                                      ),
                                      Text(cubit.patientList[index].date,
                                          style: TextStyle(
                                              color: Colors.indigo, fontSize: 16))
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
                                    Text(cubit.patientList[index].age.toString(),
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
