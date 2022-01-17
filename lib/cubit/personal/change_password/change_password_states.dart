abstract class ChangePasswordStates{}

class ChangePasswordInitialState extends ChangePasswordStates{}

class ChangePasswordSuccessEndState extends ChangePasswordStates{}

class ChangePasswordErrorEndState extends ChangePasswordStates{

  final String error;

  ChangePasswordErrorEndState(this.error);

}