abstract class ResetPasswordStates{}

class ResetPasswordInitialState extends ResetPasswordStates{}

class ResetPasswordSuccessEndState extends ResetPasswordStates{}

class ResetPasswordErrorEndState extends ResetPasswordStates{

  final String error;

  ResetPasswordErrorEndState(this.error);

}