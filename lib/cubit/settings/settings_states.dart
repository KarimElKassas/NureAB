abstract class SettingsStates{}

class SettingsInitialState extends SettingsStates{}

class SettingsSuccessEndState extends SettingsStates{}

class SettingsErrorEndState extends SettingsStates{

  final String error;

  SettingsErrorEndState(this.error);

}