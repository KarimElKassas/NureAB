import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nureab/screens/activation_screen.dart';
import 'package:nureab/screens/credit_card_screen.dart';
import 'package:nureab/screens/login_screen.dart';
import 'package:nureab/screens/registration_screen.dart';
import 'package:nureab/screens/reset_password_screen.dart';
import 'package:nureab/screens/splash_screen.dart';
import 'package:nureab/shared/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize:const Size(411.42857, 899.42857),
        builder: () {
          return MaterialApp(
            title: 'NureAB',
            theme: ThemeData(
              fontFamily: "Open Sans",
              primarySwatch: Colors.blue,
            ),
            debugShowCheckedModeBanner: false,
            home: const SplashScreen(),
          );
        });
  }
}
