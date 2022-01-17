abstract class PrivacyStates{}

class PrivacyInitialState extends PrivacyStates{}

class PrivacySuccessEndState extends PrivacyStates{}

class PrivacyErrorEndState extends PrivacyStates{

  final String error;

  PrivacyErrorEndState(this.error);

}