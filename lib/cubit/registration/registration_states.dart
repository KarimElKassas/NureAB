abstract class RegistrationStates{}

class RegistrationInitialState extends RegistrationStates{}

class RegistrationSuccessEndState extends RegistrationStates{}

class RegistrationErrorEndState extends RegistrationStates{

  final String error;

  RegistrationErrorEndState(this.error);

}