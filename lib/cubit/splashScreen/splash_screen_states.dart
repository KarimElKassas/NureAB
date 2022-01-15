abstract class SplashScreenStates{}

class SplashScreenInitialState extends SplashScreenStates{}

class SplashScreenSuccessEndState extends SplashScreenStates{}

class SplashScreenErrorEndState extends SplashScreenStates{

  final String error;

  SplashScreenErrorEndState(this.error);

}