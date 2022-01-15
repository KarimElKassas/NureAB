import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nureab/cubit/splashScreen/splash_screen_states.dart';
import 'package:nureab/screens/home_screen.dart';
import 'package:nureab/screens/login_screen.dart';
import 'package:nureab/screens/on_boarding_screen.dart';
import 'package:nureab/shared/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenCubit extends Cubit<SplashScreenStates>{

  SplashScreenCubit() : super(SplashScreenInitialState());

  static SplashScreenCubit get(context) => BlocProvider.of(context);

  bool? secondTime;

  Future<void> navigate(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    secondTime = prefs.getBool("OnBoarding");

    await Future.delayed(const Duration(milliseconds: 4000), () {});

    if(secondTime != null){

      if(secondTime!){

        navigateAndFinish(context, const LoginScreen());
        emit(SplashScreenSuccessEndState());

      }else{
        navigateAndFinish(context, const OnBoardingScreen());
        emit(SplashScreenSuccessEndState());
      }

    }else{
      navigateAndFinish(context, const OnBoardingScreen());
      emit(SplashScreenSuccessEndState());
    }

  }

}