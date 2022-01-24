import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nureab/cubit/add_patient/add_patient_states.dart';
import 'package:nureab/model/drop_list_model.dart';
import 'package:nureab/shared/constants.dart';

class AddPatientCubit extends Cubit<AddPatientStates>{

  AddPatientCubit() : super(AddPatientInitialState());

  static AddPatientCubit get(context) => BlocProvider.of(context);

  bool isMale = true;
  bool isLeftHand = true;


  DropListModel idDropListModel = DropListModel([
    OptionItem(id: 1, title: "Injury One"),
    OptionItem(id: 2, title: "Injury Two"),
    OptionItem(id: 3, title: "Injury Three")
  ]);
  OptionItem idOptionItemSelected = OptionItem(id: 0, title: "Tandon Rapture");

  void changeInjuryIndex(OptionItem optionItem) {
    idOptionItemSelected = optionItem;
    emit(AddPatientChangeInjuryState());
  }

  void changeGender(){
    isMale = !isMale;
    emit(AddPatientChangeGenderState());
  }
  void changeHand(){
    isLeftHand = !isLeftHand;
    emit(AddPatientChangeHandState());
  }
  void navigate(BuildContext context, route){

    navigateTo(context, route);

    emit(AddPatientSuccessEndState());
  }

}