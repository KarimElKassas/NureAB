abstract class HomeStates{}

class HomeInitialState extends HomeStates{}

class HomeSuccessEndState extends HomeStates{}

class HomeErrorEndState extends HomeStates{

  final String error;

  HomeErrorEndState(this.error);

}