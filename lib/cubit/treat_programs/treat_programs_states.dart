abstract class TreatProgramsStates{}

class TreatProgramsInitialState extends TreatProgramsStates{}

class TreatProgramsSuccessEndState extends TreatProgramsStates{}

class TreatProgramsInitializeVideoState extends TreatProgramsStates{}

class TreatProgramsChangePIPState extends TreatProgramsStates{}

class TreatProgramsChangeMCPState extends TreatProgramsStates{}

class TreatProgramsChangeThumbState extends TreatProgramsStates{}

class TreatProgramsChangeStrokeState extends TreatProgramsStates{}

class TreatProgramsErrorEndState extends TreatProgramsStates{

  final String error;

  TreatProgramsErrorEndState(this.error);

}