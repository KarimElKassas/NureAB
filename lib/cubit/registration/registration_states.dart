abstract class RegistrationStates{}

class RegistrationInitialState extends RegistrationStates{}

class RegistrationSuccessEndState extends RegistrationStates{}

class RegistrationLoadingCreateUserState extends RegistrationStates{}

class RegistrationSuccessCreateUserState extends RegistrationStates{}

class RegistrationSuccessSaveUserState extends RegistrationStates{}

class RegistrationErrorCreateUserState extends RegistrationStates{

  final String error;

  RegistrationErrorCreateUserState(this.error);

}

class RegistrationErrorSaveUserState extends RegistrationStates{

  final String error;

  RegistrationErrorSaveUserState(this.error);

}

class RegistrationErrorEndState extends RegistrationStates{

  final String error;

  RegistrationErrorEndState(this.error);

}