import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nureab/cubit/patient_list/patient_list_states.dart';
import 'package:nureab/model/drop_list_model.dart';
import 'package:nureab/model/patient_model.dart';
import 'package:nureab/shared/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PatientListCubit extends Cubit<PatientListStates> {
  PatientListCubit() : super(PatientListInitialState());

  static PatientListCubit get(context) => BlocProvider.of(context);

  List<PatientModel> patientList;
  List<PatientModel> filteredPatientList;
  PatientModel patientModel = PatientModel();

  CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('Users');

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

  void searchPatient(String value) {
    filteredPatientList = patientList
        .where(
            (patient) => patient.name.toLowerCase().contains(value.toString()))
        .toList();
    emit(PatientListSearchEndState());
  }



  Future<List<PatientModel>> getData() async {
    emit(PatientListLoadingState());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = await prefs.getString('userEmail');

    // Get docs from collection reference
    QuerySnapshot querySnapshot =
        await _collectionRef.doc(email).collection('Patient List').get();

    // Get data from docs and convert map to List

    patientList = querySnapshot.docs.map((doc) {
      return PatientModel(
        gender: doc.get('Gender'),
        age: int.parse(doc.get('Patient Age')),
        name: doc.get('Patient Name'),
        startingDate: doc.get('Starting Date'),
      );
    }).toList();

    filteredPatientList = patientList;
    emit(PatientListSuccessEndState());

    return patientList;
  }

  void navigate(BuildContext context, route) {
    navigateTo(context, route);

    emit(PatientListSuccessEndState());
  }
}
