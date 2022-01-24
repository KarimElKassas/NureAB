import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nureab/cubit/login/login_states.dart';
import 'package:nureab/screens/check_bluetooth.dart';
import 'package:nureab/shared/constants.dart';

class LoginCubit extends Cubit<LoginStates>{

  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);


  void navigate(BuildContext context, route){

    navigateTo(context, route);

    emit(LoginSuccessState());
  }

  void signInUser(BuildContext context, String userEmail, String userPassword)async {

    try {
      emit(LoginLoadingState());

      FirebaseAuth.instance.signInWithEmailAndPassword(
          email: userEmail,
          password: userPassword
      ).then((value){
        navigateAndFinish(context, CheckBluetooth());
        emit(LoginSuccessState());
      }).catchError((error){
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

}