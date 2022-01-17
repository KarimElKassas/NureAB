abstract class BottomNavStates{}

class BottomNavInitialState extends BottomNavStates{}

class BottomNavChangeIndexState extends BottomNavStates{}

class BottomNavSuccessEndState extends BottomNavStates{}

class BottomNavErrorEndState extends BottomNavStates{

  final String error;

  BottomNavErrorEndState(this.error);

}