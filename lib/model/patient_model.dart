import 'package:nureab/model/session_model.dart';

class PatientModel {
  String name, startingDate, gender, patientCase, hand;
  int age, numOfSessions;
  List<SessionModel> sessionsList;

  PatientModel({
    this.name,
    this.startingDate,
    this.gender,
    this.age,
  });
}

