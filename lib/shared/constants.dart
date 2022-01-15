
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Color orangeColor = const Color(0xFFF69323);
Color greyColor = const Color(0xffEBEEF5);
Color darkBlueColor = const Color(0xff0F2644);

Widget defaultTextButton(
    {required Function onPressed,
      required String text,
      Color textColor = Colors.black,
      TextStyle? textStyle}) =>
    TextButton(
      onPressed: () {
        onPressed();
      },
      child: Text(
        text,
        style: textStyle ??
             TextStyle(
                fontWeight: FontWeight.w900,
                letterSpacing: 1.5,
                color: textColor,
                fontSize: 16.0),
      ),
    );
Widget defaultButton({
  double width = double.infinity,
  Color background = const Color(0xFFF69323),
  double radius = 8.0,
  bool isUpperCase = true,
  required VoidCallback function,
  required String text,
}) =>
    Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        color: background,
      ),
      child: MaterialButton(
        onPressed: function,
        height: 30,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
              letterSpacing: 2,
              color: Colors.black),
        ),
      ),
    );
Future<bool?> showToast({
  required String message,
  required dynamic length,
  required dynamic gravity,
  required int timeInSecForIosWeb,
  Color? backgroundColor,
  Color? textColor,
  double? fontSize,
}) =>
    Fluttertoast.showToast(
        msg: message,
        toastLength: length,
        gravity: gravity,
        timeInSecForIosWeb: timeInSecForIosWeb,
        backgroundColor: backgroundColor,
        textColor: textColor,
        fontSize: fontSize);

void navigateTo(context, widget) =>
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => widget));

void navigateAndFinish(context, widget) => Navigator.pushReplacement(
    context, MaterialPageRoute(builder: (context) => widget));
