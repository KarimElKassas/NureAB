import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nureab/cubit/tutorials/tutorials_cubit.dart';
import 'package:nureab/cubit/tutorials/tutorials_states.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nureab/shared/widgets/back_bar.dart';
import '../../bottomNavigation.dart';

class TutorialsScreen extends StatefulWidget {
  const TutorialsScreen({Key key}) : super(key: key);

  @override
  _TutorialsScreenState createState() => _TutorialsScreenState();
}

class _TutorialsScreenState extends State<TutorialsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TutorialsCubit(),
      child: BlocConsumer<TutorialsCubit, TutorialsStates>(
        listener: (context, state){},
        builder: (context, state){

          var cubit = TutorialsCubit.get(context);

          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  BackBar(destination: BottomNavigation(comingIndex: 0,),),
                  SizedBox(
                    height: 16.h,
                  ),
                  Expanded(
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Stack(
                          children: [
                            InkWell(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 12, right: 12, bottom: 8),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 160.h,
                                  child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15.0),
                                      ),
                                      elevation: 4,
                                      child: Image.asset(
                                        cubit.tutorialsItems[index].image,
                                        fit: BoxFit.fill,
                                      )),
                                ),
                              ),
                              onTap: () {
                                if(cubit.tutorialsItems[index].destination != null){
                                  cubit.navigate(context, cubit.tutorialsItems[index].destination);
                                }
                              },
                            ),
                            Positioned(
                              bottom: 25.h,
                              left: 25.w,
                              child: Text(
                                cubit.tutorialsItems[index].subTitle,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: ScreenUtil()
                                        .setSp(18, allowFontScalingSelf: true),
                                    color: Colors.white),
                              ),
                            ),   Positioned(
                                bottom: 25.h,
                                right: 30.w,
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                  size: 30,
                                )
                            )
                          ],
                        );
                      },
                      itemCount: cubit.tutorialsItems.length,
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
