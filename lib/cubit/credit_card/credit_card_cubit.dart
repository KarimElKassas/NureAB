import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nureab/cubit/credit_card/credit_card_states.dart';
import 'package:nureab/shared/constants.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CreditCardCubit extends Cubit<CreditCardStates>{

  CreditCardCubit() : super(CreditCardInitialState());

  static CreditCardCubit get(context) => BlocProvider.of(context);

  var maskFormatter =  MaskTextInputFormatter(mask: '##/####', filter: { "#": RegExp(r'[0-9]') });


  void navigate(BuildContext context, route){

    navigateTo(context, route);

    emit(CreditCardSuccessEndState());
  }

}