import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nureab/cubit/privacy/privacy_cubit.dart';
import 'package:nureab/cubit/privacy/privacy_states.dart';
import 'package:nureab/shared/constants.dart';
import 'package:auto_size_text/auto_size_text.dart';

class PrivacyScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PrivacyCubit(),
      child: BlocConsumer<PrivacyCubit, PrivacyStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = PrivacyCubit.get(context);

          return Scaffold(
            body: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: greyFiveColor,
                    height: 60.h,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              color: greyFiveColor,
                              width: 150.w,
                              child: GestureDetector(
                                onTap: () {
                                  if (Navigator.canPop(context)) {
                                    Navigator.pop(context);
                                  } else {
                                    SystemNavigator.pop();
                                  }
                                },
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 8.0.w, right: 8.0.w),
                                      child: Icon(
                                        Icons.arrow_back,
                                        color: darkBlueColor,
                                      ),
                                    ),
                                    AutoSizeText(
                                      "Back",
                                      style: TextStyle(
                                          color: darkBlueColor,
                                          fontWeight: FontWeight.w800,
                                          letterSpacing: 1.0,
                                          fontSize: ScreenUtil().setSp(18,
                                              allowFontScalingSelf: true)),
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 36.0.h, horizontal: 14.0.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText("Privacy",
                              style: TextStyle(
                                  color: darkBlueColor,
                                  fontWeight: FontWeight.w800,
                                  fontSize: ScreenUtil().setSp(28,
                                      allowFontScalingSelf: true)
                              ),
                            ),
                            SizedBox(height: 24.0.h,),
                            AutoSizeText(
                              "Personal Information",
                              style: TextStyle(
                                  color: darkBlueColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: ScreenUtil()
                                      .setSp(18, allowFontScalingSelf: true),
                                  overflow: TextOverflow.ellipsis),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 5,
                            ),
                            SizedBox(height: 4.0.h,),
                            AutoSizeText(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent a laoreet enim, venenatis dapibus sem. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent a laoreet enim, venenatis dapibus sem. ",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w200,
                                  fontSize: ScreenUtil()
                                      .setSp(16, allowFontScalingSelf: true),
                                  overflow: TextOverflow.ellipsis),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 15,
                            ),
                            SizedBox(height: 24.0.h,),
                            Divider(height: 1.0.h,color: Colors.grey,),
                            SizedBox(height: 24.0.h,),
                            AutoSizeText(
                              "Patient’s Information",
                              style: TextStyle(
                                  color: darkBlueColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: ScreenUtil()
                                      .setSp(18, allowFontScalingSelf: true),
                                  overflow: TextOverflow.ellipsis),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 5,
                            ),
                            SizedBox(height: 4.0.h,),
                            AutoSizeText(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent a laoreet enim, venenatis dapibus sem. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent a laoreet enim, venenatis dapibus sem. ",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w200,
                                  fontSize: ScreenUtil()
                                      .setSp(16, allowFontScalingSelf: true),
                                  overflow: TextOverflow.ellipsis),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 15,
                            ),
                            SizedBox(height: 24.0.h,),
                            Divider(height: 1.0.h,color: Colors.grey,),
                            SizedBox(height: 24.0.h,)
                          ],
                        ),
                      ),
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
