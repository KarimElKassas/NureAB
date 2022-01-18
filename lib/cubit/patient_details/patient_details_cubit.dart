import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nureab/cubit/patient_details/patient_details_states.dart';
import 'package:nureab/model/drop_list_model.dart';
import 'package:nureab/shared/constants.dart';

class PatientDetailsCubit extends Cubit<PatientDetailsStates> {
  PatientDetailsCubit() : super(PatientDetailsInitialState());

  static PatientDetailsCubit get(context) => BlocProvider.of(context);

  bool firstView = true;

  DropListModel idDropListModel = DropListModel([
    OptionItem(id: 1, title: "Latest Stats"),
    OptionItem(id: 2, title: "Old Stats"),
  ]);
  OptionItem idOptionItemSelected = OptionItem(id: 0, title: "All Stats");

  void changeGraphIndex(OptionItem optionItem) {
    idOptionItemSelected = optionItem;
    emit(PatientDetailsChangeGraphState());
  }

  void changeView() {
    firstView = !firstView;
    emit(PatientDetailsChangeViewState());
  }

  void navigate(BuildContext context, route) {
    navigateTo(context, route);

    emit(PatientDetailsSuccessEndState());
  }
}
