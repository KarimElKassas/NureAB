import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nureab/cubit/credit_card/credit_card_cubit.dart';
import 'package:nureab/cubit/credit_card/credit_card_states.dart';
import 'package:nureab/screens/activation_screen.dart';
import 'package:nureab/shared/constants.dart';

class CreditCardScreen extends StatelessWidget {
  var cardNumberController = TextEditingController();
  var cardHolderNameController = TextEditingController();
  var expireDateController = TextEditingController();
  var cvcController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreditCardCubit(),
      child: BlocConsumer<CreditCardCubit, CreditCardStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = CreditCardCubit.get(context);

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
                          "Credit Card Details",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              overflow: TextOverflow.ellipsis),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 5,
                        ),
                      ),
                      const SizedBox(
                        height: 28.0,
                      ),
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontFamily: "Open Sans",
                            color: Colors.white,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: "18\$ ",
                              style: TextStyle(
                                color: orangeColor,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Open Sans",
                                fontSize: 18.0,
                              ),
                            ),
                            const TextSpan(
                              text: "For ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontFamily: "Open Sans",
                                  overflow: TextOverflow.ellipsis),
                            ),
                            TextSpan(
                              text: "1 month ",
                              style: TextStyle(
                                color: orangeColor,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Open Sans",
                                fontSize: 18.0,
                              ),
                            ),
                            const TextSpan(
                              text: "Subscription Using Rehandelaton",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontFamily: "Open Sans",
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ],
                        ),
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
                              "Card Number",
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
                        controller: cardNumberController,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        // Moves focus to next.
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'you must type card number';
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
                          hintText: 'Enter Number',
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
                              "Card Holder Name",
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
                        controller: cardHolderNameController,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        // Moves focus to next.
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'you must type name';
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
                        height: 12.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 4.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: const [
                                      Text(
                                        "Expire Date",
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
                                SizedBox(
                                  width: 150,
                                  child: TextFormField(
                                    controller: expireDateController,
                                    inputFormatters: [cubit.maskFormatter],
                                    keyboardType: TextInputType.number,
                                    textInputAction: TextInputAction.next,
                                    // Moves focus to next.
                                    validator: (String value) {
                                      if (value.isEmpty) {
                                        return 'you must type expire date';
                                      }
                                      var expireDate =
                                          cubit.maskFormatter.getMaskedText();
                                      var parts = expireDate.split('/');
                                      var expireMonth = parts[0].trim();
                                      var expireYear = parts[1].trim();

                                      if (int.parse(expireMonth) > 12) {
                                        return 'invalid expire date';
                                      }

                                      if (expireYear.startsWith("0")) {
                                        return 'invalid expire date';
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
                                      hintText: '-- / ----',
                                      hintStyle: TextStyle(
                                          color: greyThreeColor,
                                          fontFamily: "Open Sans",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w600),
                                      alignLabelWithHint: true,
                                      focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.white, width: 2.0),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8.0))),
                                      border: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8.0))),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 4.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: const [
                                      Text(
                                        "CVC",
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
                                SizedBox(
                                  width: 150,
                                  child: TextFormField(
                                    controller: cvcController,
                                    keyboardType: TextInputType.number,
                                    textInputAction: TextInputAction.done,
                                    // Moves focus to next.
                                    validator: (String value) {
                                      if (value.isEmpty) {
                                        return 'you must type CVC Number';
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
                                      hintText: 'Enter CVC',
                                      hintStyle: TextStyle(
                                          color: greyThreeColor,
                                          fontFamily: "Open Sans",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w600),
                                      alignLabelWithHint: true,
                                      focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.white, width: 2.0),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8.0))),
                                      border: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8.0))),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 36.0,
                      ),
                      defaultButton(
                        function: () {
                          if (formKey.currentState.validate()) {

                            cubit.navigate(context, ActivationScreen());

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
                          Column(
                            children: const [
                              Text(
                                'You Will receive an activation code in',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Open Sans",
                                    fontSize: 16.0,
                                    overflow: TextOverflow.ellipsis),
                              ),
                              Text(
                                'SMS on your phone now.',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Open Sans",
                                    fontSize: 16.0,
                                    overflow: TextOverflow.ellipsis),
                              ),
                            ],
                          )
                        ],
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
