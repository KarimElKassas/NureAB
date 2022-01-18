import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nureab/cubit/setup_program/setup_program_states.dart';
import 'package:nureab/model/drop_list_model.dart';
import 'package:nureab/shared/constants.dart';

class ProgramSetupCubit extends Cubit<ProgramSetupStates>{

  ProgramSetupCubit() : super(ProgramSetupInitialState());

  static ProgramSetupCubit get(context) => BlocProvider.of(context);

  String programDuration = "";
  String programRepetition = "";

  bool isVibration = true;
  bool isLargeGrip = true;
  bool isGripVisible = false;

  double programSmallAngle = 20;
  double programBigAngle = 60;

  DropListModel idDropListModel = DropListModel([
    OptionItem(id: 1, title: "PIP Treatment Program"),
    OptionItem(id: 2, title: "MCP Treatment Program"),
    OptionItem(id: 3, title: "Thumb Treatment Program"),
    OptionItem(id: 4, title: "Stroke Treatment Program")
  ]);
  OptionItem idOptionItemSelected = OptionItem(id: 0, title: "Select Program");

  void changeProgramIndex(OptionItem optionItem) {
    idOptionItemSelected = optionItem;
    emit(ProgramSetupChangeProgramState());
  }
  void showGripVisibility() {
    isGripVisible = true;
    emit(ProgramSetupChangeGripVisibilityState());
  }
  void hideGripVisibility() {
    isGripVisible = false;
    emit(ProgramSetupChangeGripVisibilityState());
  }

  void changeDuration(duration){
    programDuration = duration;
    emit(ProgramSetupChangeDurationState(programDuration));
  }

  void changeRepetition(repetition){
    programRepetition = repetition;
    emit(ProgramSetupChangeRepetitionState(programRepetition));
  }

  void changeVibration(){
    isVibration = !isVibration;
    emit(ProgramSetupChangeVibrationState());
  }
  void changeGripSize(){
    isLargeGrip = !isLargeGrip;
    emit(ProgramSetupChangeGripSizeState());
  }
  void changeAngle(newSmallRating, newBigRating){

    programSmallAngle = newSmallRating;
    programBigAngle = newBigRating;
    emit(ProgramSetupChangeProgramAngleState());

  }
  void navigate(BuildContext context, route){

    navigateTo(context, route);

    emit(ProgramSetupSuccessEndState());
  }

}