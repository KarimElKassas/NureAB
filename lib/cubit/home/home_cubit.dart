import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nureab/cubit/home/home_states.dart';
import 'package:nureab/model/home_items_model.dart';
import 'package:nureab/screens/home_screens/home/tutorials_screen.dart';
import 'package:nureab/shared/constants.dart';

class HomeCubit extends Cubit<HomeStates>{

  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  List<HomeItemsModel> homeItems = [
    HomeItemsModel(
        title: "Tutorials",
        subTitle: "Here To Help You",destination: TutorialsScreen(),
        image: 'assets/images/base.png'),
    HomeItemsModel(
        title: "Treatment programs",destination: TutorialsScreen(),
        subTitle: "Explore Programs",
        image: 'assets/images/base2.png'),
  ];


  void navigate(BuildContext context, route){

    navigateTo(context, route);

    emit(HomeSuccessEndState());
  }

}