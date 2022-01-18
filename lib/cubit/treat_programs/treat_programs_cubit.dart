import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nureab/cubit/treat_programs/treat_programs_states.dart';
import 'package:nureab/shared/constants.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TreatProgramsCubit extends Cubit<TreatProgramsStates>{

  TreatProgramsCubit() : super(TreatProgramsInitialState());

  static TreatProgramsCubit get(context) => BlocProvider.of(context);


  bool isPIP = true;
  bool isMCP = false;
  bool isThumb = false;
  bool isStroke = false;

  String programDescriptionHead = "PIP Program Description";
  String programDescription = "Allows the therapist to move all the proximal interphalangeal joint of the patient through their full ROM passively with a modified speed chosen by the therapist.";

  void changePIP(){

    if(!isPIP){

       isMCP = false;
       isThumb = false;
       isStroke = false;
       programDescriptionHead = "PIP Program Description";
       programDescription = "Allows the therapist to move all the proximal interphalangeal joint of the patient through their full ROM passively with a modified speed chosen by the therapist.";
    }

    isPIP = !isPIP;
    emit(TreatProgramsChangePIPState());

  }

  void changeMCP(){
    if(!isMCP){

      isPIP = false;
      isThumb = false;
      isStroke = false;
      programDescriptionHead = "MCP Program Description";
      programDescription = "Allows the therapist to move all the metacarpophalangeal joints of the patient through their full ROM passively with a modified speed chosen by the therapist.";
    }

    isMCP = !isMCP;
    emit(TreatProgramsChangeMCPState());

  }

  void changeThumb(){
    if(!isThumb){

      isMCP = false;
      isPIP = false;
      isStroke = false;
      programDescriptionHead = "Thumb Program Description";
      programDescription = "Allows the therapist to move the interphalangeal joint of the patient’s thumb through their full ROM passively with a modified speed chosen by the therapist.";
    }
    isThumb = !isThumb;
    emit(TreatProgramsChangeThumbState());

  }

  void changeStroke(){
    if(!isStroke){

      isMCP = false;
      isThumb = false;
      isPIP = false;
      programDescriptionHead = "Stroke Program Description";
      programDescription = "Allow the stroke patients to hold different object sizes with a different hand grip used in different daily activities.";
    }
    isStroke = !isStroke;
    emit(TreatProgramsChangeStrokeState());

  }

  void navigate(BuildContext context, route){

    navigateTo(context, route);

    emit(TreatProgramsSuccessEndState());
  }

}