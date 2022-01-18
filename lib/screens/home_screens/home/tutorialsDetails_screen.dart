import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nureab/screens/home_screens/home/tutorials_screen.dart';
import 'package:nureab/shared/constants.dart';
import 'package:nureab/shared/widgets/back_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_size_text/auto_size_text.dart';

class TutorialDetailsScreen extends StatelessWidget {
  const TutorialDetailsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BackBar(
            destination: TutorialsScreen(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24, left: 16),
            child: AutoSizeText(
              'Treat New patient Tutorial',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: ScreenUtil().setSp(20, allowFontScalingSelf: true),
                  color: darkBlueColor),
            ),
          ),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                    height: 250.h,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      'assets/images/videoThumbnail.png',
                      fit: BoxFit.fill,
                    )),
              ),
              Positioned(
                  top: 125,
                  right: 0,
                  left: 0,
                  child: SvgPicture.asset(
                    'assets/images/play.svg',
                  ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 16),
            child: AutoSizeText(
              'Feature Description',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: ScreenUtil().setSp(16, allowFontScalingSelf: true),
                  color: darkBlueColor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
            child: AutoSizeText(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vehicula, arcu interdum ornare lobortis, velit ipsum aliquet sapien, non mattis nulla sem nec felis. Donec a aiculis metus.',
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: ScreenUtil().setSp(16, allowFontScalingSelf: true),
                color: greyThreeColor,
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
