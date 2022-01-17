import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nureab/cubit/wear_device/wear_device_states.dart';
import 'package:nureab/shared/constants.dart';

class WearDeviceCubit extends Cubit<WearDeviceStates>{

  WearDeviceCubit() : super(WearDeviceInitialState());

  static WearDeviceCubit get(context) => BlocProvider.of(context);

  double PIP = 50;
  double MCP = 45;
  double Thumb = 45;


  void changePIP(newRating){

    PIP = newRating;
    emit(WearDeviceChangePIPState());

  }
  void changeMCP(newRating){

    MCP = newRating;
    emit(WearDeviceChangeMCPState());

  }
  void changeThumb(newRating){

    Thumb = newRating;
    emit(WearDeviceChangeThumbState());

  }

  void navigate(BuildContext context, route){

    navigateTo(context, route);

    emit(WearDeviceSuccessEndState());
  }

}