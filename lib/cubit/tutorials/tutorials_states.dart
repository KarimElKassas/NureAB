abstract class TutorialsStates{}

class TutorialsInitialState extends TutorialsStates{}

class TutorialsSuccessEndState extends TutorialsStates{}

class TutorialsErrorEndState extends TutorialsStates{

  final String error;

  TutorialsErrorEndState(this.error);

}