import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nureab/cubit/patient_list/patient_list_states.dart';
import 'package:nureab/model/drop_list_model.dart';
import 'package:nureab/model/patient_model.dart';
import 'package:nureab/shared/constants.dart';

class PatientListCubit extends Cubit<PatientListStates>{

  PatientListCubit() : super(PatientListInitialState());

  static PatientListCubit get(context) => BlocProvider.of(context);


  DropListModel idDropListModel = DropListModel([
    OptionItem(id: 1, title: "17-24"),
    OptionItem(id: 2, title: "25-30"),
    OptionItem(id: 3, title: "30-36")
  ]);

  OptionItem idOptionItemSelected = OptionItem(id: 0, title: "12-16");


  void changeAgeIndex(OptionItem optionItem) {
    idOptionItemSelected = optionItem;
    emit(AgeDialogChangeAgeState());
  }

  List<PatientModel> patientList = [
    PatientModel(
        name: 'Karim Mahdi', date: 'Started:2/4/2021', age: 42, gender: 'M'),
    PatientModel(
        name: 'Amal Amaar', date: 'Started:2/4/2021', age: 42, gender: 'F'),
    PatientModel(
        name: 'Karim Mahdi', date: 'Started:2/4/2021', age: 42, gender: 'M'),
    PatientModel(
        name: 'Amal Amaar', date: 'Started:2/4/2021', age: 42, gender: 'F'),
    PatientModel(
        name: 'Karim Mahdi', date: 'Started:2/4/2021', age: 42, gender: 'M'),
    PatientModel(
        name: 'Amal Amaar', date: 'Started:2/4/2021', age: 42, gender: 'F'),
    PatientModel(
        name: 'Karim Mahdi', date: 'Started:2/4/2021', age: 42, gender: 'M'),
    PatientModel(
        name: 'Amal Amaar', date: 'Started:2/4/2021', age: 42, gender: 'F'),
  ];

  void navigate(BuildContext context, route){

    navigateTo(context, route);

    emit(PatientListSuccessEndState());
  }

}