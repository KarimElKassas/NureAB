abstract class LoginStates{}

class LoginInitialState extends LoginStates{}

class LoginSuccessEndState extends LoginStates{}

class LoginErrorEndState extends LoginStates{

  final String error;

  LoginErrorEndState(this.error);

}