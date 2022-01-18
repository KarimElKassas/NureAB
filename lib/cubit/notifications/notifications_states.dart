abstract class NotificationsStates{}

class NotificationsInitialState extends NotificationsStates{}

class NotificationsSuccessEndState extends NotificationsStates{}

class NotificationsErrorEndState extends NotificationsStates{

  final String error;

  NotificationsErrorEndState(this.error);

}