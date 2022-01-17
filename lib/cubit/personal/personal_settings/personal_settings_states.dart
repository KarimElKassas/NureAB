abstract class PersonalSettingsStates{}

class PersonalSettingsInitialState extends PersonalSettingsStates{}

class PersonalSettingsSuccessEndState extends PersonalSettingsStates{}

class PersonalSettingsErrorEndState extends PersonalSettingsStates{

  final String error;

  PersonalSettingsErrorEndState(this.error);

}