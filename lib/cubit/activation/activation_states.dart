abstract class ActivationStates{}

class ActivationInitialState extends ActivationStates{}

class ActivationSuccessEndState extends ActivationStates{}

class ActivationErrorEndState extends ActivationStates{

  final String error;

  ActivationErrorEndState(this.error);

}