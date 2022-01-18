abstract class ProgramSetupStates{}

class ProgramSetupInitialState extends ProgramSetupStates{}

class ProgramSetupChangeProgramState extends ProgramSetupStates{}

class ProgramSetupChangeGripVisibilityState extends ProgramSetupStates{}

class ProgramSetupChangeVibrationState extends ProgramSetupStates{}

class ProgramSetupChangeDurationState extends ProgramSetupStates{

  final String duration;

  ProgramSetupChangeDurationState(this.duration);

}

class ProgramSetupChangeRepetitionState extends ProgramSetupStates{

  final String repetition;

  ProgramSetupChangeRepetitionState(this.repetition);

}

class ProgramSetupChangeGripSizeState extends ProgramSetupStates{}

class ProgramSetupChangeProgramAngleState extends ProgramSetupStates{}

class ProgramSetupSuccessEndState extends ProgramSetupStates{}

class ProgramSetupErrorEndState extends ProgramSetupStates{

  final String error;

  ProgramSetupErrorEndState(this.error);

}