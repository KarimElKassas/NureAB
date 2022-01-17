import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nureab/cubit/tutorials/tutorials_states.dart';
import 'package:nureab/model/home_items_model.dart';
import 'package:nureab/shared/constants.dart';

class TutorialsCubit extends Cubit<TutorialsStates>{

  TutorialsCubit() : super(TutorialsInitialState());

  static TutorialsCubit get(context) => BlocProvider.of(context);

  List<HomeItemsModel> tutorialsItems = [
    HomeItemsModel(
        subTitle: "Wearing device tutorial", image: 'assets/images/tut5.png'),
    HomeItemsModel(
        subTitle: "Setup a program Tutorial", image: 'assets/images/tut4.png'),
    HomeItemsModel(
        subTitle: "Treat New patient Tutorial", image: 'assets/images/tut3.png'),
    HomeItemsModel(
        subTitle: "Treat Existing Patient Tutorial",
        image: 'assets/images/tut2.png'),
    HomeItemsModel(
        subTitle: "Get Patient’s reports Tutorial",
        image: 'assets/images/tut1.png'),
  ];

  void navigate(BuildContext context, route){

    navigateTo(context, route);

    emit(TutorialsSuccessEndState());
  }

}