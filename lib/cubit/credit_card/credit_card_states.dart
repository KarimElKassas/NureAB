abstract class CreditCardStates{}

class CreditCardInitialState extends CreditCardStates{}

class CreditCardSuccessEndState extends CreditCardStates{}

class CreditCardErrorEndState extends CreditCardStates{

  final String error;

  CreditCardErrorEndState(this.error);

}