import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nureab/cubit/registration/registration_cubit.dart';
import 'package:nureab/cubit/registration/registration_states.dart';
import 'package:nureab/screens/credit_card_screen.dart';
import 'package:nureab/screens/login_screen.dart';
import 'package:nureab/shared/constants.dart';

class RegistrationScreen extends StatelessWidget {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var workController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegistrationCubit(),
      child: BlocConsumer<RegistrationCubit, RegistrationStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = RegistrationCubit.get(context);

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
                          "Create your nureab account",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              overflow: TextOverflow.ellipsis),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 5,
                        ),
                      ),
                      const SizedBox(
                        height: 42.0,
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
                                    text: "Your Name ",
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
                        controller: nameController,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        // Moves focus to next.
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'you must type your name';
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
                          hintText: 'Enter Name',
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
                                    text: "Email Address ",
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
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        // Moves focus to next.
                        validator: (String? value) {
                          if (value!.isEmpty) {
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
                                    text: "Phone ",
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
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                        // Moves focus to next.
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'you must type your phone';
                          }
                          if (value.length != 11) {
                            return 'phone number length must be 11 number';
                          }
                          if (!value.startsWith('011') &&
                              !value.startsWith('012') &&
                              !value.startsWith('010') &&
                              !value.startsWith('015')) {
                            return 'invalid phone number';
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
                          hintText: 'Enter Phone no.',
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
                                    text: "Hospital / Clinic Name ",
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
                        controller: workController,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        // Moves focus to next.
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'you must type work place name';
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
                          hintText: 'Work place Name',
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
                                    text: "Password ",
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
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.next,
                        // Moves focus to next.
                        validator: (String? value) {
                          if (value!.isEmpty) {
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
                                    text: "Confirm Password ",
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
                        controller: confirmPasswordController,
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,
                        // Moves focus to next.
                        validator: (String? value) {
                          if (value!.isEmpty) {
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
                          hintText: 'Re-enter password',
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
                          if (formKey.currentState!.validate()) {
                            var newPass = passwordController.text.toString();
                            var confirmNewPass = confirmPasswordController.text.toString();
                            if(newPass != confirmNewPass){
                              showToast(
                                  message: "Password and Confirm Password doesn't match ",
                                  length: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 3);
                            }else{
                              cubit.navigate(context, CreditCardScreen());
                            }
                          }
                        },
                        text: "Next",
                        background: orangeColor,
                        isUpperCase: false,
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w800, letterSpacing: 1.5),
                      ),
                      const SizedBox(
                        height: 24.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                                  text: "Already have an account? ",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Open Sans",
                                    fontSize: 16.0,
                                  ),
                                ),
                                TextSpan(
                                    text: "Sign In",
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: orangeColor,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Open Sans",
                                        overflow: TextOverflow.ellipsis),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        cubit.navigate(context, LoginScreen());
                                      }),
                              ],
                            ),
                          ),
                        ],
                      )
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
