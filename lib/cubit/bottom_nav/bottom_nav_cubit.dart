import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:nureab/cubit/bottom_nav/bottom_nav_states.dart';
import 'package:nureab/screens/home_screens/home/home_screen.dart';
import 'package:nureab/screens/home_screens/patientList_screen.dart';
import 'package:nureab/screens/home_screens/settings_screen.dart';

class BottomNavCubit extends Cubit<BottomNavStates> {
  BottomNavCubit() : super(BottomNavInitialState());

  static BottomNavCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  int comingIndex = -1;

  List<BottomNavigationBarItem> bottomNavigationItems = [
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.home,
      ),
      label: "Home",
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.people,
      ),
      label: "Patient's List",
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.settings,
      ),
      label: "Settings",
    ),
  ];
  List<Widget> screens = [
    HomeScreen(),
    PatientScreen(),
    SettingsScreen(),
  ];

  void changeBottomNavBarIndex(int index, BuildContext context) async {
    currentIndex = index;

    emit(BottomNavChangeIndexState());
  }
}
