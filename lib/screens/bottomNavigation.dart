import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nureab/cubit/bottom_nav/bottom_nav_cubit.dart';
import 'package:nureab/cubit/bottom_nav/bottom_nav_states.dart';
import 'package:nureab/shared/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavigation extends StatefulWidget {
  int comingIndex = -1;

  BottomNavigation({ this.comingIndex});

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {

  @override
  void initState() {
    (widget.comingIndex != -1 && widget.comingIndex != null)
        ? BottomNavCubit.get(context).currentIndex = widget.comingIndex
        : BottomNavCubit.get(context).currentIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavCubit(),
      child: BlocConsumer<BottomNavCubit, BottomNavStates>(
        listener: (context, state){},
        builder: (context, state){

          var cubit = BottomNavCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: greyFiveColor,
                statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
                statusBarBrightness: Brightness.light, // For iOS (dark icons)
              ),
              toolbarHeight: 0,
              elevation: 0,
            ),
            body: SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  children: [
                    Container(
                      color: greyFiveColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(color: greyFiveColor,
                                width: 150.w,
                                child: SvgPicture.asset("assets/images/logo.svg")),
                            Icon(
                              IconlyBold.notification,
                              color: darkBlueColor,
                              size: 35,
                            )
                          ],
                        ),
                      ),
                    ),
                    cubit.screens[cubit.currentIndex],
                  ],
                ),
              ),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
                child: BottomNavigationBar(
                  iconSize: 30,
                  onTap: (index) {
                    cubit.changeBottomNavBarIndex(index, context);
                  },
                  unselectedItemColor: darkBlueColor,
                  selectedItemColor: secondaryColor,
                  backgroundColor: greyFiveColor,
                  currentIndex: cubit.currentIndex,
                  elevation: 20,
                  items: cubit.bottomNavigationItems,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
