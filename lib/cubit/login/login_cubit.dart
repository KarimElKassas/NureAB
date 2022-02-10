import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nureab/cubit/login/login_states.dart';
import 'package:nureab/model/user_model.dart';
import 'package:nureab/screens/bottomNavigation.dart';
import 'package:nureab/screens/check_bluetooth.dart';
import 'package:nureab/shared/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginCubit extends Cubit<LoginStates> {

  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  CollectionReference _collectionRef =
  FirebaseFirestore.instance.collection('Users');

  UserModel userModel;

  void navigate(BuildContext context, route) {
    navigateTo(context, route);

    emit(LoginSuccessState());
  }

  void signInUser(BuildContext context, String userEmail,
      String userPassword,bool bluetoothEnabled) async {
    try {
      emit(LoginLoadingState());

      FirebaseAuth.instance.signInWithEmailAndPassword(
          email: userEmail,
          password: userPassword
      ).then((value) async {
        SharedPreferences prefs = await SharedPreferences.getInstance();

        getUserData(userEmail).then((value) async {
          await prefs.setString("UserEmail", userModel.userEmail);
          await prefs.setString("UserName", userModel.userName);
          await prefs.setString("UserPassword", userPassword);
          await prefs.setString("UserPhone", userModel.userPhone);
          await prefs.setString("UserWorkName", userModel.userWorkName);
          bluetoothEnabled?  navigateAndFinish(context, BottomNavigation(comingIndex: 0,)):
          navigateAndFinish(context, CheckBluetooth());
          emit(LoginSuccessState());
        });

      }).catchError((error) {
        emit(LoginErrorState(error.toString()));
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginErrorState("No user found for that email."));
      } else if (e.code == 'wrong-password') {
        emit(LoginErrorState("Wrong password provided for that user."));
      }
    } catch (e) {
      emit(LoginErrorState(e.toString()));
    }
  }
  Future<void> getUserData(String userEmail)async {

    emit(LoginLoadingGetUserDataState());

    // Get docs from collection reference
   await _collectionRef.doc(userEmail).collection("User Info").doc(userEmail).get().then((value){


        userModel = UserModel.fromMapObject(value.data());
        print("User Name : ${userModel.userName}\n");
        emit(LoginSuccessGetUserDataState());

    }).catchError((error){
      emit(LoginErrorGetUserDataState(error.toString()));
    });


  }
}