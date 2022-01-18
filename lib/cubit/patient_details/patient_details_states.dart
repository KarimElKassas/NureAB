abstract class PatientDetailsStates {}

class PatientDetailsInitialState extends PatientDetailsStates {}

class PatientDetailsChangeGraphState extends PatientDetailsStates {}

class PatientDetailsChangeViewState extends PatientDetailsStates {}

class PatientDetailsSuccessEndState extends PatientDetailsStates {}

class PatientDetailsErrorEndState extends PatientDetailsStates {
  final String error;

  PatientDetailsErrorEndState(this.error);
}
