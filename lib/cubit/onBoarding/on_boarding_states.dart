abstract class OnBoardingStates{}

class OnBoardingInitialState extends OnBoardingStates{}

class OnBoardingChangePageState extends OnBoardingStates{}

class OnBoardingSuccessEndState extends OnBoardingStates{}

class OnBoardingErrorEndState extends OnBoardingStates{

  final String error;

  OnBoardingErrorEndState(this.error);

}