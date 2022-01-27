import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nureab/cubit/add_patient/add_patient_states.dart';
import 'package:nureab/model/drop_list_model.dart';
import 'package:nureab/shared/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddPatientCubit extends Cubit<AddPatientStates> {
  AddPatientCubit() : super(AddPatientInitialState());

  static AddPatientCubit get(context) => BlocProvider.of(context);

  bool isMale = true;
  bool isLeftHand = true;

  DropListModel idDropListModel = DropListModel([
    OptionItem(id: 1, title: "Injury One"),
    OptionItem(id: 2, title: "Injury Two"),
    OptionItem(id: 3, title: "Injury Three")
  ]);

  OptionItem idOptionItemSelected = OptionItem(id: 0, title: "Injury Name");

  void changeInjuryIndex(OptionItem optionItem) {
    idOptionItemSelected = optionItem;
    emit(AddPatientChangeInjuryState());
  }

  void changeGender() {
    isMale = !isMale;
    emit(AddPatientChangeGenderState());
  }

  void changeHand() {
    isLeftHand = !isLeftHand;
    emit(AddPatientChangeHandState());
  }

  void navigate(BuildContext context, route) {
    navigateTo(context, route);

    emit(AddPatientSuccessEndState());
  }

  void navigateFinish(BuildContext context, route) {
    navigateAndFinish(context, route);

    emit(AddPatientSuccessEndState());
  }

  void savePatient(
    BuildContext context,
    String patientName,
    String patientAge,
    String patientCase,
    String startingDate,
    String gender,
    String hand,
      Widget destination
  ) async {
    emit(AddPatientLoadingState());
    if(state is AddPatientLoadingState){
      print('loading y3m');
      showLoaderDialog(context);
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = await prefs.getString('userEmail');
    print('email is $email');
    CollectionReference users = FirebaseFirestore.instance.collection('Users');
    DocumentReference userDoc = users.doc(email);
    Map<String, Object> dataMap = HashMap();

    dataMap['Patient Name'] = patientName;
    dataMap['Patient Age'] = patientAge;
    dataMap['Patient Case'] = patientCase;
    dataMap['Starting Date'] = startingDate;
    dataMap["Gender"] = gender;
    dataMap["Hand"] = hand;

    userDoc.collection('Patient List').doc().set(dataMap).then((value) {
      navigateAndFinish(context, destination);

      emit(AddPatientSuccessEndState());
    }).catchError((error) {
      emit(AddPatientErrorEndState(error.toString()));
    });
  }
}
