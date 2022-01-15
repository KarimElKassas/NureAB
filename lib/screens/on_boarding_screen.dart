import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nureab/cubit/onBoarding/on_boarding_cubit.dart';
import 'package:nureab/cubit/onBoarding/on_boarding_states.dart';
import 'package:nureab/model/on_boarding_model.dart';
import 'package:nureab/shared/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnBoardingCubit(),
      child: BlocConsumer<OnBoardingCubit, OnBoardingStates>(
        listener: (context, state) {
          if (state is OnBoardingErrorEndState) {
            showToast(
                message: state.error,
                length: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 3);
          }
        },
        builder: (context, state) {
          var cubit = OnBoardingCubit.get(context);

          return Scaffold(
            backgroundColor: greyColor,
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              actions: [
                InkWell(
                  onTap: (){
                    cubit.navigateToLogin(context);
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        defaultTextButton(
                          onPressed: (){
                            cubit.navigateToLogin(context);
                          },
                          text: 'SKIP',
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 12.0),
                          child: Icon(Icons.arrow_forward_rounded, color: Colors.black,),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
              elevation: 0,
              backgroundColor: Colors.transparent,
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                statusBarIconBrightness: Brightness.dark,
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) =>
                        buildPageItem(cubit.boarding[index]),
                    itemCount: cubit.boarding.length,
                    controller: cubit.controller,
                    onPageChanged: (index) {
                      if (index == cubit.boarding.length - 1) {
                        setState(() {
                          cubit.isLast = true;
                        });
                      } else {
                        setState(() {
                          cubit.isLast = false;
                        });
                      }
                    },
                  ),
                ),
                const SizedBox(height: 40.0),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 12.0, right: 18.0, bottom: 30.0),
                  child: Row(
                    children: [
                      SmoothPageIndicator(
                        controller: cubit.controller,
                        count: cubit.boarding.length,
                        effect: ExpandingDotsEffect(
                          dotColor: Colors.grey,
                          activeDotColor: orangeColor,
                          expansionFactor: 4.0,
                          dotHeight: 10.0,
                          dotWidth: 10.0,
                        ),
                      ),
                      const Spacer(),
                      Wrap(children: [
                        defaultButton(
                          function: () {
                            if (cubit.isLast) {
                              cubit.navigateToLogin(context);
                            } else {
                              cubit.controller.nextPage(
                                  duration: const Duration(
                                    milliseconds: 500,
                                  ),
                                  curve: Curves.decelerate);
                            }
                          },
                          text: "Next",
                          isUpperCase: false,
                          radius: 8.0,
                          width: 80.0,
                        ),
                      ]),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildPageItem(OnBoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Image(
              fit: BoxFit.fill,
              image: AssetImage(model.image),
            ),
          ),
          const SizedBox(height: 10.0),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                  child: Container(
                    height: 2.5,
                    width: 70.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: orangeColor,
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: RichText(
                    text: TextSpan(
                      style:  TextStyle(
                        fontSize: 14.0,
                        fontFamily: "Open Sans",
                        color: darkBlueColor,
                      ),
                      children: <TextSpan>[
                        TextSpan(text: model.firstTitle, style:  TextStyle(
                          color: darkBlueColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Open Sans",
                          fontSize: 20.0,
                        ), ),
                        TextSpan(
                            text: model.body,
                            style:  TextStyle(
                                color: darkBlueColor,
                                fontSize: 16.0,
                                fontFamily: "Open Sans",
                                overflow: TextOverflow.ellipsis),),
                        TextSpan(
                          text: model.secondTitle,
                          style:  TextStyle(
                            color: darkBlueColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Open Sans",
                            fontSize: 20.0,),),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
}
