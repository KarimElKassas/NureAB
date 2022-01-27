abstract class PersonalSettingsStates{}

class PersonalSettingsInitialState extends PersonalSettingsStates{}

class PersonalSettingsSuccessGetDataState extends PersonalSettingsStates{}

class PersonalSettingsSuccessEndState extends PersonalSettingsStates{}

class PersonalSettingsErrorGetUserDataState extends PersonalSettingsStates{

  final String error;

  PersonalSettingsErrorGetUserDataState(this.error);

}