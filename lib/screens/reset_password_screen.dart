import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nureab/cubit/reset_password/reset_password_cubit.dart';
import 'package:nureab/cubit/reset_password/reset_password_states.dart';
import 'package:nureab/screens/registration_screen.dart';
import 'package:nureab/shared/constants.dart';
import 'package:auto_size_text/auto_size_text.dart';

class ResetPasswordScreen extends StatelessWidget {
  var newPasswordController = TextEditingController();
  var confirmNewPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResetPasswordCubit(),
      child: BlocConsumer<ResetPasswordCubit, ResetPasswordStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ResetPasswordCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: darkBlueColor,
                statusBarIconBrightness: Brightness.light, // For Android (dark icons)
                statusBarBrightness: Brightness.dark, // For iOS (dark icons)
              ),
              toolbarHeight: 0,
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
            backgroundColor: darkBlueColor,
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 120.0, bottom: 36.0, left: 18.0, right: 18.0),
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
                        child: AutoSizeText(
                          "Reset Your Password",
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
                      AutoSizeText(
                        "A Link had been Sent To Your Registered Email to reset password",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: orangeColor,
                            fontSize: 16.0,
                            overflow: TextOverflow.ellipsis),
                        maxLines: 5,
                      ),
                      const SizedBox(
                        height: 36.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontFamily: "Open Sans",
                                  color: Colors.white,
                                ),
                                children: <TextSpan>[
                                  const TextSpan(
                                    text: "New Password ",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Open Sans",
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "*",
                                    style: TextStyle(
                                        color: orangeColor,
                                        fontSize: 16.0,
                                        fontFamily: "Open Sans",
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      TextFormField(
                        controller: newPasswordController,
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.next, // Moves focus to next.
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'you must type new password';
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
                          hintText: 'Enter Password',
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
                        height: 18.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontFamily: "Open Sans",
                                  color: Colors.white,
                                ),
                                children: <TextSpan>[
                                  const TextSpan(
                                    text: "Confirm New Password ",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Open Sans",
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "*",
                                    style: TextStyle(
                                        color: orangeColor,
                                        fontSize: 16.0,
                                        fontFamily: "Open Sans",
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      TextFormField(
                        controller: confirmNewPasswordController,
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done, // Moves focus to next.
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'you must type confirm password';
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
                          hintText: 'Re-enter Password',
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
                        height: 48.0,
                      ),
                      defaultButton(
                          function: () {
                            if(formKey.currentState.validate()){

                              var newPass = newPasswordController.text.toString();
                              var confirmNewPass = confirmNewPasswordController.text.toString();
                              if(newPass != confirmNewPass){
                                showToast(
                                    message: "New Password and Confirm doesn't match ",
                                    length: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 3);
                              }else{
                                showToast(
                                    message: "Changed",
                                    length: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 3);
                              }



                            }

                          },
                          text: "Change Password",
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
