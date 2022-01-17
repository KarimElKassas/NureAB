import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nureab/cubit/settings/settings_states.dart';
import 'package:nureab/shared/constants.dart';

class SettingsCubit extends Cubit<SettingsStates>{

  SettingsCubit() : super(SettingsInitialState());

  static SettingsCubit get(context) => BlocProvider.of(context);

  void navigate(BuildContext context, route){

    navigateTo(context, route);

    emit(SettingsSuccessEndState());
  }

}