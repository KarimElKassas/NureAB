abstract class WearDeviceStates{}

class WearDeviceInitialState extends WearDeviceStates{}

class WearDeviceChangePIPState extends WearDeviceStates{}

class WearDeviceChangeMCPState extends WearDeviceStates{}

class WearDeviceChangeThumbState extends WearDeviceStates{}

class WearDeviceSuccessEndState extends WearDeviceStates{}

class WearDeviceErrorEndState extends WearDeviceStates{

  final String error;

  WearDeviceErrorEndState(this.error);

}