import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nureab/cubit/registration/registration_states.dart';
import 'package:nureab/screens/login_screen.dart';
import 'package:nureab/shared/constants.dart';

class RegistrationCubit extends Cubit<RegistrationStates>{

  RegistrationCubit() : super(RegistrationInitialState());

  static RegistrationCubit get(context) => BlocProvider.of(context);


  void navigate(BuildContext context, route){

    navigateTo(context, route);

    emit(RegistrationSuccessEndState());
  }


  void addUser(BuildContext context, String userName, String userPassword, String userEmail, String userPhone, String userWorkName)async {
    try {
      emit(RegistrationLoadingCreateUserState());

      FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: userEmail,
          password: userPassword
      ).then((value){

        saveUser(context, userName, userEmail, userPhone, userWorkName, userPassword);

      }).catchError((error){

        emit(RegistrationErrorCreateUserState(error.toString()));

      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegistrationErrorCreateUserState("The password provided is too weak."));
      } else if (e.code == 'email-already-in-use') {
        emit(RegistrationErrorCreateUserState("The account already exists for that email."));
      }
    } catch (e) {
      emit(RegistrationErrorCreateUserState(e.toString()));
    }
  }

  void saveUser(BuildContext context,String userName,String userEmail,String userPhone,String userWorkName,String userPassword)async {

    CollectionReference users = FirebaseFirestore.instance.collection('Users');
    DocumentReference userDoc = users.doc(userEmail);
    Map<String, Object> dataMap = HashMap();

    dataMap['UserName'] = userName;
    dataMap['UserEmail'] = userEmail;
    dataMap['UserPhone'] = userPhone;
    dataMap['UserWorkName'] = userWorkName;
    dataMap["UserPassword"] = userPassword;

    userDoc.collection('User Info').doc(userEmail).set(dataMap).then((value){

      navigateAndFinish(context, LoginScreen());

      emit(RegistrationSuccessSaveUserState());

    }).catchError((error){

      emit(RegistrationErrorSaveUserState(error.toString()));

    });
  }

}