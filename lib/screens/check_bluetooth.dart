import 'package:app_settings/app_settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nureab/cubit/bluetooth/bluetooth_cubit.dart';
import 'package:nureab/cubit/bluetooth/bluetooth_states.dart';
import 'package:nureab/screens/bottomNavigation.dart';
import 'package:nureab/shared/constants.dart';
import 'package:auto_size_text/auto_size_text.dart';

class CheckBluetooth extends StatefulWidget {
  const CheckBluetooth({Key key}) : super(key: key);

  @override
  State<CheckBluetooth> createState() => _CheckBluetoothState();
}

class _CheckBluetoothState extends State<CheckBluetooth> {
  FlutterBlue flutterBlue = FlutterBlue.instance;

  bool bluetoothEnabled=false;

  Future<bool> _checkDeviceBluetoothIsOn() async {

    bluetoothEnabled=await flutterBlue.isOn;

    print('bluetooth enabled is $bluetoothEnabled');
    return await flutterBlue.isOn;
  }

  @override
  void initState() {
    Future.delayed(Duration(seconds: 1));
    _checkDeviceBluetoothIsOn();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    print('build');
    if(bluetoothEnabled){
      print('d5ltttt');
      navigateAndFinish(context, BottomNavigation(comingIndex: 0,));
    }
    return BlocProvider(
      create: (context) => BluetoothCubit(),
      child: BlocConsumer<BluetoothCubit, BluetoothStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = BluetoothCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                statusBarIconBrightness: Brightness.dark,
                // For Android (dark icons)
                statusBarBrightness: Brightness.light, // For iOS (dark icons)
              ),
              toolbarHeight: 0,
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
            body: SafeArea(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      navigateTo(
                          context,
                          BottomNavigation(
                            comingIndex: 0,
                          ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                          alignment: Alignment.topRight,
                          child: Icon(
                            Icons.close,
                            size: 40,
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, top: 20),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: AutoSizeText(
                          'Activate Bluetooth',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: ScreenUtil()
                                  .setSp(18, allowFontScalingSelf: true),
                              color: darkBlueColor),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, top: 8, right: 16),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: AutoSizeText(
                          'To connect to your nureab device you need to activate the device bluetooth & connect it to your phone bluetooth.',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: ScreenUtil()
                                  .setSp(14, allowFontScalingSelf: true),
                              color: darkBlueColor),
                        )),
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                  Image.asset('assets/images/bluetooth.png'),
                  SizedBox(
                    height: 60.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: defaultButton(
                      function: () async {
                        AppSettings.openBluetoothSettings().then((value){
                          navigateTo(context, BottomNavigation(comingIndex: 0,));
                        });
                      },
                      text: "Activate Bluetooth",
                      background: lightSecondaryColor,
                      borderColor: lightSecondaryColor,
                      isUpperCase: false,
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1.5,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: defaultButton(
                      function: () {
                        cubit.navigate(
                            context,
                            BottomNavigation(
                              comingIndex: 0,
                            ));
                      },
                      text: "Later",
                      background: greySixColor,
                      borderColor: greyFiveColor,
                      isUpperCase: false,
                      textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: ScreenUtil()
                              .setSp(16, allowFontScalingSelf: true),
                          color: Colors.indigo),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
