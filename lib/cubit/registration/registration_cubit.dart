import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nureab/cubit/registration/registration_states.dart';
import 'package:nureab/shared/constants.dart';

class RegistrationCubit extends Cubit<RegistrationStates>{

  RegistrationCubit() : super(RegistrationInitialState());

  static RegistrationCubit get(context) => BlocProvider.of(context);


  void navigate(BuildContext context, route){

    navigateTo(context, route);

    emit(RegistrationSuccessEndState());
  }

}