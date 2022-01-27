abstract class LoginStates{}

class LoginInitialState extends LoginStates{}

class LoginLoadingState extends LoginStates{}

class LoginLoadingGetUserDataState extends LoginStates{}

class LoginSuccessGetUserDataState extends LoginStates{}


class LoginSuccessState extends LoginStates{}

class LoginErrorGetUserDataState extends LoginStates{

  final String error;

  LoginErrorGetUserDataState(this.error);

}
class LoginErrorState extends LoginStates{

  final String error;

  LoginErrorState(this.error);

}