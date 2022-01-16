import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nureab/cubit/login/login_states.dart';
import 'package:nureab/shared/constants.dart';

class LoginCubit extends Cubit<LoginStates>{

  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);


  void navigate(BuildContext context, route){

    navigateTo(context, route);

    emit(LoginSuccessEndState());
  }

}