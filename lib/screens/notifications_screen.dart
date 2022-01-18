import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:nureab/cubit/notifications/notifications_cubit.dart';
import 'package:nureab/cubit/notifications/notifications_states.dart';
import 'package:nureab/shared/constants.dart';
import 'package:auto_size_text/auto_size_text.dart';

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationsCubit(),
      child: BlocConsumer<NotificationsCubit, NotificationsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NotificationsCubit.get(context);

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
                                          fontSize: ScreenUtil().setSp(16,
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
                        padding: EdgeInsets.symmetric(
                            vertical: 28.0.h, horizontal: 14.0.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              "Notifications",
                              style: TextStyle(
                                  color: darkBlueColor,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: 1.0,
                                  fontSize: ScreenUtil()
                                      .setSp(30, allowFontScalingSelf: true)),
                            ),
                            SizedBox(
                              height: 24.0.h,
                            ),
                            Row(
                              children: [
                                AutoSizeText(
                                  "NEW COLLECTION",
                                  style: TextStyle(
                                      color: darkBlueColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: ScreenUtil().setSp(16,
                                          allowFontScalingSelf: true),
                                      overflow: TextOverflow.ellipsis),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 5,
                                ),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(right: 4.0),
                                  child: AutoSizeText(
                                    "01:00 PM",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w200,
                                        fontSize: ScreenUtil().setSp(14,
                                            allowFontScalingSelf: true)),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 4.0.h,
                            ),
                            AutoSizeText(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent a laoreet enim, venenatis dapibus sem. ",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w200,
                                  fontSize: ScreenUtil()
                                      .setSp(14, allowFontScalingSelf: true),
                                  overflow: TextOverflow.ellipsis),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 15,
                            ),
                            SizedBox(
                              height: 24.0.h,
                            ),
                            Divider(
                              height: 1.0.h,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              height: 24.0.h,
                            ),
                            Row(
                              children: [
                                AutoSizeText(
                                  "NEW COLLECTION",
                                  style: TextStyle(
                                      color: darkBlueColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: ScreenUtil().setSp(16,
                                          allowFontScalingSelf: true),
                                      overflow: TextOverflow.ellipsis),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 5,
                                ),
                                Spacer(),
                                AutoSizeText(
                                  "01:00 PM",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w200,
                                      fontSize: ScreenUtil().setSp(14,
                                          allowFontScalingSelf: true)),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 4.0.h,
                            ),
                            AutoSizeText(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent a laoreet enim, venenatis dapibus sem. ",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w200,
                                  fontSize: ScreenUtil()
                                      .setSp(14, allowFontScalingSelf: true),
                                  overflow: TextOverflow.ellipsis),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 15,
                            ),
                            SizedBox(
                              height: 24.0.h,
                            ),
                            Divider(
                              height: 1.0.h,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              height: 24.0.h,
                            ),
                            Row(
                              children: [
                                AutoSizeText(
                                  "NEW COLLECTION",
                                  style: TextStyle(
                                      color: darkBlueColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: ScreenUtil().setSp(16,
                                          allowFontScalingSelf: true),
                                      overflow: TextOverflow.ellipsis),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 5,
                                ),
                                Spacer(),
                                AutoSizeText(
                                  "01:00 PM",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w200,
                                      fontSize: ScreenUtil().setSp(14,
                                          allowFontScalingSelf: true)),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 4.0.h,
                            ),
                            AutoSizeText(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent a laoreet enim, venenatis dapibus sem. ",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w200,
                                  fontSize: ScreenUtil()
                                      .setSp(14, allowFontScalingSelf: true),
                                  overflow: TextOverflow.ellipsis),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 15,
                            ),
                            SizedBox(
                              height: 24.0.h,
                            ),
                            Divider(
                              height: 1.0.h,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              height: 24.0.h,
                            ),
                            Row(
                              children: [
                                AutoSizeText(
                                  "NEW COLLECTION",
                                  style: TextStyle(
                                      color: darkBlueColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: ScreenUtil().setSp(16,
                                          allowFontScalingSelf: true),
                                      overflow: TextOverflow.ellipsis),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 5,
                                ),
                                Spacer(),
                                AutoSizeText(
                                  "01:00 PM",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w200,
                                      fontSize: ScreenUtil().setSp(14,
                                          allowFontScalingSelf: true)),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 4.0.h,
                            ),
                            AutoSizeText(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent a laoreet enim, venenatis dapibus sem. ",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w200,
                                  fontSize: ScreenUtil()
                                      .setSp(14, allowFontScalingSelf: true),
                                  overflow: TextOverflow.ellipsis),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 15,
                            ),
                            SizedBox(
                              height: 24.0.h,
                            ),
                            Divider(
                              height: 1.0.h,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              height: 24.0.h,
                            ),
                            Row(
                              children: [
                                AutoSizeText(
                                  "NEW COLLECTION",
                                  style: TextStyle(
                                      color: darkBlueColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: ScreenUtil().setSp(16,
                                          allowFontScalingSelf: true),
                                      overflow: TextOverflow.ellipsis),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 5,
                                ),
                                Spacer(),
                                AutoSizeText(
                                  "01:00 PM",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w200,
                                      fontSize: ScreenUtil().setSp(14,
                                          allowFontScalingSelf: true)),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 4.0.h,
                            ),
                            AutoSizeText(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent a laoreet enim, venenatis dapibus sem. ",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w200,
                                  fontSize: ScreenUtil()
                                      .setSp(14, allowFontScalingSelf: true),
                                  overflow: TextOverflow.ellipsis),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 15,
                            ),
                            SizedBox(
                              height: 24.0.h,
                            ),
                            Divider(
                              height: 1.0.h,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              height: 24.0.h,
                            ),
                            Row(
                              children: [
                                AutoSizeText(
                                  "NEW COLLECTION",
                                  style: TextStyle(
                                      color: darkBlueColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: ScreenUtil().setSp(16,
                                          allowFontScalingSelf: true),
                                      overflow: TextOverflow.ellipsis),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 5,
                                ),
                                Spacer(),
                                AutoSizeText(
                                  "01:00 PM",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w200,
                                      fontSize: ScreenUtil().setSp(14,
                                          allowFontScalingSelf: true)),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 4.0.h,
                            ),
                            AutoSizeText(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent a laoreet enim, venenatis dapibus sem. ",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w200,
                                  fontSize: ScreenUtil()
                                      .setSp(14, allowFontScalingSelf: true),
                                  overflow: TextOverflow.ellipsis),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 15,
                            ),
                            SizedBox(
                              height: 24.0.h,
                            ),
                            Divider(
                              height: 1.0.h,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              height: 24.0.h,
                            ),
                            Row(
                              children: [
                                AutoSizeText(
                                  "NEW COLLECTION",
                                  style: TextStyle(
                                      color: darkBlueColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: ScreenUtil().setSp(16,
                                          allowFontScalingSelf: true),
                                      overflow: TextOverflow.ellipsis),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 5,
                                ),
                                Spacer(),
                                AutoSizeText(
                                  "01:00 PM",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w200,
                                      fontSize: ScreenUtil().setSp(14,
                                          allowFontScalingSelf: true)),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 4.0.h,
                            ),
                            AutoSizeText(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent a laoreet enim, venenatis dapibus sem. ",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w200,
                                  fontSize: ScreenUtil()
                                      .setSp(14, allowFontScalingSelf: true),
                                  overflow: TextOverflow.ellipsis),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 15,
                            ),
                            SizedBox(
                              height: 24.0.h,
                            ),
                            Divider(
                              height: 1.0.h,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              height: 24.0.h,
                            ),
                            Row(
                              children: [
                                AutoSizeText(
                                  "NEW COLLECTION",
                                  style: TextStyle(
                                      color: darkBlueColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: ScreenUtil().setSp(16,
                                          allowFontScalingSelf: true),
                                      overflow: TextOverflow.ellipsis),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 5,
                                ),
                                Spacer(),
                                AutoSizeText(
                                  "01:00 PM",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w200,
                                      fontSize: ScreenUtil().setSp(14,
                                          allowFontScalingSelf: true)),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 4.0.h,
                            ),
                            AutoSizeText(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent a laoreet enim, venenatis dapibus sem. ",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w200,
                                  fontSize: ScreenUtil()
                                      .setSp(14, allowFontScalingSelf: true),
                                  overflow: TextOverflow.ellipsis),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 15,
                            ),
                            SizedBox(
                              height: 24.0.h,
                            ),
                            Divider(
                              height: 1.0.h,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              height: 24.0.h,
                            ),
                            Row(
                              children: [
                                AutoSizeText(
                                  "NEW COLLECTION",
                                  style: TextStyle(
                                      color: darkBlueColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: ScreenUtil().setSp(16,
                                          allowFontScalingSelf: true),
                                      overflow: TextOverflow.ellipsis),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 5,
                                ),
                                Spacer(),
                                AutoSizeText(
                                  "01:00 PM",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w200,
                                      fontSize: ScreenUtil().setSp(14,
                                          allowFontScalingSelf: true)),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 4.0.h,
                            ),
                            AutoSizeText(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent a laoreet enim, venenatis dapibus sem. ",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w200,
                                  fontSize: ScreenUtil()
                                      .setSp(14, allowFontScalingSelf: true),
                                  overflow: TextOverflow.ellipsis),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 15,
                            ),
                            SizedBox(
                              height: 24.0.h,
                            ),
                            Divider(
                              height: 1.0.h,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              height: 24.0.h,
                            )
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
