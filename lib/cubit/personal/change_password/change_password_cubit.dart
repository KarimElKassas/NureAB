import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nureab/cubit/personal/change_password/change_password_states.dart';
import 'package:nureab/shared/constants.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordStates>{

  ChangePasswordCubit() : super(ChangePasswordInitialState());

  static ChangePasswordCubit get(context) => BlocProvider.of(context);

  void navigate(BuildContext context, route){

    navigateTo(context, route);

    emit(ChangePasswordSuccessEndState());
  }

}