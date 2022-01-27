abstract class AddPatientStates{}

class AddPatientInitialState extends AddPatientStates{}

class AddPatientChangeInjuryState extends AddPatientStates{}

class AddPatientChangeGenderState extends AddPatientStates{}

class AddPatientChangeHandState extends AddPatientStates{}

class AddPatientSuccessEndState extends AddPatientStates{}

class AddPatientLoadingState extends AddPatientStates{}

class AddPatientErrorEndState extends AddPatientStates{

  final String error;

  AddPatientErrorEndState(this.error);

}