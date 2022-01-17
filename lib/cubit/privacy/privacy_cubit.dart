import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nureab/cubit/privacy/privacy_states.dart';
import 'package:nureab/shared/constants.dart';

class PrivacyCubit extends Cubit<PrivacyStates>{

  PrivacyCubit() : super(PrivacyInitialState());

  static PrivacyCubit get(context) => BlocProvider.of(context);

  void navigate(BuildContext context, route){

    navigateTo(context, route);

    emit(PrivacySuccessEndState());
  }

}