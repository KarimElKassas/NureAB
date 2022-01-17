import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nureab/cubit/patient_list/patient_list_states.dart';
import 'package:nureab/model/drop_list_model.dart';
import 'package:nureab/model/patient_model.dart';
import 'package:nureab/shared/constants.dart';

class PatientListCubit extends Cubit<PatientListStates>{

  PatientListCubit() : super(PatientListInitialState());

  static PatientListCubit get(context) => BlocProvider.of(context);


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