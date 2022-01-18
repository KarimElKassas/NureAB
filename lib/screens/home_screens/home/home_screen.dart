import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nureab/cubit/home/home_cubit.dart';
import 'package:nureab/cubit/home/home_states.dart';
import 'package:nureab/screens/home_screens/home/treatNewPatient_screen.dart';
import 'package:nureab/screens/home_screens/home/tutorials_screen.dart';
import 'package:nureab/screens/home_screens/home/wearDevice_screen.dart';
import 'package:nureab/shared/constants.dart';

import '../../bottomNavigation.dart';

class HomeScreen extends StatelessWidget {

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state){},
        builder: (context, state){

          var cubit = HomeCubit.get(context);

          return Container(
            child: Column(
              children: [
                InkWell(onTap: (){
                  cubit.navigate(context, TreatNewPatientScreen());
                },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8, top: 20),
                    child: Align(
                      alignment: AlignmentDirectional.topEnd,
                      child: Container(
                        width: 200.w,
                        height: 60.h,
                        decoration: BoxDecoration(
                          color: lightSecondaryColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Center(
                          child: Text(
                            'Treat New Patient',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize:
                                ScreenUtil().setSp(16, allowFontScalingSelf: true)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Stack(
                      children: [
                        InkWell(

                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 180.h,
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  elevation: 3,
                                  child: Image.asset(
                                    cubit.homeItems[index].image,
                                    fit: BoxFit.fill,
                                  )),
                            ),
                          ),
                          onTap: (){
                            cubit.navigate(context, cubit.homeItems[index].destination);
                          },
                        ),
                        Positioned(
                          top: 90.h,
                          left: 40.w,
                          child: Column(
                            children: [
                              Text(
                                cubit.homeItems[index].title,
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: ScreenUtil()
                                        .setSp(24, allowFontScalingSelf: true),
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              Text(
                                cubit.homeItems[index].subTitle,
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: ScreenUtil()
                                        .setSp(18, allowFontScalingSelf: true),
                                    color: Colors.orange),
                              )
                            ],
                            crossAxisAlignment: CrossAxisAlignment.start,
                          ),
                        )
                      ],
                    );
                  },
                  itemCount: cubit.homeItems.length,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: defaultButton(
                    function: () {
                      cubit.navigate(context, WearDevice());
                    },
                    text: "Wear Device",
                    background: greySixColor,
                    borderColor: greyFiveColor,
                    isUpperCase: false,
                    textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: ScreenUtil().setSp(16, allowFontScalingSelf: true),
                        color: Colors.indigo),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}