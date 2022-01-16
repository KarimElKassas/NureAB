import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nureab/cubit/reset_password/reset_password_states.dart';
import 'package:nureab/shared/constants.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordStates>{

  ResetPasswordCubit() : super(ResetPasswordInitialState());

  static ResetPasswordCubit get(context) => BlocProvider.of(context);


  void navigate(BuildContext context, route){

    navigateTo(context, route);

    emit(ResetPasswordSuccessEndState());
  }

}