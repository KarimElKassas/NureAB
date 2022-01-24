import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nureab/cubit/reset_password/reset_password_states.dart';
import 'package:nureab/shared/constants.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordStates>{

  ResetPasswordCubit() : super(ResetPasswordInitialState());

  static ResetPasswordCubit get(context) => BlocProvider.of(context);


  void navigate(BuildContext context, route){

    navigateTo(context, route);

    emit(ResetPasswordSuccessState());
  }


  void checkUser(String userPhone, String userNewPassword)async {

    emit(ResetPasswordLoadingState());

    CollectionReference users = FirebaseFirestore.instance.collection('Users');

    users.doc(userPhone).get().then((value){

      if(!value.exists){
        emit(ResetPasswordErrorState("Phone Number doesn't exist"));
      }else{
        Map<String, Object> dataMap = HashMap();

        dataMap['UserPassword'] = userNewPassword;

        users.doc(userPhone).update(dataMap).then((value){

          emit(ResetPasswordSuccessState());

        }).catchError((error){
          emit(ResetPasswordErrorState(error.toString()));
        });

      }

    }).catchError((error){
      emit(ResetPasswordErrorState(error.toString()));
    });

  }

}