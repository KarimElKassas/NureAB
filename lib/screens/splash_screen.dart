import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nureab/cubit/splashScreen/splash_screen_cubit.dart';
import 'package:nureab/cubit/splashScreen/splash_screen_states.dart';
import 'package:nureab/shared/constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashScreenCubit()..navigate(context),
      child: BlocConsumer<SplashScreenCubit, SplashScreenStates>(
        listener: (context, state){},
        builder: (context, state){

          return Scaffold(
            backgroundColor: darkBlueColor,
            body: FadeInDown(
              duration: const Duration(milliseconds: 1500),
              child: Padding(
                padding: const EdgeInsets.only(top: 220.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SvgPicture.asset("assets/images/app_logo.svg"),
                     SizedBox(height: 12.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("Back To Independent Life",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0
                          ),
                        )
                      ],
                    )
                    //Image.asset("assets/images/logo.png",width: double.infinity,),
                  ],
                ),
              ),
            ),

          );
        },
      ),
    );
  }
}
