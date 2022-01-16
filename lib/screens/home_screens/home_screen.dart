import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nureab/shared/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8, top: 20),
            child: Align(
              alignment: AlignmentDirectional.topEnd,
              child: Container(
                width: 200.w,
                height: 60.h,
                decoration: BoxDecoration(
                  color: lightSecondaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.all(10),
                child: Center(
                  child: Text(
                    'Treat New Patient',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize:
                            ScreenUtil().setSp(16, allowFontScalingSelf: true)),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          ListView.builder(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 180.h,
                      child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          elevation: 3,
                          child: Image.asset(
                            homeItems[index].image,
                            fit: BoxFit.fill,
                          )),
                    ),
                  ),
                  Positioned(
                    top: 90.h,
                    left: 40.w,
                    child: Column(
                      children: [
                        Text(
                          homeItems[index].title,
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontSize: ScreenUtil()
                                  .setSp(24, allowFontScalingSelf: true),
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Text(
                          homeItems[index].subTitle,
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontSize: ScreenUtil()
                                  .setSp(18, allowFontScalingSelf: true),
                              color: Colors.orange),
                        )
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                  )
                ],
              );
            },
            itemCount: homeItems.length,
          ),






          Padding(
            padding: const EdgeInsets.all(10.0),
            child: defaultButton(
              function: () {

              },
              text: "Wear Device",
              background: greySixColor,
              borderColor: greyFiveColor,
              isUpperCase: false,
              textStyle:  TextStyle(
                  fontWeight: FontWeight.bold, fontSize:ScreenUtil()
                  .setSp(16, allowFontScalingSelf: true) ,color: Colors.indigo),
            ),
          ),
        ],
      ),
    );
  }
}

List<HomeItems> homeItems = [
  HomeItems(
      title: "Tutorials",
      subTitle: "Here To Help You",
      image: 'assets/images/base.png'),
  HomeItems(
      title: "Treatment programs",
      subTitle: "Explore Programs",
      image: 'assets/images/base2.png'),
];

class HomeItems {
  String title, subTitle, image;

  HomeItems({ this.title, this.subTitle, this.image});
}
