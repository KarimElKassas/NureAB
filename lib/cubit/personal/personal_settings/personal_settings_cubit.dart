import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nureab/cubit/personal/personal_settings/personal_settings_states.dart';
import 'package:nureab/shared/constants.dart';

class PersonalSettingsCubit extends Cubit<PersonalSettingsStates>{

  PersonalSettingsCubit() : super(PersonalSettingsInitialState());

  static PersonalSettingsCubit get(context) => BlocProvider.of(context);

  void navigate(BuildContext context, route){

    navigateTo(context, route);

    emit(PersonalSettingsSuccessEndState());
  }

}