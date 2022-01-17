import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nureab/cubit/bluetooth/bluetooth_states.dart';
import 'package:nureab/shared/constants.dart';

class BluetoothCubit extends Cubit<BluetoothStates>{

  BluetoothCubit() : super(BluetoothInitialState());

  static BluetoothCubit get(context) => BlocProvider.of(context);

  void navigate(BuildContext context, route){

    navigateTo(context, route);

    emit(BluetoothSuccessEndState());
  }

}