import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nureab/cubit/bottom_nav/bottom_nav_cubit.dart';
import 'package:nureab/cubit/bottom_nav/bottom_nav_states.dart';
import 'package:nureab/screens/home_screens/home/treatmentPrograms_screen.dart';
import 'package:nureab/screens/program_setup_screen.dart';
import 'package:nureab/screens/splash_screen.dart';
import 'package:nureab/shared/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();

  Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(411.42857, 899.42857),
        builder: () {
          return BlocProvider(
            create: (context) => BottomNavCubit(),
            child: BlocConsumer<BottomNavCubit, BottomNavStates>(
              listener: (context, state) {},
              builder: (context, state) {
                return MaterialApp(
                  title: 'NureAB',
                  theme: ThemeData(
                    fontFamily: "Open Sans",
                    primarySwatch: Colors.blue,
                  ),
                  debugShowCheckedModeBanner: false,
                  home: SplashScreen(),
                );
              },
            ),
          );
        });
  }
}
