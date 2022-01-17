import 'package:flutter/material.dart';
import 'package:nureab/shared/constants.dart';
import 'home_screens/settings_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nureab/screens/home_screens/patientList_screen.dart';

import 'home_screens/home_screen.dart';

class BottomNavigation extends StatefulWidget {
  int comingIndex = -1;

  BottomNavigation({ this.comingIndex});

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int currentIndex = 0;

  final tabs = [HomeScreen(), PatientScreen(), SettingsScreen()];

  @override
  void initState() {
    (widget.comingIndex != -1 && widget.comingIndex != null)
        ? currentIndex = widget.comingIndex
        : currentIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          child: Image.asset('assets/images/loho.PNG')),
                      Icon(
                        Icons.notifications,
                        color: darkBlueColor,
                        size: 35,
                      )
                    ],
                  ),
                ),
              ),
              tabs[currentIndex],
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
              setState(() {
                currentIndex = index;
              });
            },
            unselectedItemColor: darkBlueColor,
            selectedItemColor: secondaryColor,
            backgroundColor: greyFiveColor,
            currentIndex: currentIndex,
            elevation: 20,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.people_outline),
                  label: "Patient's List"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings_outlined), label: "Settings")
            ],
          ),
        ),
      ),
    );
  }
}
