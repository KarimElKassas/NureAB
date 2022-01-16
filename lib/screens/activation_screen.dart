import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nureab/cubit/activation/activation_cubit.dart';
import 'package:nureab/cubit/activation/activation_states.dart';
import 'package:nureab/screens/registration_screen.dart';
import 'package:nureab/shared/constants.dart';

class ActivationScreen extends StatelessWidget {

  var codeController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ActivationCubit(),
      child: BlocConsumer<ActivationCubit, ActivationStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ActivationCubit.get(context);

          return Scaffold(
            backgroundColor: darkBlueColor,
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 120.0, bottom: 48.0, left: 18.0, right: 18.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      SvgPicture.asset("assets/images/app_logo.svg"),
                      const SizedBox(
                        height: 42.0,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 18.0),
                        child: Text(
                          "Activation Code",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              overflow: TextOverflow.ellipsis),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 5,
                        ),
                      ),
                      const SizedBox(
                        height: 36.0,
                      ),
                      Text(
                        "Enter Your Activation Code Received on Your Phone To Activate Your Account.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: orangeColor,
                            fontSize: 16.0,
                            overflow: TextOverflow.ellipsis),
                        maxLines: 5,
                      ),
                      const SizedBox(
                        height: 64.0,
                      ),
                      TextFormField(
                        controller: codeController,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done, // Moves focus to next.
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'you must type activation code';
                          }
                        },
                        style: TextStyle(
                            color: greyThreeColor,
                            fontFamily: "Open Sans",
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Enter Activation Code',
                          hintStyle: TextStyle(
                              color: greyThreeColor,
                              fontFamily: "Open Sans",
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600),
                          alignLabelWithHint: true,
                          focusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0))),
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0))),
                        ),
                      ),

                      const SizedBox(
                        height: 64.0,
                      ),
                      defaultButton(
                          function: () {
                            if(formKey.currentState!.validate()){

                              showToast(
                                  message: "Done",
                                  length: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 3);
                            }

                          },
                          text: "Done",
                          background: orangeColor,
                          isUpperCase: false,
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w800, letterSpacing: 1.5, color: darkBlueColor),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
