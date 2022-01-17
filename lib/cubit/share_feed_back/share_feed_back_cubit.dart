import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nureab/cubit/share_feed_back/share_feed_back_states.dart';
import 'package:nureab/shared/constants.dart';

class ShareFeedBackCubit extends Cubit<ShareFeedBackStates>{

  ShareFeedBackCubit() : super(ShareFeedBackInitialState());

  static ShareFeedBackCubit get(context) => BlocProvider.of(context);

  void navigate(BuildContext context, route){

    navigateTo(context, route);

    emit(ShareFeedBackSuccessEndState());
  }

}