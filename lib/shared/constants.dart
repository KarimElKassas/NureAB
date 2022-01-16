import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fluttertoast/fluttertoast.dart';

Color orangeColor = const Color(0xFFF69323);
Color greyColor = const Color(0xffEBEEF5);
Color greyThreeColor = const Color(0xff92A8C4);
Color greyFiveColor = const Color(0xFFEBEEF5);
Color greySixColor = const Color(0xFFF8F9FC);
Color darkBlueColor = const Color(0xff0F2644);
Color secondaryColor = const Color(0xff003D8C);
Color lightSecondaryColor = const Color(0xff197DFF);

Widget defaultTextButton(
        { Function onPressed,
         String text,
        Color textColor = Colors.black,
        TextStyle textStyle}) =>
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

Widget defaultOutLinedButton({
  double width = double.infinity,
  Color background = Colors.transparent,
  Color textColor = Colors.white,
  double radius = 8.0,
  bool isUpperCase = true,
  TextStyle textStyle,
   VoidCallback function,
   String text,
}) =>
    OutlinedButton(
      onPressed: () {},
      child: Text(
        isUpperCase ? text.toUpperCase() : text,
        textAlign: TextAlign.center,
        style: textStyle ?? TextStyle(
            fontFamily: "Open Sans",
            fontWeight: FontWeight.bold,
            fontSize: 13.0,
            letterSpacing: 2,
            color: textColor),
      ),
      style: OutlinedButton.styleFrom(
        side: const BorderSide(width: 2.0, color: Colors.white),
      ),
    );

Widget defaultButton({
  double width = double.infinity,
  Color background = const Color(0xFFF69323),
  Color borderColor = const Color(0xFFF69323),
  Color textColor = const Color(0xff0F2644),
  double radius = 8.0,
  bool isUpperCase = true,
  TextStyle textStyle,
   VoidCallback function,
   String text,
}) =>
    Container(
      width: width,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        color: background,
      ),
      child: MaterialButton(
        onPressed: function,
        height: 30,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          textAlign: TextAlign.center,
          style: textStyle ??
              TextStyle(
                  fontFamily: "Open Sans",
                  fontWeight: FontWeight.bold,
                  fontSize: 13.0,
                  letterSpacing: 2,
                  color: textColor),
        ),
        splashColor: background,
      ),
    );

Future<bool> showToast({
   String message,
   dynamic length,
   dynamic gravity,
   int timeInSecForIosWeb,
  Color backgroundColor,
  Color textColor,
  double fontSize,
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
