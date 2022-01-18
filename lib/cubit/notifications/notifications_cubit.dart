import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nureab/cubit/notifications/notifications_states.dart';
import 'package:nureab/shared/constants.dart';

class NotificationsCubit extends Cubit<NotificationsStates>{

  NotificationsCubit() : super(NotificationsInitialState());

  static NotificationsCubit get(context) => BlocProvider.of(context);

  void navigate(BuildContext context, route){

    navigateTo(context, route);

    emit(NotificationsSuccessEndState());
  }

}