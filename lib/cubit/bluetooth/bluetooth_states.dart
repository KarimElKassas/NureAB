abstract class BluetoothStates{}

class BluetoothInitialState extends BluetoothStates{}

class BluetoothSuccessEndState extends BluetoothStates{}

class BluetoothErrorEndState extends BluetoothStates{

  final String error;

  BluetoothErrorEndState(this.error);

}