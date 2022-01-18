/*
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
                                                    child: Text(
                                                      "choose Program",
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
                                                      Text(
                                                        "PIP Program",
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
                                                      Text(
                                                        "MCP Program",
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
                                                      radioSelected = 3;
                                                    });
                                                  },
                                                  child: Row(
                                                    children: [
                                                      Radio(
                                                          value: 3,
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
                                                      Text(
                                                        "Thumb Program",
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
                                                      radioSelected = 4;
                                                    });
                                                  },
                                                  child: Row(
                                                    children: [
                                                      Radio(
                                                          value: 4,
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
                                                      Text(
                                                        "Stroke Program",
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
                                                            if (Navigator.canPop(context)) {
                                                              Navigator.pop(context);
                                                            } else {
                                                              SystemNavigator.pop();
                                                            }
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
*/



//-------------------------------------------------------------------------------


/*
                  showDialog(
                      context: context,
                      builder: (context) {
                        return StatefulBuilder(
                          builder: (context, setState){

                            return Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Container(
                                height: 320.h,
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Text(
                                          "Patient take off the device?",
                                          style: TextStyle(
                                              fontSize: ScreenUtil().setSp(16,
                                                  allowFontScalingSelf: true),
                                              color: darkBlueColor,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
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
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Text(
                                          "To keep you patient’s hand safe we need a confirmation that he/she have taken the device off so the device return to it’s default postion",
                                          style: TextStyle(
                                            fontSize: ScreenUtil().setSp(13,
                                                allowFontScalingSelf: true),
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
                                            const EdgeInsets.only(left: 20),
                                            child: Text(
                                              "Take off the device",
                                              style: TextStyle(
                                                  fontSize: ScreenUtil().setSp(14,
                                                      allowFontScalingSelf: true),
                                                  color: greySubTitleColor,
                                                  fontWeight: FontWeight.w600),
                                              textAlign: TextAlign.start,
                                            )),
                                        Checkbox(
                                          value: isChecked,
                                          onChanged: (newValue) {
                                            setState(() {
                                            isChecked = newValue;
                                            print('is checked $isChecked');
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
                                      const EdgeInsets.symmetric(horizontal: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: defaultButton(
                                              function: () {
                                                cubit.navigate(
                                                    context,
                                                    BottomNavigation(
                                                      comingIndex: 0,
                                                    ));
                                              },
                                              text: "Yes,Taken Off",
                                              background: lightSecondaryColor,
                                              borderColor: lightSecondaryColor,
                                              isUpperCase: false,
                                              textStyle:  TextStyle(
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: ScreenUtil().setSp(14,allowFontScalingSelf: true),
                                                  color: Colors.white),
                                            ),
                                          ),
                                          SizedBox(width: 8.0.w,),
                                          Expanded(
                                            flex: 1,
                                            child: defaultButton(
                                              function: () {
                                                cubit.navigate(
                                                    context,
                                                    BottomNavigation(
                                                      comingIndex: 0,
                                                    ));
                                              },
                                              text: "Keep Position",
                                              background: greyFiveColor,
                                              textColor: darkBlueColor,
                                              borderColor: greyFiveColor,
                                              isUpperCase: false,
                                              textStyle: TextStyle(
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: ScreenUtil().setSp(14,allowFontScalingSelf: true),
                                                  color: Color(0xff0F2644)),
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
*/
