import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nureab/cubit/personal/personal_settings_edit/personal_settings_edit_states.dart';
import 'package:nureab/shared/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersonalSettingsEditCubit extends Cubit<PersonalSettingsEditStates>{

  PersonalSettingsEditCubit() : super(PersonalSettingsEditInitialState());

  static PersonalSettingsEditCubit get(context) => BlocProvider.of(context);

  String userName,userPhone,userPassword,userWorkName,userEmail;

  void navigate(BuildContext context, route){

    navigateTo(context, route);

    emit(PersonalSettingsEditSuccessEndState());
  }
  void getUserData(TextEditingController nameController,TextEditingController emailController,TextEditingController phoneController,TextEditingController workController,)async {

    SharedPreferences prefs = await SharedPreferences.getInstance();

    userName = prefs.getString("UserName");
    userPassword = prefs.getString("UserPassword");
    userPhone = prefs.getString("UserPhone");
    userEmail = prefs.getString("UserEmail");
    userWorkName = prefs.getString("UserWorkName");

    nameController.text = userName;
    phoneController.text = userPhone;
    emailController.text = userEmail;
    workController.text = userWorkName;

    emit(PersonalSettingsEditSuccessGetUserDataState());

  }

  void updateUserData(BuildContext context,String userName,String userEmail,String userPhone,String userPassword,String userWorkName)async{

    emit(PersonalSettingsEditLoadingUpdateUserDataState());

    CollectionReference users = FirebaseFirestore.instance.collection('Users');
    DocumentReference userDoc = users.doc(userEmail).collection("User Info").doc(userEmail);

    Map<String, dynamic> map = HashMap();

    map["UserName"] = userName;
    map["UserEmail"] = userEmail;
    map["UserPhone"] = userPhone;
    map["UserPassword"] = userPassword;
    map["UserWorkName"] = userWorkName;

    userDoc.update(map).then((value)async{

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("UserEmail", userEmail);
      await prefs.setString("UserName", userName);
      await prefs.setString("UserPassword", userPassword);
      await prefs.setString("UserPhone", userPhone);
      await prefs.setString("UserWorkName", userWorkName);

      Navigator.pop(context);

      emit(PersonalSettingsEditSuccessUpdateUserDataState());

    }).catchError((error){
      emit(PersonalSettingsEditErrorUpdateUserDataState(error.toString()));

    });

  }

}