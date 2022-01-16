import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nureab/cubit/activation/activation_states.dart';
import 'package:nureab/shared/constants.dart';

class ActivationCubit extends Cubit<ActivationStates>{

  ActivationCubit() : super(ActivationInitialState());

  static ActivationCubit get(context) => BlocProvider.of(context);

  void navigate(BuildContext context, route){

    navigateTo(context, route);

    emit(ActivationSuccessEndState());
  }

}