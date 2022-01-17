import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nureab/cubit/personal/personal_settings_edit/personal_settings_edit_states.dart';
import 'package:nureab/shared/constants.dart';

class PersonalSettingsEditCubit extends Cubit<PersonalSettingsEditStates>{

  PersonalSettingsEditCubit() : super(PersonalSettingsEditInitialState());

  static PersonalSettingsEditCubit get(context) => BlocProvider.of(context);

  void navigate(BuildContext context, route){

    navigateTo(context, route);

    emit(PersonalSettingsEditSuccessEndState());
  }

}