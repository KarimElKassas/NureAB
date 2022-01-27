import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nureab/cubit/personal/personal_settings/personal_settings_states.dart';
import 'package:nureab/model/user_model.dart';
import 'package:nureab/shared/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersonalSettingsCubit extends Cubit<PersonalSettingsStates>{

  PersonalSettingsCubit() : super(PersonalSettingsInitialState());

  static PersonalSettingsCubit get(context) => BlocProvider.of(context);

  String userName,userPhone,userPassword,userWorkName,userEmail;

  void navigate(BuildContext context, route){

    navigateTo(context, route);

    emit(PersonalSettingsSuccessEndState());
  }

  Future<void> getUserData()async {

    SharedPreferences prefs = await SharedPreferences.getInstance();

    userName = prefs.getString("UserName");
    userPassword = prefs.getString("UserPassword");
    userPhone = prefs.getString("UserPhone");
    userEmail = prefs.getString("UserEmail");
    userWorkName = prefs.getString("UserWorkName");

    emit(PersonalSettingsSuccessGetDataState());

  }
}