import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nureab/shared/constants.dart';

class PatientScreen extends StatelessWidget {
  const PatientScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16, left: 16, top: 16),
                child: Container(
                  width: 310.w,
                  decoration: new BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: greyFiveColor,
                    border: new Border.all(
                      color: greyFiveColor,
                      width: 1.0,
                    ),
                  ),
                  child: new TextField(
                    textAlign: TextAlign.left,
                    decoration: new InputDecoration(
                        hintText: '   Search',
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                            color: greyThreeColor,
                            fontFamily: 'Almarai',
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              SizedBox(
                width: 4.w,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Image.asset('assets/images/filter.png'),
              )
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          ListView.builder(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                patientList[index].name,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.indigo,
                                    fontSize: 16),
                              ),
                              Text(patientList[index].date,
                                  style: TextStyle(
                                      color: Colors.indigo, fontSize: 16))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          children: [
                            Icon(
                              patientList[index].gender == "M"
                                  ? Icons.male
                                  : Icons.female,
                              color: Colors.indigo,
                              size: 30,
                            ),
                            SizedBox(
                              width: 16.w,
                            ),
                            Text(patientList[index].age.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.indigo,
                                    fontSize: 16)),
                            Expanded(child: Container()),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.blue,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
            itemCount: patientList.length,
          ),
        ],
      ),
    );
  }
}

List<PatientItem> patientList = [
  PatientItem(
      name: 'Karim Mahdi', date: 'Started:2/4/2021', age: 42, gender: 'M'),
  PatientItem(
      name: 'Amal Amaar', date: 'Started:2/4/2021', age: 42, gender: 'F'),
  PatientItem(
      name: 'Karim Mahdi', date: 'Started:2/4/2021', age: 42, gender: 'M'),
  PatientItem(
      name: 'Amal Amaar', date: 'Started:2/4/2021', age: 42, gender: 'F'),
  PatientItem(
      name: 'Karim Mahdi', date: 'Started:2/4/2021', age: 42, gender: 'M'),
  PatientItem(
      name: 'Amal Amaar', date: 'Started:2/4/2021', age: 42, gender: 'F'),
  PatientItem(
      name: 'Karim Mahdi', date: 'Started:2/4/2021', age: 42, gender: 'M'),
  PatientItem(
      name: 'Amal Amaar', date: 'Started:2/4/2021', age: 42, gender: 'F'),
];

class PatientItem {
  String name, date, gender;
  int age;

  PatientItem({
    this.name,
    this.date,
    this.gender,
    this.age,
  });
}
