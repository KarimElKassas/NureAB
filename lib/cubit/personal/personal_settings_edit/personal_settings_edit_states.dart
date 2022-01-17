abstract class PersonalSettingsEditStates{}

class PersonalSettingsEditInitialState extends PersonalSettingsEditStates{}

class PersonalSettingsEditSuccessEndState extends PersonalSettingsEditStates{}

class PersonalSettingsEditErrorEndState extends PersonalSettingsEditStates{

  final String error;

  PersonalSettingsEditErrorEndState(this.error);

}