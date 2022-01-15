import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nureab/cubit/onBoarding/on_boarding_states.dart';
import 'package:nureab/model/on_boarding_model.dart';
import 'package:nureab/screens/login_screen.dart';
import 'package:nureab/shared/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingCubit extends Cubit<OnBoardingStates>{

  OnBoardingCubit() : super(OnBoardingInitialState());

  static OnBoardingCubit get(context) => BlocProvider.of(context);

  var controller = PageController();

  bool isLast = false;

  List<OnBoardingModel> boarding = [
    OnBoardingModel(
      firstTitle: 'Nureab ',
      secondTitle: '',
      body: 'is a pioneer in the domain on manufacturing rehabilitation robotics in egypt & middle east',
      image: 'assets/images/on_board1.png',
    ),
    OnBoardingModel(
      firstTitle: 'Rehandeleton ',
      secondTitle: '',
      body: 'is Our First innovative solution to help people with motor disability to ease their journey and make their life better',
      image: 'assets/images/on_board2.png',
    ),
    OnBoardingModel(
      firstTitle: '',
      secondTitle: 'day 1.',
      body: "Start your Patient's hand rehabilitation from \n",
      image: 'assets/images/on_board3.png',
    )
  ];

  Future<void> navigateToLogin(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setBool("OnBoarding", true).then((value){

      navigateAndFinish(context, LoginScreen());

      emit(OnBoardingSuccessEndState());

    }).catchError((error){

      emit(OnBoardingErrorEndState(error.toString()));
    });
  }

}