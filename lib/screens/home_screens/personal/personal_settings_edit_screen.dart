import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nureab/cubit/personal/personal_settings_edit/personal_settings_edit_cubit.dart';
import 'package:nureab/cubit/personal/personal_settings_edit/personal_settings_edit_states.dart';
import 'package:nureab/shared/constants.dart';
import 'package:auto_size_text/auto_size_text.dart';

class PersonalSettingsEditScreen extends StatefulWidget {

  @override
  State<PersonalSettingsEditScreen> createState() => _PersonalSettingsEditScreenState();
}

class _PersonalSettingsEditScreenState extends State<PersonalSettingsEditScreen> {
  var nameController = TextEditingController();

  var emailController = TextEditingController();

  var phoneController = TextEditingController();

  var workController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PersonalSettingsEditCubit()
        ..getUserData(nameController,emailController,phoneController,workController),
      child: BlocConsumer<PersonalSettingsEditCubit, PersonalSettingsEditStates>(
        listener: (context, state) {

        },
        builder: (context, state) {
          var cubit = PersonalSettingsEditCubit.get(context);

          return Scaffold(
            body: SafeArea(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: greyFiveColor,
                      height: 60.h,
                      child: SizedBox.expand(),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 36.0.h, horizontal: 14.0.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText("Personal Settings",
                                style: TextStyle(
                                    color: darkBlueColor,
                                    fontWeight: FontWeight.w800,
                                    fontSize: ScreenUtil().setSp(28,
                                        allowFontScalingSelf: true)
                                ),
                              ),
                              SizedBox(height: 36.0.h,),
                              Padding(
                                padding: EdgeInsets.only(left: 4.0.w),
                                child: AutoSizeText(
                                  "Your Name",
                                  style: TextStyle(
                                      color: darkBlueColor,
                                      fontSize: ScreenUtil().setSp(18,
                                          allowFontScalingSelf: true),
                                      overflow: TextOverflow.ellipsis),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 5,
                                ),
                              ),
                              SizedBox(
                                height: 12.0.h,
                              ),
                              TextFormField(
                                controller: nameController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return 'you must type your name';
                                  }
                                },
                                style: TextStyle(
                                    color: greyThreeColor,
                                    fontFamily: "Open Sans",
                                    fontSize: ScreenUtil().setSp(14,
                                        allowFontScalingSelf: true),
                                    fontWeight: FontWeight.w600),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: "Your Name",
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
                              SizedBox(height: 24.0.h,),
                              Padding(
                                padding: EdgeInsets.only(left: 4.0.w),
                                child: AutoSizeText(
                                  "Email Address",
                                  style: TextStyle(
                                      color: darkBlueColor,
                                      fontSize: ScreenUtil().setSp(18,
                                          allowFontScalingSelf: true),
                                      overflow: TextOverflow.ellipsis),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 5,
                                ),
                              ),
                              SizedBox(
                                height: 12.0.h,
                              ),
                              TextFormField(
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                enabled: false,
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return 'you must type email address';
                                  }
                                  if (!value.contains("@")) {
                                    return 'wrong email format';
                                  }
                                  if (!value.contains(".")) {
                                    return 'wrong email format';
                                  }
                                },
                                style: TextStyle(
                                    color: greyThreeColor,
                                    fontFamily: "Open Sans",
                                    fontSize: ScreenUtil().setSp(14,
                                        allowFontScalingSelf: true),
                                    fontWeight: FontWeight.w600),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: "Your Email",
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
                              SizedBox(height: 24.0.h,),
                              Padding(
                                padding: EdgeInsets.only(left: 4.0.w),
                                child: AutoSizeText(
                                  "Phone",
                                  style: TextStyle(
                                      color: darkBlueColor,
                                      fontSize: ScreenUtil().setSp(18,
                                          allowFontScalingSelf: true),
                                      overflow: TextOverflow.ellipsis),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 5,
                                ),
                              ),
                              SizedBox(
                                height: 12.0.h,
                              ),
                              TextFormField(
                                controller: phoneController,
                                keyboardType: TextInputType.phone,
                                textInputAction: TextInputAction.next,
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return 'you must type your phone';
                                  }
                                  if (value.length != 11) {
                                    return 'phone number length must be 11 number';
                                  }
                                  if (!value.startsWith('011') &&
                                      !value.startsWith('012') &&
                                      !value.startsWith('010') &&
                                      !value.startsWith('015')) {
                                    return 'invalid phone number';
                                  }
                                },
                                style: TextStyle(
                                    color: greyThreeColor,
                                    fontFamily: "Open Sans",
                                    fontSize: ScreenUtil().setSp(14,
                                        allowFontScalingSelf: true),
                                    fontWeight: FontWeight.w600),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: "Your Phone",
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
                              SizedBox(height: 24.0.h,),
                              Padding(
                                padding: EdgeInsets.only(left: 4.0.w),
                                child: AutoSizeText(
                                  "Hospital / Clinic Name",
                                  style: TextStyle(
                                      color: darkBlueColor,
                                      fontSize: ScreenUtil().setSp(18,
                                          allowFontScalingSelf: true),
                                      overflow: TextOverflow.ellipsis),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 5,
                                ),
                              ),
                              SizedBox(
                                height: 12.0.h,
                              ),
                              TextFormField(
                                controller: workController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.done,
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return 'you must type work place name';
                                  }
                                },
                                style: TextStyle(
                                    color: greyThreeColor,
                                    fontFamily: "Open Sans",
                                    fontSize: ScreenUtil().setSp(14,
                                        allowFontScalingSelf: true),
                                    fontWeight: FontWeight.w600),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: "Your Work Name",
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
                              SizedBox(
                                height: 64.0.h,
                              ),
                              BuildCondition(
                                condition: state is PersonalSettingsEditLoadingUpdateUserDataState,
                                builder: (context) => Center(child: CircularProgressIndicator(color: lightSecondaryColor,),),
                                fallback: (context) => defaultButton(
                                  function: (){
                                    if(formKey.currentState.validate()){
                                      cubit.updateUserData(
                                          context,
                                          nameController.text.toString(),
                                          emailController.text.toString(),
                                          phoneController.text.toString(),
                                          cubit.userPassword,
                                          workController.text.toString());
                                    }
                                  },
                                  text: "Save",
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.0,
                                    fontSize:ScreenUtil().setSp(18,
                                        allowFontScalingSelf: true),
                                  ),
                                  isUpperCase: false,
                                  background: lightSecondaryColor,
                                  borderColor: lightSecondaryColor,
                                ),
                              ),
                              SizedBox(
                                height: 24.0.h,
                              ),
                              defaultButton(
                                function: (){
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
                                  fontSize:ScreenUtil().setSp(16,
                                      allowFontScalingSelf: true),
                                ),
                                isUpperCase: false,
                                background: greyFiveColor,
                                borderColor: greyFiveColor,
                              ),
                              SizedBox(
                                height: 24.0.h,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
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
