abstract class PatientListStates{}

class PatientListInitialState extends PatientListStates{}
class PatientListLoadingState extends PatientListStates{}
class PatientListSearchEndState extends PatientListStates{}
class AgeDialogChangeAgeState extends PatientListStates{}
class PatientListSuccessEndState extends PatientListStates{}



class PatientListErrorEndState extends PatientListStates{

  final String error;

  PatientListErrorEndState(this.error);

}