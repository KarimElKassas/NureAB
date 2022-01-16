import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nureab/cubit/login/login_cubit.dart';
import 'package:nureab/cubit/login/login_states.dart';
import 'package:nureab/screens/bottomNavigation.dart';
import 'package:nureab/screens/registration_screen.dart';
import 'package:nureab/screens/reset_password_screen.dart';
import 'package:nureab/shared/constants.dart';

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = LoginCubit.get(context);

          return Scaffold(
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
                        child: Text(
                          "Welcome back. Log in to your",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              overflow: TextOverflow.ellipsis),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 5,
                        ),
                      ),
                      const SizedBox(
                        height: 6.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text(
                            "nureab account.",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                overflow: TextOverflow.ellipsis),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 5,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 36.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              "Email Address",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  overflow: TextOverflow.ellipsis),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 5,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next, // Moves focus to next.
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'you must type email address';
                          }
                          if (!value.contains("@")) {
                            return 'wrong email format';
                          }
                          if (!value.contains(".")) {
                            return 'wrong email format';
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
                          hintText: 'Enter your email address',
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
                          children: const [
                            Text(
                              "Password",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  overflow: TextOverflow.ellipsis),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 5,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      TextFormField(
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done, // Moves focus to next.
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'you must type password';
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
                        height: 12.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {

                              cubit.navigate(context, ResetPasswordScreen());

                            },
                            child: const Text(
                              "Forgot Password ?",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  overflow: TextOverflow.ellipsis),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 5,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 48.0,
                      ),
                      defaultButton(
                          function: () {
                           /* if(formKey.currentState!.validate()){

                            }*/
navigateTo(context, BottomNavigation(comingIndex: 0,));
                          },
                          text: "Sign In",
                          background: orangeColor,
                          isUpperCase: false,
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.w800, letterSpacing: 1.5),
                      ),
                      const SizedBox(
                        height: 24.0,
                      ),
                      defaultButton(
                        function: () {

                          cubit.navigate(context, RegistrationScreen());

                        },
                        text: "Sign Up",
                        background: Colors.transparent,
                        borderColor: Colors.white,
                        isUpperCase: false,
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w800, letterSpacing: 1.5,color: Colors.white),
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
